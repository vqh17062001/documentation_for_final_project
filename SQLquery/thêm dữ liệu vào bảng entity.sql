INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security,type)
SELECT 
    TABLE_NAME,            -- làm khóa chính
    TABLE_NAME,            -- tên hiện thị
    1,
	'table'	
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE   = 'BASE TABLE'
  AND TABLE_SCHEMA = 'dbo'
  -- nếu chỉ muốn những bảng chưa tồn tại trong ENTITY:
  AND TABLE_NAME NOT IN (SELECT entity_ID FROM dbo.ENTITY);




-- AccountAuthManage
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('AddGroup', 'AddGroup', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('AddRole', 'AddRole', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('AddUser', 'AddUser', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('EditGroup', 'EditGroup', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('EditRole', 'EditRole', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('EditUser', 'EditUser', 1, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('MainViewAccount', 'MainViewAccount', 1, 'page');

-- AssessmentBatch
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('AddAssessmentBatch', 'AddAssessmentBatch', 2, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('EditAssessmentBatch', 'EditAssessmentBatch', 2, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('MainViewAssBath', 'MainViewAssBath', 2, 'page');

-- DalyHealth
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('DetailHealthStudent', 'DetailHealthStudent', 2, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('MainViewDalyHealth', 'MainViewDalyHealth', 2, 'page');

-- Login
-- Không insert login nếu không muốn phân quyền cho page login
-- INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('Login', 'Login', 0, 'page');

-- StudentManage
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('AddStudent', 'AddStudent', 2, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('EditStudent', 'EditStudent', 2, 'page');
INSERT INTO dbo.ENTITY (entity_ID, name_entity, level_security, type) VALUES ('MainViewStudent', 'MainViewStudent', 2, 'page');
