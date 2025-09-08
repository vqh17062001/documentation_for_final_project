INSERT INTO dbo.PERMISSIONS 
    (permission_ID, permission_name, action_ID, entity_ID, role_ID, isActive)
SELECT
    -- PERM_EntityID_ActionID_20250714   
      + e.entity_ID + '_' 
      + a.action_ID + '_' 
	  +	'ADMIN' 									    AS permission_ID,
    a.action_name + N' ' + e.name_entity                AS permission_name,
    a.action_ID, 
    e.entity_ID,
    'ADMIN'                                             AS role_ID,
    1                                                   AS isActive
FROM dbo.ENTITY    AS e
CROSS JOIN dbo.ACTIONS AS a
WHERE a.action_ID IN ('READ','CREATE','UPDATE','DELETE')
	and e.type = 'table'
   AND NOT EXISTS (
      SELECT 1 
      FROM dbo.PERMISSIONS p
      WHERE p.permission_ID = e.entity_ID + '_' + a.action_ID + '_ADMIN'
  );



  INSERT INTO dbo.PERMISSIONS 
    (permission_ID, permission_name, action_ID, entity_ID, role_ID, isActive)
SELECT
    -- PERM_EntityID_ActionID_20250714
     
    e.entity_ID+'_'+ a.action_ID + '_'+'ADMIN'   AS permission_ID,
			
											
    a.action_name + N' ' + e.name_entity                AS permission_name,
    a.action_ID, 
    e.entity_ID,
    'ADMIN'                                             AS role_ID,
    1                                                   AS isActive
FROM dbo.ENTITY    AS e
CROSS JOIN dbo.ACTIONS AS a
WHERE a.action_ID IN ('ACCESS')
	and e.type = 'page'
   AND NOT EXISTS (
      SELECT 1 
      FROM dbo.PERMISSIONS p
      WHERE p.permission_ID = e.entity_ID + '_' + a.action_ID +'_ADMIN'
  );
