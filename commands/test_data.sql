-- Вставка тестовых данных в таблицу users
INSERT INTO `mydb`.`users` (`username`, `hash_password`, `email`, `phone_number`, `balance`, `bonuce_balance`, `passport_series`)
VALUES
('user1', 'hash1', 'user1@example.com', '1234567890123', 100.00, 10.00, '4500123456'),
('user2', 'hash2', 'user2@example.com', '2234567890123', 200.00, 20.00, '4501234567'),
('user3', 'hash3', 'user3@example.com', '3234567890123', 300.00, 30.00, '4502345678'),
('user4', 'hash4', 'user4@example.com', '4234567890123', 400.00, 40.00, '4503456789'),
('user5', 'hash5', 'user5@example.com', '5234567890123', 500.00, 50.00, '4504567890'),
('user6', 'hash6', 'user6@example.com', '6234567890123', 600.00, 60.00, '4505678901'),
('user7', 'hash7', 'user7@example.com', '7234567890123', 700.00, 70.00, '4506789012'),
('user8', 'hash8', 'user8@example.com', '8234567890123', 800.00, 80.00, '4507890123'),
('user9', 'hash9', 'user9@example.com', '9234567890123', 900.00, 90.00, '4508901234'),
('user10', 'hash10', 'user10@example.com', '0234567890123', 1000.00, 100.00, '4509012345');

-- Вставка тестовых данных для комнат в компьютерном клубе с описанием на русском языке
INSERT INTO `mydb`.`rooms` (`title`, `description`, `vip`)
VALUES
('Комната 1', 'Это стандартная комната с высокопроизводительными игровыми ПК.', '0'),
('Комната 2', 'Эта комната оснащена передовыми игровыми креслами и периферией.', '0'),
('VIP Комната 1', 'Эксклюзивная VIP-комната с первоклассными игровыми установками и приватным лаунжем.', '1'),
('Комната 3', 'Просторная комната с множеством экранов для групповых игр.', '0'),
('VIP Комната 2', 'Премиальная VIP-комната с персональным обслуживанием и новейшими технологиями.', '1'),
('Комната 4', 'Тихая комната для сосредоточенных игровых сессий.', '0'),
('Комната 5', 'Комната, оборудованная новейшими технологиями виртуальной реальности.', '0'),
('VIP Комната 3', 'Роскошная VIP-комната с индивидуально собранными игровыми установками.', '1'),
('Комната 6', 'Комната с эргономичной мебелью и мягким освещением для длительных игровых сессий.', '0'),
('Комната 7', 'Комната, предназначенная для тренировки в киберспорте.', '0');

-- Вставка тестовых данных для сотрудников
INSERT INTO `mydb`.`employees` (`username`, `hash_password`, `name`, `surename`, `patronymic`, `description`, `salary_per_hour`)
VALUES
('ivanov', 'hash1', 'Иван', 'Иванов', 'Иванович', 'Старший системный администратор', 500.00),
('petrov', 'hash2', 'Петр', 'Петров', 'Петрович', 'Главный инженер по информационной безопасности', 600.00),
('sidorov', 'hash3', 'Сидор', 'Сидоров', 'Сидорович', 'Менеджер по IT-проектам', 550.00),
('smirnova', 'hash4', 'Анна', 'Смирнова', 'Игоревна', 'Системный аналитик', 520.00),
('vasileva', 'hash5', 'Ольга', 'Васильева', 'Владимировна', 'Разработчик программного обеспечения', 580.00),
('nikolaev', 'hash6', 'Николай', 'Николаев', 'Николаевич', 'Технический директор', 650.00),
('novikova', 'hash7', 'Мария', 'Новикова', 'Алексеевна', 'Специалист по поддержке пользователей', 450.00),
('fedorov', 'hash8', 'Федор', 'Федоров', 'Федорович', 'Сетевой администратор', 480.00),
('alexeev', 'hash9', 'Алексей', 'Алексеев', 'Алексеевич', 'Программист', 530.00),
('kozlov', 'hash10', 'Дмитрий', 'Козлов', 'Дмитриевич', 'Веб-разработчик', 500.00);

-- Вставка тестовых данных для компьютеров
INSERT INTO `mydb`.`computers` (`title`, `description`, `price_per_hours`, `status`, `rooms_id`)
SELECT
  CONCAT('Компьютер ', c.id) AS title,
  CONCAT('Игровой компьютер номер ', c.id) AS description,
  100.00 AS price_per_hours,
  '1' AS status,
  r.id AS rooms_id
FROM `mydb`.`rooms` r
JOIN (
    SELECT id, title
    FROM `mydb`.`rooms`
    ORDER BY id
) AS c ON r.title = c.title;

-- Вставка данных в таблицу sessions с использованием JOIN
INSERT INTO `mydb`.`sessions` (`start_time`, `end_time`, `date`, `users_id`, `employees_id`, `computers_id`)
SELECT
  NOW() AS start_time,
  NULL AS end_time,
  CURDATE() AS date,
  u.id AS users_id,
  e.id AS employees_id,
  c.id AS computers_id
FROM `mydb`.`users` u
JOIN (
    SELECT id
    FROM `mydb`.`employees`
    ORDER BY RAND() -- пример случайного выбора сотрудника
    LIMIT 1
) AS e ON 1=1 -- просто для соответствия условию JOIN
JOIN (
    SELECT id
    FROM `mydb`.`computers`
    ORDER BY RAND() -- пример случайного выбора компьютера
    LIMIT 1
) AS c ON 1=1; -- просто для соответствия условию JOIN

-- Вставка тестовых данных в таблицу payments
INSERT INTO `mydb`.`payments` (`replenishment`, `users_id`, `employees_id`)
SELECT
  ROUND(RAND() * 1000, 2) AS replenishment,
  u.id AS users_id,
  e.id AS employees_id
FROM `mydb`.`users` u
JOIN (
    SELECT id
    FROM `mydb`.`employees`
    ORDER BY RAND() -- пример случайного выбора сотрудника
    LIMIT 1
) AS e ON 1=1 -- просто для соответствия условию JOIN;






