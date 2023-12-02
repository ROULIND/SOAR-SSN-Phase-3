-- Clean the whole database of all the tables
DROP TABLE IF EXISTS Followers;
DROP TABLE IF EXISTS Likes;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Users;


-- Création de la table Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    pictureProfile VARCHAR(255) NOT NULL DEFAULT 'Default-PP.jpeg',
    password INTEGER NOT NULL  -- Note: Dans une application réelle, envisagez d'utiliser un hachage sécurisé pour le mot de passe.
);

-- Création de la table Posts
CREATE TABLE Posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    text VARCHAR(256) NOT NULL,
    date_published DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Création de la table Comments
CREATE TABLE Comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    text TEXT NOT NULL,
    date_published DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Création de la table Likes
CREATE TABLE Likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Création de la table Followers
CREATE TABLE Followers (
    follower_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    followed_user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (followed_user_id) REFERENCES Users(user_id)
);
