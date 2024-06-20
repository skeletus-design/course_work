CREATE VIEW `mydb`.`user_sessions` AS
SELECT 
    u.id AS user_id,
    u.username,
    u.email,
    u.phone_number,
    u.balance,
    u.bonuce_balance,
    s.id AS session_id,
    s.start_time,
    s.end_time,
    s.date,
    e.id AS employee_id,
    e.username AS employee_username,
    c.id AS computer_id,
    c.title AS computer_title,
    c.price_per_hours AS computer_price_per_hour
FROM 
    `mydb`.`users` u
JOIN 
    `mydb`.`sessions` s ON u.id = s.users_id
JOIN 
    `mydb`.`employees` e ON s.employees_id = e.id
JOIN 
    `mydb`.`computers` c ON s.computers_id = c.id;
