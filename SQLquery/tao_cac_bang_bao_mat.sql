-- 1. Table ACTIONS
CREATE TABLE dbo.ACTIONS (
    action_ID     VARCHAR(50)    NOT NULL PRIMARY KEY,
    action_name   NVARCHAR(100)  NOT NULL,            -- gi? ??nh 100 ký t?
    code          VARCHAR(50)    NOT NULL,            -- gi? ??nh 50 ký t?
    isActive      bit            NOT NULL CONSTRAINT DF_ACTIONS_isActive DEFAULT(1)
);

-- 2. Table ENTITY
CREATE TABLE dbo.ENTITY (
    entity_ID      VARCHAR(50)   NOT NULL PRIMARY KEY,
    name_entity    NVARCHAR(100) NOT NULL,            -- gi? ??nh 100 ký t?
    level_security TINYINT       NOT NULL
);

-- 3. Table TIME_ACTIVE
CREATE TABLE dbo.TIME_ACTIVE (
    time_active_ID     VARCHAR(50) NOT NULL PRIMARY KEY,
    start_time         DATETIME    NOT NULL,
    end_time           DATETIME    NOT NULL,
    schedule_day_of_week  TINYINT  NULL,
    schedule_day_of_month TINYINT  NULL,
    schedule_day         DATE      NULL
);

-- 4. Table ROLES
CREATE TABLE dbo.ROLES (
    role_ID   VARCHAR(50)   NOT NULL PRIMARY KEY,
    role_name NVARCHAR(100) NOT NULL,            -- gi? ??nh 100 ký t?
    isActive  BIT           NOT NULL CONSTRAINT DF_ROLES_isActive DEFAULT(1)
);

-- 5. Table GROUPS
CREATE TABLE dbo.GROUPS (
    group_ID      VARCHAR(50)   NOT NULL PRIMARY KEY,
    group_name    NVARCHAR(100) NOT NULL,        -- gi? ??nh 100 ký t?
    time_active_ID VARCHAR(50)  NULL,
    isActive      BIT            NOT NULL CONSTRAINT DF_GROUPS_isActive DEFAULT(1),
    CONSTRAINT FK_GROUPS_TimeActive FOREIGN KEY(time_active_ID)
        REFERENCES dbo.TIME_ACTIVE(time_active_ID)
);

-- 6. Table GROUP_ROLES
CREATE TABLE dbo.GROUP_ROLES (
    group_ID VARCHAR(50)   NOT NULL,
    role_ID  VARCHAR(50)   NOT NULL,
    note     NVARCHAR(200) NULL,                   -- gi? ??nh 200 ký t?
    
    CONSTRAINT FK_GROUPROLES_Groups FOREIGN KEY(group_ID)
        REFERENCES dbo.GROUPS(group_ID),
    CONSTRAINT FK_GROUPROLES_Roles  FOREIGN KEY(role_ID)
        REFERENCES dbo.ROLES(role_ID)
);

-- 7. Table PERMISSIONS
CREATE TABLE dbo.PERMISSIONS (
    permission_ID  VARCHAR(50)   NOT NULL PRIMARY KEY,
    permission_name NVARCHAR(100) NOT NULL,        -- gi? ??nh 100 ký t?
    action_ID       VARCHAR(50)   NOT NULL,
    entity_ID       VARCHAR(50)   NOT NULL,
    time_active_ID  VARCHAR(50)   NULL,
    role_ID         VARCHAR(50)   NULL,
    isActive        BIT           NOT NULL CONSTRAINT DF_PERMISSIONS_isActive DEFAULT(1),
    CONSTRAINT FK_PERMS_Actions    FOREIGN KEY(action_ID)
        REFERENCES dbo.ACTIONS(action_ID),
    CONSTRAINT FK_PERMS_Entity     FOREIGN KEY(entity_ID)
        REFERENCES dbo.ENTITY(entity_ID),
    CONSTRAINT FK_PERMS_TimeActive FOREIGN KEY(time_active_ID)
        REFERENCES dbo.TIME_ACTIVE(time_active_ID),
    CONSTRAINT FK_PERMS_Roles      FOREIGN KEY(role_ID)
        REFERENCES dbo.ROLES(role_ID)
);

