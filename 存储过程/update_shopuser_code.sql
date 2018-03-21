DELIMITER //  
DROP PROCEDURE
IF EXISTS `update_shopuser_code`; 
CREATE PROCEDURE `update_shopuser_code` (
	IN  v_order_no_pre CHAR (2),
	IN  v_shop_user_id VARCHAR (36),
	IN  v_ts_user_id VARCHAR (36),
	OUT user_card_code VARCHAR (25)
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
									rf_shop_user
								WHERE
									user_card_code = vv
								AND ts_user_id = v_ts_user_id INTO cc ;
								IF cc < 1 THEN

								SET i = 1000000 ;
								END
								IF ;
								END
								WHILE ;
								SET user_card_code = vv ; 
						UPDATE rf_shop_user
												SET user_card_code = user_card_code
											WHERE
												id = v_shop_user_id ;
             SELECT
										row_count() INTO i ;
									IF (i < 1) THEN
										ROLLBACK ;
									SET user_card_code = - 1 ;
									ELSE
										COMMIT ;
									END
									IF ;
									END //  
DELIMITER ; 




	
	