INSERT INTO [dbo].[Department] ([battalion], [course], [character_code])
VALUES
    -- Battalion 1
    ('1', '55', NULL),
    ('1', '56', NULL),
    ('1', '57', NULL),
    ('1', '58', NULL),
    ('1', '59', NULL),
    ('1', '60', NULL),
    ('1', '61', NULL),

    -- Battalion 2
    ('2', '55', NULL),
    ('2', '56', 'A'),
    ('2', '56', 'B'),

    ('2', '57', 'A'),
    ('2', '57', 'B'),

    ('2', '58', NULL),
    ('2', '59', NULL),
    ('2', '60', NULL),
    ('2', '61', NULL),

    -- Battalion 3
    ('3', '55', NULL),
    ('3', '56', NULL),
    ('3', '57', NULL),
    ('3', '58', NULL),
    ('3', '59', NULL),
    ('3', '60', NULL),
    ('3', '61', NULL),

    -- Battalion 4
    ('4', '55', NULL),
    ('4', '56', NULL),
    ('4', '57', NULL),
    ('4', '58', NULL),
    ('4', '59', NULL),
    ('4', '60', NULL),
    ('4', '61', NULL);

	DELETE FROM [dbo].[Department];
