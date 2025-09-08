/* 1. Bảng Students */
CREATE TABLE dbo.Students (
    student_ID   VARCHAR(50)   NOT NULL PRIMARY KEY,
    name         NVARCHAR(200) NOT NULL,
    dob          VARCHAR(10)    NULL,
    gender       VARCHAR(6)    NULL,
    phone        VARCHAR(20)   NULL,
    email        VARCHAR(50)   NULL,
    status       TINYINT       NOT NULL
                   CONSTRAINT DF_Students_status    DEFAULT(1),
    created_at   DATETIME      NOT NULL
                   CONSTRAINT DF_Students_created_at DEFAULT(GETDATE()),
    update_at    DATETIME      NULL,
    created_by   UNIQUEIDENTIFIER   NULL,
    manage_by    UNIQUEIDENTIFIER   NULL,

    CONSTRAINT FK_Students_CreatedBy FOREIGN KEY(created_by) REFERENCES dbo.USERS(user_ID),
    CONSTRAINT FK_Students_ManageBy  FOREIGN KEY(manage_by)  REFERENCES dbo.USERS(user_ID)
);
GO

/* 2. Bảng AssessmentBatchStudent */
CREATE TABLE dbo.AssessmentBatchStudent (
    batch_ID      VARCHAR(50)   NOT NULL PRIMARY KEY,
    student_ID    VARCHAR(50)   NOT NULL,
    code_name     VARCHAR(20)   NULL,
    description   NVARCHAR(200) NULL,
    scheduled_at  DATETIME      NULL,
    status        TINYINT       NOT NULL
                     CONSTRAINT DF_ABS_status       DEFAULT(1),
    created_at    DATETIME      NOT NULL
                     CONSTRAINT DF_ABS_created_at   DEFAULT(GETDATE()),
    update_at     DATETIME      NULL,
    created_by    UNIQUEIDENTIFIER   NULL,
    manage_by     UNIQUEIDENTIFIER   NULL,

    CONSTRAINT FK_ABS_Students    FOREIGN KEY(student_ID)  REFERENCES dbo.Students(student_ID),
    CONSTRAINT FK_ABS_CreatedBy   FOREIGN KEY(created_by)  REFERENCES dbo.USERS(user_ID),
    CONSTRAINT FK_ABS_ManageBy    FOREIGN KEY(manage_by)   REFERENCES dbo.USERS(user_ID)
);
GO

/* 3. Bảng AssessmentTests */
CREATE TABLE dbo.AssessmentTests (
    test_ID       VARCHAR(50)   NOT NULL PRIMARY KEY,
    batch_ID      VARCHAR(50)   NOT NULL,
    test_code     VARCHAR(50)   NULL,
    name          NVARCHAR(200) NULL,
    description   NVARCHAR(200) NULL,
    unit          VARCHAR(20)   NULL,
    result_value  VARCHAR(50)   NULL,
    recorded_at   DATETIME      NULL,

    CONSTRAINT FK_AssessmentTests_Batch FOREIGN KEY(batch_ID)
        REFERENCES dbo.AssessmentBatchStudent(batch_ID)
);
GO

/* 4. Bảng SleepSession */
CREATE TABLE dbo.SleepSession (
    sleep_session_ID VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID       VARCHAR(50) NOT NULL,
    start_time       DATETIME    NULL,
    end_time         DATETIME    NULL,
    total_minutes    TINYINT     NULL,

    CONSTRAINT FK_SleepSession_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO

/* 5. Bảng SleepStage */
CREATE TABLE dbo.SleepStage (
    ID               VARCHAR(50) NOT NULL PRIMARY KEY,
    sleep_session_ID VARCHAR(50) NOT NULL,
    stage            TINYINT     NULL,
    start_time       DATETIME    NULL,
    duration_minutes TINYINT     NULL,

    CONSTRAINT FK_SleepStage_Session FOREIGN KEY(sleep_session_ID)
        REFERENCES dbo.SleepSession(sleep_session_ID)
);
GO

/* 6. Bảng Exercise */
CREATE TABLE dbo.Exercise (
    ID               VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID       VARCHAR(50) NOT NULL,
    start_time       DATETIME    NOT NULL,
    end_time         DATETIME    NULL,
    duration_minutes TINYINT     NULL,
    type             VARCHAR(20) NULL,
    title            VARCHAR(50) NULL,
    calories         VARCHAR(6)  NULL,
    distance_m       VARCHAR(10) NULL,
    steps            VARCHAR(10) NULL,

    CONSTRAINT FK_Exercise_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO

/* 7. Bảng BodyMetrics */
CREATE TABLE dbo.BodyMetrics (
    ID           VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID   VARCHAR(50) NOT NULL,
    time_stamp   DATETIME    NOT NULL,
    height_cm    VARCHAR(3)  NULL,
    weight_kg    VARCHAR(3)  NULL,
    temperature_C VARCHAR(2) NULL,

    CONSTRAINT FK_BodyMetrics_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO

/* 8. Bảng DailyActivity */
CREATE TABLE dbo.DailyActivity (
    ID               VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID       VARCHAR(50) NOT NULL,
    activity_date    DATE        NOT NULL,
    activity_minutes VARCHAR(20) NULL,
    type             VARCHAR(50) NULL,
    title            NVARCHAR(200) NULL,
    calories         VARCHAR(6)  NULL,
    steps            VARCHAR(10) NULL,
    created_at       DATETIME     NOT NULL
                      CONSTRAINT DF_DailyActivity_created_at DEFAULT(GETDATE()),

    CONSTRAINT FK_DailyActivity_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO

/* 9. Bảng Environment */
CREATE TABLE dbo.Environment (
    ID             VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID     VARCHAR(50) NOT NULL,
    time_stamp     DATETIME    NOT NULL,
    temperature_C  VARCHAR(2)  NULL,
    humidity_RH    VARCHAR(2)  NULL,
    uv_index_mw_cm2 VARCHAR(2) NULL,

    CONSTRAINT FK_Environment_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO

/* 10. Bảng PhysiologicalMetrics */
CREATE TABLE dbo.PhysiologicalMetrics (
    ID           VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID   VARCHAR(50) NOT NULL,
    measured_at  DATETIME    NOT NULL,
    metric_type  VARCHAR(20) NULL,
    metric_value VARCHAR(20) NULL,
    metric_unit  VARCHAR(10) NULL,
    created_at   DATETIME    NOT NULL
                   CONSTRAINT DF_PhysiologicalMetrics_created_at DEFAULT(GETDATE()),

    CONSTRAINT FK_PhysiologicalMetrics_Students FOREIGN KEY(student_ID)
        REFERENCES dbo.Students(student_ID)
);
GO
