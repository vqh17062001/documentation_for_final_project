USE [HealthWebDB]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserEffectivePermissions]    Script Date: 31/07/2025 15:24:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_GetUserEffectivePermissions]
    @user_ID UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy level security của user
    DECLARE @user_level_security TINYINT;

    SELECT @user_level_security = level_security
    FROM dbo.USERS
    WHERE user_ID = @user_ID;

    -- Lấy tất cả các role mà user sở hữu: trực tiếp hoặc qua group
    ;WITH UserRoles AS (
        -- Vai trò trực tiếp
        SELECT dbo.ROLES.role_ID
        FROM dbo.ROLE_USERS Join dbo.ROLES
		on dbo.ROLE_USERS.role_ID = dbo.ROLES.role_ID
        WHERE dbo.ROLE_USERS.user_ID = @user_ID
		And dbo.ROLES.isActive = 1 
		

        UNION

        -- Vai trò qua GROUP
        SELECT gr.role_ID
        FROM dbo.USERS u
        JOIN dbo.GROUP_ROLES gr ON u.group_ID = gr.group_ID
        WHERE u.user_ID = @user_ID
		
    )

    SELECT 
        p.action_ID,
        p.entity_ID,
        e.level_security AS entity_security_level,
        p.role_ID,
        p.isActive
    FROM UserRoles ur
    JOIN dbo.PERMISSIONS p ON ur.role_ID = p.role_ID
    JOIN dbo.ENTITY e ON p.entity_ID = e.entity_ID
    WHERE 
        p.isActive = 1
        AND e.level_security >= @user_level_security
END




EXEC dbo.usp_GetUserEffectivePermissions @user_ID = '3021F0B1-3817-4685-B27D-1C5C35A60B7A';
