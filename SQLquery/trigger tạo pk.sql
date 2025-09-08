CREATE TRIGGER trg_permissionsID_before_insert
ON PERMISSIONS
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO PERMISSIONS (
        permission_ID,
        permission_name,
        action_ID,
        entity_ID,
        role_ID,
        isActive
    )
    SELECT 
        CONCAT(
            ISNULL(action_ID, ''), 
            '_', 
            ISNULL(entity_ID, ''), 
            '_', 
            ISNULL(role_ID, '')
        ) AS permission_ID,
        permission_name,
        action_ID,
        entity_ID,
        role_ID,
        isActive
    FROM inserted;
END;




CREATE TRIGGER trg_roleID_before_insert
ON ROLES
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO ROLES (
        role_ID,
        role_name,
        isActive
    )
    SELECT 
        dbo.fn_RemoveVietnameseDiacritics(REPLACE(role_name, ' ', '')) AS role_ID,
        role_name,
        isActive
    FROM inserted;
END;


CREATE FUNCTION dbo.fn_RemoveVietnameseDiacritics(@input NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX) = @input;
    
    -- Loại bỏ dấu các ký tự tiếng Việt
    SET @result = REPLACE(@result, N'à', 'a');
    SET @result = REPLACE(@result, N'á', 'a');
    SET @result = REPLACE(@result, N'ạ', 'a');
    SET @result = REPLACE(@result, N'ả', 'a');
    SET @result = REPLACE(@result, N'ã', 'a');
    SET @result = REPLACE(@result, N'â', 'a');
    SET @result = REPLACE(@result, N'ầ', 'a');
    SET @result = REPLACE(@result, N'ấ', 'a');
    SET @result = REPLACE(@result, N'ậ', 'a');
    SET @result = REPLACE(@result, N'ẩ', 'a');
    SET @result = REPLACE(@result, N'ẫ', 'a');
    SET @result = REPLACE(@result, N'ă', 'a');
    SET @result = REPLACE(@result, N'ằ', 'a');
    SET @result = REPLACE(@result, N'ắ', 'a');
    SET @result = REPLACE(@result, N'ặ', 'a');
    SET @result = REPLACE(@result, N'ẳ', 'a');
    SET @result = REPLACE(@result, N'ẵ', 'a');
    
    SET @result = REPLACE(@result, N'è', 'e');
    SET @result = REPLACE(@result, N'é', 'e');
    SET @result = REPLACE(@result, N'ẹ', 'e');
    SET @result = REPLACE(@result, N'ẻ', 'e');
    SET @result = REPLACE(@result, N'ẽ', 'e');
    SET @result = REPLACE(@result, N'ê', 'e');
    SET @result = REPLACE(@result, N'ề', 'e');
    SET @result = REPLACE(@result, N'ế', 'e');
    SET @result = REPLACE(@result, N'ệ', 'e');
    SET @result = REPLACE(@result, N'ể', 'e');
    SET @result = REPLACE(@result, N'ễ', 'e');
    
    SET @result = REPLACE(@result, N'ì', 'i');
    SET @result = REPLACE(@result, N'í', 'i');
    SET @result = REPLACE(@result, N'ị', 'i');
    SET @result = REPLACE(@result, N'ỉ', 'i');
    SET @result = REPLACE(@result, N'ĩ', 'i');
    
    SET @result = REPLACE(@result, N'ò', 'o');
    SET @result = REPLACE(@result, N'ó', 'o');
    SET @result = REPLACE(@result, N'ọ', 'o');
    SET @result = REPLACE(@result, N'ỏ', 'o');
    SET @result = REPLACE(@result, N'õ', 'o');
    SET @result = REPLACE(@result, N'ô', 'o');
    SET @result = REPLACE(@result, N'ồ', 'o');
    SET @result = REPLACE(@result, N'ố', 'o');
    SET @result = REPLACE(@result, N'ộ', 'o');
    SET @result = REPLACE(@result, N'ổ', 'o');
    SET @result = REPLACE(@result, N'ỗ', 'o');
    SET @result = REPLACE(@result, N'ơ', 'o');
    SET @result = REPLACE(@result, N'ờ', 'o');
    SET @result = REPLACE(@result, N'ớ', 'o');
    SET @result = REPLACE(@result, N'ợ', 'o');
    SET @result = REPLACE(@result, N'ở', 'o');
    SET @result = REPLACE(@result, N'ỡ', 'o');
    
    SET @result = REPLACE(@result, N'ù', 'u');
    SET @result = REPLACE(@result, N'ú', 'u');
    SET @result = REPLACE(@result, N'ụ', 'u');
    SET @result = REPLACE(@result, N'ủ', 'u');
    SET @result = REPLACE(@result, N'ũ', 'u');
    SET @result = REPLACE(@result, N'ư', 'u');
    SET @result = REPLACE(@result, N'ừ', 'u');
    SET @result = REPLACE(@result, N'ứ', 'u');
    SET @result = REPLACE(@result, N'ự', 'u');
    SET @result = REPLACE(@result, N'ử', 'u');
    SET @result = REPLACE(@result, N'ữ', 'u');
    
    SET @result = REPLACE(@result, N'ỳ', 'y');
    SET @result = REPLACE(@result, N'ý', 'y');
    SET @result = REPLACE(@result, N'ỵ', 'y');
    SET @result = REPLACE(@result, N'ỷ', 'y');
    SET @result = REPLACE(@result, N'ỹ', 'y');
    
    SET @result = REPLACE(@result, N'đ', 'd');
    
    -- Chuyển thành chữ hoa
    SET @result = UPPER(@result);
    
    -- Loại bỏ khoảng cách
    SET @result = REPLACE(@result, ' ', '');
    
    RETURN @result;
