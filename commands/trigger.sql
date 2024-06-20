DELIMITER $$

CREATE TRIGGER after_payment_insert
AFTER INSERT ON `mydb`.`payments`
FOR EACH ROW
BEGIN
  -- Обновляем баланс пользователя
  UPDATE `mydb`.`users`
  SET balance = balance + NEW.replenishment
  WHERE id = NEW.users_id;
END$$

DELIMITER ;
