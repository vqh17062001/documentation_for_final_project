INSERT INTO [dbo].[Students]
    ([student_ID], [name], [dob], [gender], [phone], [email], [status], [created_at], [update_at], [created_by], [manage_by], [department])
VALUES
    (NEWID(), N'Student 01', '2001-01-01', 'Male', '0901000001', 'student01@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 02', '2001-02-02', 'Female', '0901000002', 'student02@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 03', '2001-03-03', 'Male', '0901000003', 'student03@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 04', '2001-04-04', 'Female', '0901000004', 'student04@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 05', '2001-05-05', 'Male', '0901000005', 'student05@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 06', '2001-06-06', 'Female', '0901000006', 'student06@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 07', '2001-07-07', 'Male', '0901000007', 'student07@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 08', '2001-08-08', 'Female', '0901000008', 'student08@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 09', '2001-09-09', 'Male', '0901000009', 'student09@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 10', '2001-10-10', 'Female', '0901000010', 'student10@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 11', '2001-11-11', 'Male', '0901000011', 'student11@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 12', '2001-12-12', 'Female', '0901000012', 'student12@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 13', '2001-01-13', 'Male', '0901000013', 'student13@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 14', '2001-02-14', 'Female', '0901000014', 'student14@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 15', '2001-03-15', 'Male', '0901000015', 'student15@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 16', '2001-04-16', 'Female', '0901000016', 'student16@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 17', '2001-05-17', 'Male', '0901000017', 'student17@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 18', '2001-06-18', 'Female', '0901000018', 'student18@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 19', '2001-07-19', 'Male', '0901000019', 'student19@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL),
    (NEWID(), N'Student 20', '2001-08-20', 'Female', '0901000020', 'student20@example.com', 0, GETDATE(), NULL, 'F17B574F-8760-F011-8364-EC2E98C82C07', NULL, NULL);
