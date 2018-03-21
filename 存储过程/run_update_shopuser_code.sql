SET @user_card_code = - 1;

-- 执行存储过程
CALL update_shopuser_code (
		'XF',
		'402883ca620855770162087d22090010',
		'4028838a61d118b40161d127d9b30011',
@user_card_code
);

-- 获取结果
SELECT
	@user_card_code;
	