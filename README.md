# База данных для компьютерного клуба
![img](https://github.com/Cainones/Auction_DB/blob/main/Auction_ERD.png)

>[!TIP]
+ [Типовые запросы](#Типовые-запросы)
- [View-представление](#View-представление)
* [Хранимые процедуры](#Хранимые-процедуры)
+ [Триггер для хранимой процедуры](#Триггер-для-хранимой-процедуры)

> [!IMPORTANT]
> ## Типовые запросы:

### Этот запрос возвращает информацию о сессиях пользователей, включая данные о пользователях, сотрудниках и компьютерах

```sql
SELECT 
    p.id AS payment_id,
    p.replenishment,
    p.users_id AS user_id,
    u.username AS user_username,
    u.email AS user_email,
    e.id AS employee_id,
    e.username AS employee_username
FROM 
    `mydb`.`payments` p
JOIN 
    `mydb`.`users` u ON p.users_id = u.id
JOIN 
    `mydb`.`employees` e ON p.employees_id = e.id;
```

### Этот запрос возвращает информацию о платежах, включая данные о пользователях и сотрудниках, которые обработали эти платежи

```sql
SELECT 
    p.id AS payment_id,
    p.replenishment,
    p.users_id AS user_id,
    u.username AS user_username,
    u.email AS user_email,
    e.id AS employee_id,
    e.username AS employee_username
FROM 
    `mydb`.`payments` p
JOIN 
    `mydb`.`users` u ON p.users_id = u.id
JOIN 
    `mydb`.`employees` e ON p.employees_id = e.id;
```

### Этот запрос возвращает информацию о всех доступных компьютерах и их комнатах
```sql
SELECT 
    c.id AS computer_id,
    c.title AS computer_title,
    c.description AS computer_description,
    c.price_per_hours AS computer_price_per_hour,
    c.status,
    r.id AS room_id,
    r.title AS room_title,
    r.description AS room_description
FROM 
    `mydb`.`computers` c
JOIN 
    `mydb`.`rooms` r ON c.rooms_id = r.id
WHERE 
    c.status = '1'; -- 1  означает, что компьютер доступен
```

### Этот запрос возвращает информацию о сотрудниках и их месячных зарплатах, исходя из почасовой ставки и 160 рабочих часов в месяц

```sql
SELECT 
    e.id AS employee_id,
    e.username,
    e.name,
    e.surename,
    e.patronymic,
    e.salary_per_hour,
    (e.salary_per_hour * 160) AS monthly_salary -- Предполагаем 160 часов работы в месяц
FROM 
    `mydb`.`employees` e;

```

> [!IMPORTANT]
> ## View-представление:

### Данное представление объединяет данные из различных таблиц, предоставляя комплексную информацию о предметах:

```sql
SELECT * FROM mydb.user_sessions;
```

> [!IMPORTANT]
> ## Хранимые процедуры: 

### Данная хранимая процедура содержит: 
- Обработчик исключений
* Транзакцию 
+ Условие

```sql
CALL AddPayment(2, 1, 500.00);
```

### Данная хранимая процедура содержит: 
- Обработчик исключений
* Транзакцию 
+ Условие

```sql
CALL CreateSession(1, 2, 1, 2.5); -- Пример создания сессии на 2.5 часа для пользователя с id=1, сотрудником с id=1 и компьютером с id=1
```

> [!IMPORTANT]
> ## Триггер для хранимой процедуры:

### Триггер для автоматического обновления баланса при пополнении через таблицу 'payments'

