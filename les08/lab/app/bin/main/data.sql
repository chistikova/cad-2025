-- Данные для категорий товара
INSERT INTO Categories (categoryId, name, description) VALUES (1, 'Корма', 'Сухие и влажные корма для домашних животных');
INSERT INTO Categories (categoryId, name, description) VALUES (2, 'Игрушки', 'Игрушки для собак, кошек и других питомцев');
INSERT INTO Categories (categoryId, name, description) VALUES (3, 'Лакомства', 'Полезные и вкусные лакомства для животных');
INSERT INTO Categories (categoryId, name, description) VALUES (4, 'Аксессуары', 'Различные аксессуары для домашних питомцев');
INSERT INTO Categories (categoryId, name, description) VALUES (5, 'Средства ухода', 'Шампуни, гели, щетки и другие товары для ухода');
INSERT INTO Categories (categoryId, name, description) VALUES (6, 'Аквариумистика', 'Аквариумы, фильтры, декорации и аксессуары для рыб');
INSERT INTO Categories (categoryId, name, description) VALUES (7, 'Наполнители', 'Наполнители для кошачьих туалетов и клеток');
INSERT INTO Categories (categoryId, name, description) VALUES (8, 'Клетки', 'Клетки и вольеры для птиц, грызунов и других животных');
INSERT INTO Categories (categoryId, name, description) VALUES (9, 'Амуниция', 'Поводки, ошейники, намордники и прочие товары');
INSERT INTO Categories (categoryId, name, description) VALUES (10, 'Ветеринария', 'Витамины, лекарства и профилактические средства');

-- Данные для клиентов
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (1, 'Иван Иванов', 'ivan@example.com', '89000000000', 'г. Белгород');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (2, 'Мария Смирнова', 'maria.smirnova@example.com', '+79151234567', 'Санкт-Петербург, Невский пр., д. 25');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (3, 'Иван Кузнецов', 'ivan.kuznetsov@example.com', '+79037778899', 'Казань, ул. Баумана, д. 3');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (4, 'Ольга Петрова', 'olga.petrova@example.com', '+79665554433', 'Екатеринбург, пр. Ленина, д. 50');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (5, 'Дмитрий Соколов', 'd.sokolov@example.com', '+79881112244', 'Новосибирск, ул. Гоголя, д. 12');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (6, 'Елена Васильева', 'elena.vasileva@example.com', '+79994445566', 'Краснодар, ул. Красная, д. 7');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (7, 'Сергей Михайлов', 'sergey.mihailov@example.com', '+79332221100', 'Ростов-на-Дону, ул. Садовая, д. 15');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (8, 'Анна Федорова', 'anna.fedorova@example.com', '+79267778855', 'Челябинск, пр. Победы, д. 20');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (9, 'Павел Морозов', 'pavel.morozov@example.com', '+79050001122', 'Самара, ул. Московская, д. 5');
INSERT INTO Customers (customerId, name, email, phone, address) VALUES (10, 'Виктория Никитина', 'v.nikitina@example.com', '+79558887744', 'Уфа, ул. Ленина, д. 30');

-- Данные для продуктов
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (1, 'Сухой корм для собак', 'Полнорационный корм для взрослых собак', 1, 1500, 50, 'https://example.com/dog_food.jpg', '2025-01-15', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (2, 'Игрушка для кошек "Мышка"', 'Мягкая игрушка для игр', 2, 300, 200, 'https://example.com/cat_toy.jpg', '2025-01-16', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (3, 'Лакомство для попугаев', 'Зерновая смесь для птиц', 3, 500, 100, 'https://example.com/bird_treats.jpg', '2025-01-17', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (4, 'Когтеточка для кошек', 'Вертикальная когтеточка 50 см', 4, 1200, 30, 'https://example.com/scratching_post.jpg', '2025-01-18', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (5, 'Гель для чистки ушей собак', 'Средство для ухода за ушами', 5, 750, 40, 'https://example.com/dog_ear_gel.jpg', '2025-01-19', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (6, 'Аквариум 50 литров', 'Прямоугольный стеклянный аквариум', 6, 6000, 10, 'https://example.com/aquarium.jpg', '2025-01-20', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (7, 'Наполнитель для кошачьего туалета', 'Комкующийся наполнитель 5 кг', 7, 800, 60, 'https://example.com/cat_litter.jpg', '2025-01-21', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (8, 'Шампунь для собак с алоэ', 'Гипоаллергенный шампунь', 5, 550, 35, 'https://example.com/dog_shampoo.jpg', '2025-01-22', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (9, 'Клетка для хомяков', 'Металлическая клетка 30x30x50 см', 8, 2500, 20, 'https://example.com/hamster_cage.jpg', '2025-01-23', '2025-02-01');
INSERT INTO Products (productId, name, description, categoryId, price, stockQuantity, imageUrl, createdAt, updatedAt) VALUES (10, 'Поводок для собак 3м', 'Автоматический поводок с фиксатором', 9, 1300, 25, 'https://example.com/dog_leash.jpg', '2025-01-24', '2025-02-01');
