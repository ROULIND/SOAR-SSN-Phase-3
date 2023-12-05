-- Clearing all data from tables
DELETE FROM Followers;
DELETE FROM Likes;
DELETE FROM Comments;
DELETE FROM Posts;
DELETE FROM Users;

-- Resetting the auto-increment values
ALTER TABLE Users AUTO_INCREMENT = 1;
ALTER TABLE Posts AUTO_INCREMENT = 1;
ALTER TABLE Comments AUTO_INCREMENT = 1;
ALTER TABLE Likes AUTO_INCREMENT = 1;
ALTER TABLE Followers AUTO_INCREMENT = 1;   

-- Données fictives pour la table Users
INSERT INTO Users (first_name, last_name, username, email, password) VALUES
('Alice', 'Martin', 'alice123', 'alice.martin@email.com', 1509442),
('Bob', 'Smith', 'bob_smith', 'bob.smith@email.com', 1509442),
('Charlie', 'Brown', 'charlieB', 'charlie.brown@email.com', 1509442),
('David', 'Johnson', 'davidJ', 'david.johnson@email.com', 1509442);


-- Données fictives pour la table Posts
INSERT INTO Posts (user_id, text, date_published) VALUES
(1, 'This is the first post by user 1.', '2023-11-23 10:00:00'),
(2, 'Hello world from user 2.', '2023-11-24 12:30:00'),
(1, 'Another insightful post by user 1.', '2023-11-25 15:45:00'),
(3, 'User 3 sharing some thoughts.', '2023-11-26 09:20:00'),
(2, 'User 2’s second post!', '2023-11-27 17:00:00'),
(1, 'User 1’s thoughts on the weekend.', '2023-11-28 08:15:00');

-- Données fictives pour la table Comments
INSERT INTO Comments (post_id, user_id, text) VALUES
(1, 2, 'Great post, user 1!'),
(2, 1, 'Thanks for sharing, user 2.'),
(1, 3, 'Interesting perspective!');

-- Données fictives pour la table Likes
INSERT INTO Likes (post_id, user_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 2);

-- Données fictives pour la table Followers
INSERT INTO Followers (user_id, followed_user_id) VALUES
(1, 2),
(2, 1),
(1, 3),
(3, 1),
(2, 3),
(3, 2);
