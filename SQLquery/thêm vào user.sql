-- Chèn user mới với 4 giá trị bạn cung cấp
INSERT INTO dbo.USERS (user_name, password_hash, full_name, phone_number)
OUTPUT
  inserted.user_ID,
  inserted.user_status,
  inserted.level_security,
  inserted.create_at,
  inserted.update_at,
  inserted.manage_by,
  inserted.group_ID
VALUES (
  'vqh17062001',            -- user_name
  'Qnvn16062001@',          -- password_hash
  N'Võ Quốc Huy',           -- full_name
  '0945047862'              -- phone_number
);
