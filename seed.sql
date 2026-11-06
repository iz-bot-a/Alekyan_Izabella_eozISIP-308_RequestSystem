-- Тестовые пользователи
INSERT INTO Users (user_id, full_name, email, password_hash, role) VALUES
(1, 'Иванов Иван', 'admin@example.com', 'test_hash_1', 'Администратор'),
(2, 'Петрова Анна', 'operator@example.com', 'test_hash_2', 'Оператор'),
(3, 'Сидоров Алексей', 'executor@example.com', 'test_hash_3', 'Исполнитель'),
(4, 'Смирнова Мария', 'requester@example.com', 'test_hash_4', 'Заявитель');

-- Статусы заявок
INSERT INTO Statuses (status_id, status_name) VALUES
(1, 'Новая'),
(2, 'В работе'),
(3, 'Выполнена'),
(4, 'Закрыта');

-- Категории питания
INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Завтрак'),
(2, 'Обед'),
(3, 'Полдник'),
(4, 'Ужин');

-- Тестовые заявки
INSERT INTO Requests (
    request_id, request_number, requester_id, executor_id,
    status_id, category_id, institution_name,
    student_count, meal_date, description
) VALUES
(1, 'REQ-001', 4, 3, 1, 1, 'Школа №1', 120,
 '2026-11-10', 'Организация завтрака для учащихся'),

(2, 'REQ-002', 4, 3, 2, 2, 'Школа №2', 200,
 '2026-11-11', 'Организация обеда'),

(3, 'REQ-003', 4, NULL, 3, 3, 'Школа №3', 80,
 '2026-11-12', 'Организация полдника'),

(4, 'REQ-004', 4, NULL, 4, 4, 'Школа №1', 100,
 '2026-11-13', 'Организация ужина');

-- Комментарии к заявкам
INSERT INTO Comments (comment_id, request_id, user_id, comment_text) VALUES
(1, 1, 2, 'Заявка зарегистрирована'),
(2, 2, 3, 'Начата работа над заявкой'),
(3, 3, 2, 'Заявка выполнена');
