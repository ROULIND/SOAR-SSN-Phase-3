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

INSERT INTO Comments (post_id, user_id, text) VALUES
(211, 215, 'Great post, user 215!'),
(212, 216, 'Thanks for sharing, user 216.'),
(213, 217, 'Interesting perspective!'),
(214, 218, 'Awesome thoughts, user 217!'),
(215, 219, 'Love your creativity, user 218.'),
(216, 220, 'Reflecting on this, user 219.'),
(217, 221, 'Your posts brighten my day, user 220!'),
(218, 222, 'Dancing through life, user 221.'),
(219, 223, 'Rain or shine, your posts inspire, user 222.'),
(220, 224, 'Virtual cheers, user 223!'),
(221, 225, 'Banana pancakes virtually, user 224.'),
(222, 226, 'Chaos is where joy is found, user 225.'),
(223, 227, 'Victorious in the virtual snowball fight, user 226.'),
(224, 228, 'Agent pineapple reporting in, user 227.'),
(225, 229, 'Magical unicorn dreams for everyone, user 228.'),
(226, 230, 'Bouncing virtually on trampolines, user 229.'),
(227, 231, 'Launching virtual paper airplanes with joy, user 230.'),
(228, 232, 'Wishing you virtual chocolate chip happiness, user 231.'),
(229, 233, 'Contributing to virtual world peace, user 232.'),
(230, 234, 'Climbing virtual rainbows together, user 233.'),
(231, 235, 'Banjo-playing virtually, user 234.'),
(232, 236, 'Whistling while virtually coding, user 235.'),
(233, 237, 'Bubble wrap therapy goes virtual, user 236.'),
(234, 238, 'Excited for your virtual weekend, user 237!'),
(235, 239, 'Embarking on new virtual coding adventures, user 238.'),
(236, 240, 'Enjoying virtual sunny days, user 239.'),
(237, 241, 'Uniting virtually over coffee, user 240.'),
(238, 242, 'Virtual moonwalking in the park, user 241.'),
(239, 243, 'Breakfast pizza joy goes virtual, user 242.'),
(240, 244, 'Ninja coding vibes in the virtual realm, user 243.'),
(241, 245, 'Love it, user 244!'),
(242, 246, 'Amazing, user 245!'),
(243, 247, 'Inspiring, user 246.'),
(244, 248, 'Cheers, user 247!'),
(245, 249, 'Virtual high-five, user 248!'),
(246, 250, 'Joyful vibes, user 249.'),
(247, 251, 'Keep shining, user 250!'),
(248, 252, 'Virtually dancing, user 251.'),
(249, 253, 'Thought-provoking, user 252!'),
(250, 254, 'Cherishing this, user 253.'),
(251, 255, 'Incredible, user 254!'),
(252, 256, 'So good, user 255!'),
(253, 257, 'Virtually stunning, user 256!'),
(254, 258, 'Fantastic, user 257!'),
(255, 259, 'Happiness unleashed, user 258!'),
(256, 260, 'Kudos, user 259!'),
(257, 261, 'Virtual applause, user 260!'),
(258, 262, 'Impressive, user 261!'),
(259, 263, 'Virtually splendid, user 262!'),
(260, 264, 'Enchanting, user 263!'),
(261, 265, 'Virtuoso, user 264!'),
(262, 266, 'Brilliant, user 265!'),
(263, 267, 'Captivating, user 266!'),
(264, 268, 'Fantastic journey, user 267!'),
(265, 269, 'Virtual magic, user 268!'),
(266, 270, 'Epic, user 269!'),
(267, 271, 'Wonderful, user 270!'),
(268, 272, 'In awe, user 271!'),
(269, 273, 'Virtually beautiful, user 272!'),
(270, 274, 'Inspiration overflowing, user 273!'),
(271, 275, 'Virtual brilliance, user 274!'),
(272, 276, 'Joyful musings, user 275!'),
(273, 277, 'Fantastic reflections, user 276!'),
(274, 278, 'Virtual serenity, user 277!'),
(275, 279, 'Virtually amazing, user 278!'),
(276, 280, 'Kudos, user 279!'),
(277, 281, 'Heartfelt joy, user 280!'),
(278, 282, 'Inspirational, user 281!'),
(279, 283, 'Virtually fantastic, user 282!'),
(280, 284, 'Exquisite, user 283!'),
(281, 285, 'Beautifully shared, user 284!'),
(282, 286, 'Incredible vibes, user 285!'),
(283, 287, 'Virtual harmony, user 286!'),
(284, 288, 'Kudos, user 287!'),
(285, 289, 'Captivating moments, user 288!'),
(286, 290, 'Enchanting, user 289!'),
(287, 291, 'Joyful musings, user 290!'),
(288, 292, 'Virtual brilliance, user 291!'),
(289, 293, 'Fantastic reflections, user 292!'),
(290, 294, 'Virtual serenity, user 293!'),
(291, 295, 'Virtually amazing, user 294!'),
(292, 296, 'Kudos, user 295!'),
(293, 297, 'Heartfelt joy, user 296!'),
(294, 298, 'Inspirational, user 297!'),
(295, 299, 'Virtually fantastic, user 298!'),
(296, 300, 'Exquisite, user 299!'),
(297, 301, 'Beautifully shared, user 300!'),
(298, 302, 'Incredible vibes, user 301!'),
(299, 303, 'Virtual harmony, user 302!'),
(300, 304, 'Kudos, user 303!'),
(301, 305, 'Captivating moments, user 304!'),
(302, 306, 'Enchanting, user 305!'),
(303, 307, 'Joyful musings, user 306!'),
(304, 308, 'Virtual brilliance, user 307!'),
(305, 309, 'Fantastic reflections, user 308!'),
(306, 310, 'Virtual serenity, user 309!'),
(307, 311, 'Virtually amazing, user 310!'),
(308, 312, 'Kudos, user 311!'),
(309, 313, 'Heartfelt joy, user 312!'),
(310, 314, 'Inspirational, user 313!'),
(311, 315, 'Virtually fantastic, user 314!'),
(312, 316, 'Exquisite, user 315!'),
(313, 317, 'Beautifully shared, user 316!'),
(314, 318, 'Incredible vibes, user 317!'),
(315, 319, 'Virtual harmony, user 318!'),

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