-- 8. Table USERS


CREATE TABLE dbo.USERS
(
    -- Khóa chính tự sinh GUID
    user_ID UNIQUEIDENTIFIER NOT NULL
      CONSTRAINT DF_USERS_user_ID DEFAULT NEWSEQUENTIALID(),

    user_name     VARCHAR(200)    NOT NULL,
    password_hash VARCHAR(200)    NOT NULL,
    full_name     NVARCHAR(200)   NULL,
    phone_number  VARCHAR(20)     NULL,
    department    NVARCHAR(100)   NULL,

    user_status   TINYINT         NOT NULL
      CONSTRAINT DF_USERS_user_status DEFAULT(1),

    -- Đổi manage_by thành UNIQUEIDENTIFIER để FK self-reference
    manage_by     UNIQUEIDENTIFIER NULL,
    
    level_security TINYINT        NOT NULL
      CONSTRAINT DF_USERS_level_security DEFAULT(1),

    create_at     DATETIME        NOT NULL
      CONSTRAINT DF_USERS_create_at DEFAULT(GETDATE()),
    update_at     DATETIME        NULL,

    group_ID      VARCHAR(50)     NULL,

    -- PRIMARY KEY
    CONSTRAINT PK_USERS PRIMARY KEY CLUSTERED (user_ID),

    -- Foreign keys
    CONSTRAINT FK_USERS_Manager FOREIGN KEY(manage_by)
        REFERENCES dbo.USERS(user_ID),
    CONSTRAINT FK_USERS_Groups  FOREIGN KEY(group_ID)
        REFERENCES dbo.GROUPS(group_ID)
);


-- 9. Table ROLE_USERS
CREATE TABLE dbo.ROLE_USERS (
    role_ID VARCHAR(50) NOT NULL,
    user_ID UNIQUEIDENTIFIER NOT NULL,
    
    CONSTRAINT FK_ROLEUSERS_Roles FOREIGN KEY(role_ID)
        REFERENCES dbo.ROLES(role_ID),
    CONSTRAINT FK_ROLEUSERS_Users FOREIGN KEY(user_ID)
        REFERENCES dbo.USERS(user_ID)
);

-- 10. Table LOGIN_HISTORYs
CREATE TABLE dbo.LOGIN_HISTORYs (
    login_his_ID VARCHAR(50) NOT NULL PRIMARY KEY,
    user_ID      UNIQUEIDENTIFIER NOT NULL,
    login_time   DATETIME    NOT NULL,
    logout_time  DATETIME    NULL,
    mac_device   VARCHAR(50) NULL,     -- gi? ??nh 50 ký t?
    ip_address   VARCHAR(50) NULL,     -- gi? ??nh 50 ký t?
    status_login TINYINT    NOT NULL CONSTRAINT DF_LOGINH_status_login DEFAULT(1),
    CONSTRAINT FK_LOGINH_Users FOREIGN KEY(user_ID)
        REFERENCES dbo.USERS(user_ID)
);

-- 11. Table AUDIT_LOGs
CREATE TABLE dbo.AUDIT_LOGs (
    audit_log_ID  VARCHAR(50)   NOT NULL PRIMARY KEY,
    entity_ID     VARCHAR(50)   NOT NULL,
    login_his_ID  VARCHAR(50)   NOT NULL,
    time_start    DATETIME      NOT NULL,
    time_end      DATETIME      NULL,
    data_before   NVARCHAR(MAX) NULL,  -- dùng MAX ?? l?u v?n b?n dài
    data_after    NVARCHAR(MAX) NULL,
    CONSTRAINT FK_AUDIT_Entity       FOREIGN KEY(entity_ID)
        REFERENCES dbo.ENTITY(entity_ID),
    CONSTRAINT FK_AUDIT_LoginHistory FOREIGN KEY(login_his_ID)
        REFERENCES dbo.LOGIN_HISTORYs(login_his_ID)
);



