
-- Включаем проверку внешних ключей
PRAGMA foreign_keys = ON;

-- Таблица пользователей
CREATE TABLE IF NOT EXISTS Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    role TEXT NOT NULL
        CHECK (role IN ('Администратор', 'Оператор', 'Исполнитель', 'Заявитель'))
);

-- Таблица статусов
CREATE TABLE IF NOT EXISTS Statuses (
    status_id INTEGER PRIMARY KEY AUTOINCREMENT,
    status_name TEXT NOT NULL UNIQUE
);

-- Таблица категорий питания
CREATE TABLE IF NOT EXISTS Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    category_name TEXT NOT NULL UNIQUE
);

-- Таблица заявок
CREATE TABLE IF NOT EXISTS Requests (
    request_id INTEGER PRIMARY KEY AUTOINCREMENT,
    request_number TEXT NOT NULL UNIQUE,
    requester_id INTEGER NOT NULL,
    executor_id INTEGER,
    status_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    institution_name TEXT NOT NULL,
    student_count INTEGER NOT NULL CHECK (student_count > 0),
    meal_date TEXT NOT NULL,
    description TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (requester_id) REFERENCES Users(user_id),
    FOREIGN KEY (executor_id) REFERENCES Users(user_id),
    FOREIGN KEY (status_id) REFERENCES Statuses(status_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Таблица комментариев
CREATE TABLE IF NOT EXISTS Comments (
    comment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    request_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (request_id) REFERENCES Requests(request_id)
        ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Индексы для ускорения поиска
CREATE INDEX IF NOT EXISTS idx_requests_status
    ON Requests(status_id);

CREATE INDEX IF NOT EXISTS idx_requests_category
    ON Requests(category_id);

CREATE INDEX IF NOT EXISTS idx_comments_request
    ON Comments(request_id);
