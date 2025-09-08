CREATE TABLE TestTypes (
    testtype_ID VARCHAR(50) NOT NULL PRIMARY KEY,
    code VARCHAR(50) NULL,
    name NVARCHAR(255) NULL,
    description NVARCHAR(MAX) NULL,
    unit VARCHAR(20) NULL
);




CREATE TABLE AssessmentBatch (
    batch_ID VARCHAR(50) NOT NULL PRIMARY KEY,
    code_name VARCHAR(50) NULL,
    description NVARCHAR(MAX) NULL,
    scheduled_at DATETIME NULL,
    status TINYINT NULL DEFAULT 0, -- 0: Pending, 1: Active, 2: Completed, 3: Cancelled
    created_at DATETIME NULL DEFAULT GETDATE(),
    updated_at DATETIME NULL DEFAULT GETDATE(),
    created_by UNIQUEIDENTIFIER NULL,
    manager_by UNIQUEIDENTIFIER NULL
);


CREATE TABLE AssessmentBatchStudent (
    ABS_ID VARCHAR(50) NOT NULL PRIMARY KEY,
    student_ID VARCHAR(50) NULL,
    batch_ID VARCHAR(50) NULL,
    
    -- Khóa ngoại
    CONSTRAINT FK_AssessmentBatchStudent_Batch 
        FOREIGN KEY (batch_ID) REFERENCES AssessmentBatch(batch_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
		FOREIGN KEY (student_ID) REFERENCES Students(student_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
		
);


CREATE TABLE AssessmentTests (
    testtype_ID VARCHAR(50) NULL,
    ABS_ID VARCHAR(50) NULL,
    code VARCHAR(50) NULL,
    unit VARCHAR(20) NULL,
    result_value VARCHAR(50) NULL,
    recorded_at DATETIME NULL DEFAULT GETDATE(),
    recorded_by UNIQUEIDENTIFIER NULL,
    
    -- Khóa chính composite
   
    
    -- Khóa ngoại
    CONSTRAINT FK_AssessmentTests_TestTypes 
        FOREIGN KEY (testtype_ID) REFERENCES TestTypes(testtype_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    CONSTRAINT FK_AssessmentTests_AssessmentBatchStudent 
        FOREIGN KEY (ABS_ID) REFERENCES AssessmentBatchStudent(ABS_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Department (
    department_code VARCHAR(50) NOT NULL PRIMARY KEY,
    battalion VARCHAR(1) NULL,
    course VARCHAR(1) NULL,
    character_code VARCHAR(1) NULL
);