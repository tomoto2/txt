SET @r_order_no = - 1;

-- 执行存储过程
CALL generate_order (
		'XF',
		'ff808081620467a0016204a7b5e4000c',
		'123456789',
		10,
		'Appid',
		'20180102040000',
		'20180102090000',
		'userid',
		'much_id',
		'openid',
		'sign',
		'v_nonce_str',
		'jsapi',
		100,
		'preid',
		'paid',
		'10',
		'cardid',
		'staffid',
		3,
		1,
		1,
		1,
		1,
		1,
		1,
		@r_order_no
);

-- 获取结果
SELECT
	@r_order_no;
	