END;


CREATE TRIGGER trg_groupID_before_insert
ON GROUPS
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO GROUPS (
        group_ID,
        group_name,
        time_active_ID,
        isActive
    )
    SELECT 
        dbo.fn_RemoveVietnameseDiacritics(REPLACE(group_name, ' ', '')) AS group_ID,
        group_name,
        time_active_ID,
        isActive
    FROM inserted;
END;

CREATE TRIGGER trg_batchID_before_insert
ON AssessmentBatch
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AssessmentBatch (
        batch_ID,
        code_name,
        description,
      
        status,
        created_at,
        updated_at,
        created_by,
        manager_by
    )
    SELECT 
        CONCAT(
            dbo.fn_RemoveVietnameseDiacritics(REPLACE(ISNULL(code_name, ''), ' ', '')),
            '_',
            FORMAT(GETDATE(), 'yyyyMMddHHmmss')
        ) AS batch_ID,
        code_name,
        ISNULL(description, '') AS description,
        ISNULL(status, 0) AS status,
        ISNULL(created_at, GETDATE()) AS created_at,
        ISNULL(updated_at, GETDATE()) AS updated_at,
        created_by,
        manager_by
    FROM inserted;
END;


CREATE TRIGGER trg_absID_before_insert
ON AssessmentBatchStudent
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO AssessmentBatchStudent (
        ABS_ID,
        student_ID,
        batch_ID
    )
    SELECT 
        CONCAT(
            ISNULL(student_ID, ''),
            '_',
            ISNULL(batch_ID, '')
        ) AS ABS_ID,
        student_ID,
        batch_ID
    FROM inserted;
END;





CREATE TRIGGER trg_departmentCode_before_insert_safe
ON Department
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Department (
        department_code,
        battalion,
        course,
        character_code
    )
    SELECT 
        UPPER(CONCAT(
            ISNULL(LTRIM(RTRIM(battalion)), ''),
            ISNULL(LTRIM(RTRIM(course)), ''),
            ISNULL(LTRIM(RTRIM(character_code)), '')
        )) AS department_code,
        ISNULL(battalion, '') AS battalion,
        ISNULL(course, '') AS course,
        ISNULL(character_code, '') AS character_code
    FROM inserted;
END;
