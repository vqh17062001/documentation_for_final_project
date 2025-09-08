-- 1) Các action chung (xem, thêm, sửa, xóa)
INSERT INTO dbo.ACTIONS (action_ID, action_name, code, isActive)
VALUES
  ('READ',   N'Xem',   'READ',   1),
  ('CREATE', N'Thêm',  'CREATE', 1),
  ('UPDATE', N'Sửa',   'UPDATE', 1),
  ('DELETE', N'Xóa',   'DELETE', 1);

-- 2) Các action chỉ với dữ liệu của bản thân
INSERT INTO dbo.ACTIONS (action_ID, action_name, code, isActive)
VALUES
  ('READ_SELF',   N'Xem dữ liệu của bản thân',   'READ_SELF',   1),
  ('CREATE_SELF', N'Thêm dữ liệu của bản thân',  'CREATE_SELF', 1),
  ('UPDATE_SELF', N'Sửa dữ liệu của bản thân',   'UPDATE_SELF', 1),
  ('DELETE_SELF', N'Xóa dữ liệu của bản thân',   'DELETE_SELF', 1);

-- 3) Các action với dữ liệu của bản thân và những đối tượng được mình quản lý
INSERT INTO dbo.ACTIONS (action_ID, action_name, code, isActive)
VALUES
  ('READ_SELF_MANAGED',   N'Xem dữ liệu của bản thân và những đối tượng được mình quản lý',   'READ_SELF_MANAGED',   1),
  ('CREATE_SELF_MANAGED', N'Thêm dữ liệu của bản thân và những đối tượng được mình quản lý',  'CREATE_SELF_MANAGED', 1),
  ('UPDATE_SELF_MANAGED', N'Sửa dữ liệu của bản thân và những đối tượng được mình quản lý',   'UPDATE_SELF_MANAGED', 1),
  ('DELETE_SELF_MANAGED', N'Xóa dữ liệu của bản thân và những đối tượng được mình quản lý',   'DELETE_SELF_MANAGED', 1);
