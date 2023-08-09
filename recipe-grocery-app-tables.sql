 -- User Table
CREATE TABLE "User"(
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(100) UNIQUE,
    password VARCHAR(200),
    email VARCHAR(200) UNIQUE,
    phone VARCHAR(20),
    profile_picture VARCHAR(200)
);

INSERT INTO "User"(
    first_name,
    last_name,
    username,
    password,
    email,
    phone,
    profile_picture
)
VALUES
('John', 'Doe', 'johndoe', 'hashed_password', 'johndoe@example.com', '1234567890', 'profile_pic_url1'),
('Tom', 'Cruise', 'tomcruise', 'hashed_password', 'tomcruise@example.com', '1324567890', 'profile_pic_url2');

-- Ingredients Table
CREATE TABLE Ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(200)
);

INSERT INTO Ingredients(
    ingredient_name
)
VALUES
('Flour'),
('Sugar'),
('Eggs'),
('Milks');

-- Recipe Table
CREATE TABLE Recipe(
    recipe_id SERIAL PRIMARY KEY,
    recipe_name VARCHAR(200),
    recipe_instructions TEXT,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES "User"(user_id)
);

INSERT INTO Recipe(
    recipe_name, recipe_instructions, user_id
)
VALUES
('Chocolate Cake', 'Instructions for making a chocolate cake...', 1);

-- Occasion Table
CREATE TABLE Occasion(
    occasion_id SERIAL PRIMARY KEY,
    occasion_name VARCHAR(200)
);

INSERT INTO Occasion(
    occasion_name
)
VALUES
('Birthday'),
('Anniversary'),
('Holiday');

-- Post Table
CREATE TABLE Post(
    post_id SERIAL PRIMARY KEY,
    post_content TEXT,
    is_public BOOLEAN,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES "User"(user_id)
);

INSERT INTO Post(
    post_content,
    is_public,
    user_id
)
VALUES
('Check out my first recipe!', true, 1),
('Check out my second recipe!', false, 2);

-- Photos Table
CREATE TABLE Photos(
    photo_id SERIAL PRIMARY KEY,
    photo_url VARCHAR(200),
    post_id INT,
    FOREIGN KEY(post_id) REFERENCES Post(post_id)
);

INSERT INTO Photos(
    photo_url,
    post_id
)
VALUES
('photo_url_1.jpg', 1),
('photo_url_2.jpg', 2);

-- Recipe_Occasion Table
CREATE TABLE Recipe_Occasion(
    recipe_occasion_id SERIAL PRIMARY KEY,
    recipe_id INT,
    occasion_id INT,
    FOREIGN KEY(recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY(occasion_id) REFERENCES Occasion(occasion_id)
);

INSERT INTO Recipe_Occasion(
    recipe_id,
    occasion_id
)
VALUES
(1,1),
(1,2);

-- Recipe_Ingredient Table
CREATE TABLE Recipe_Ingredient(
    recipe_ingredient_id SERIAL PRIMARY KEY,
    recipe_id INT,
    ingredient_id INT,
    FOREIGN KEY(recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY(ingredient_id) REFERENCES Ingredients(ingredient_id)
);

INSERT INTO Recipe_Ingredient(
    recipe_id,
    ingredient_id
)
VALUES
(1,1),
(1,2),
(1,3);

