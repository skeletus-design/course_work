DELIMITER $$

CREATE PROCEDURE AddPayment(IN userId INT, IN employeeId INT, IN amount DECIMAL(10,2))
BEGIN
    DECLARE currentBalance DECIMAL(10,2);
    DECLARE maxLimit DECIMAL(10,2) DEFAULT 10000.00; -- Устанавливаем лимит пополнения

    -- Начало транзакции
    START TRANSACTION;

    -- Получаем текущий баланс пользователя
    SELECT balance INTO currentBalance FROM `mydb`.`users` WHERE id = userId FOR UPDATE;

    -- Проверяем, не превышает ли пополнение лимит
    IF currentBalance + amount <= maxLimit THEN
        -- Вставляем запись в таблицу payments
        INSERT INTO `mydb`.`payments` (`replenishment`, `users_id`, `employees_id`)
        VALUES (amount, userId, employeeId);
        
        -- Фиксируем транзакцию
        COMMIT;
    ELSE
        -- Откатываем транзакцию, если условие не выполнено
        ROLLBACK;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE CreateSession(
    IN userId INT,
    IN employeeId INT,
    IN computerId INT,
    IN sessionDurationHours DECIMAL(5,2)
)
BEGIN
    DECLARE computerPricePerHour DECIMAL(10,2);
    DECLARE userBalance DECIMAL(10,2);
    DECLARE userBonusBalance DECIMAL(10,2);
    DECLARE totalCost DECIMAL(10,2);

    -- Начало транзакции
    START TRANSACTION;

    -- Получаем стоимость компьютера в час
    SELECT price_per_hours INTO computerPricePerHour 
    FROM `mydb`.`computers` 
    WHERE id = computerId 
    FOR UPDATE;

    -- Получаем текущий баланс пользователя
    SELECT balance, bonuce_balance INTO userBalance, userBonusBalance 
    FROM `mydb`.`users` 
    WHERE id = userId 
    FOR UPDATE;

    -- Рассчитываем общую стоимость сессии
    SET totalCost = computerPricePerHour * sessionDurationHours;

    -- Проверяем, достаточно ли средств на счету пользователя
    IF (userBalance + userBonusBalance) >= totalCost THEN
        -- Вставляем новую запись в таблицу sessions
        INSERT INTO `mydb`.`sessions` (`start_time`, `end_time`, `date`, `users_id`, `employees_id`, `computers_id`)
        VALUES (NOW(), NOW() + INTERVAL sessionDurationHours HOUR, CURDATE(), userId, employeeId, computerId);

        -- Сначала списываем с основного баланса
        IF userBalance >= totalCost THEN
            UPDATE `mydb`.`users`
            SET balance = balance - totalCost
            WHERE id = userId;
        ELSE
            -- Списываем с основного баланса все, что можно, и остаток с бонусного баланса
            UPDATE `mydb`.`users`
            SET balance = 0,
                bonuce_balance = bonuce_balance - (totalCost - userBalance)
            WHERE id = userId;
        END IF;

        -- Фиксируем транзакцию
        COMMIT;
    ELSE
        -- Откатываем транзакцию, если недостаточно средств
        ROLLBACK;
    END IF;
END$$

DELIMITER ;



