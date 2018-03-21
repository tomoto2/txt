DELIMITER //  
DROP PROCEDURE
IF EXISTS `generate_order`; 
CREATE PROCEDURE `generate_order` (
	IN  v_order_no_pre CHAR (2),
	IN  v_shop_id VARCHAR (36),
	IN  v_out_trade_no  VARCHAR (50),
	IN  v_total_fee  INT ,
	IN  v_appid  VARCHAR (32),
	IN	v_time_start  VARCHAR (20),
	IN	v_time_expire  VARCHAR (20),
	IN	v_userid  VARCHAR (36),
	IN	v_mch_id  VARCHAR (36),
	IN	v_openid  VARCHAR (36),
	IN	v_sign  VARCHAR (36),
	IN	v_nonce_str  VARCHAR (36),
	IN	v_trade_type  VARCHAR (36),
	IN	v_order_fee  int,
	IN	v_prepay_id  VARCHAR (36),
	IN	v_result_code  VARCHAR (36),
	IN	v_points  VARCHAR (36),
	IN	v_card_id  VARCHAR (36),
	IN	v_staff_id  VARCHAR (36),
	IN	v_pay_way  INT,
	IN	v_pay_path  int,
	IN	v_card_reduce_money  INT,
	IN	v_random_money  INT,
	IN	v_full_reduce_money  INT ,
	IN	v_point_reduce_money  INT ,
	IN	v_type  INT,
	IN	v_create_date VARCHAR (36),
	OUT r_order_no VARCHAR (25)
)
BEGIN
	DECLARE
		currentDate VARCHAR (15) ; DECLARE
			maxNo INT DEFAULT 0 ; DECLARE
				oldOrderNo VARCHAR (25) DEFAULT '' ; DECLARE
					i INT DEFAULT 0 ; DECLARE
						cc INT DEFAULT 0 ; DECLARE
							vv VARCHAR (25) DEFAULT '' ; SELECT
								DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO currentDate ;
							SET i = 0 ;
							WHILE i < 99999 DO

							SET i = i + 1 ; SELECT
								CONCAT(
									v_order_no_pre,
									currentDate,
									LPAD((CAST(i AS CHAR)), 5, '0')
								) INTO vv ; SELECT
									COUNT(id)
								FROM
									rf_order
								WHERE
									r_order_no = vv
								AND shop_id = v_shop_id INTO cc ;
								IF cc < 1 THEN

								SET i = 1000000 ;
								END
								IF ;
								END
								WHILE ;
								SET r_order_no = vv ; INSERT IGNORE INTO rf_order (
								`id`,
							   order_no,
								 out_trade_no,
								 total_fee,
								`appid`,
								`time_start`,
								`time_expire`,
								`userid`,
								`mch_id`,
								`openid`,
								`sign`,
								`nonce_str`,
								`trade_type`,
								`order_fee`,
								`create_date`,
								`shop_id`,
								`prepay_id`,
								`result_code`,
								 points,
								`card_id`,
								`staff_id`,
								`pay_way`,
								 pay_path,
								 card_reduce_money,
								`random_money`,
								`full_reduce_money`,
								 point_reduce_money,
								 type

								)
								VALUES
								(
									REPLACE (uuid(), '-', ''),
									r_order_no,
						      v_out_trade_no,
								  v_total_fee,
								  v_appid,
									v_time_start,
									v_time_expire,
									v_userid,
									v_mch_id,
									v_openid,
									v_sign,
									v_nonce_str,
									v_trade_type,
									v_order_fee,
-- 									date_format(now(), '%Y-%c-%d %h:%i:%s'),
									v_create_date,
									v_shop_id,
									v_prepay_id,
									v_result_code,
									v_points,
									v_card_id,
									v_staff_id,
									v_pay_way,
									v_pay_path,
							    v_card_reduce_money,
									v_random_money,
									v_full_reduce_money,
									v_point_reduce_money,
									v_type
									) ; SELECT
										row_count() INTO i ;
									IF (i < 1) THEN
										ROLLBACK ;
									SET r_order_no = - 1 ;
									ELSE
										COMMIT ;
									END
									IF ;
									END //  
DELIMITER ; 




	
	