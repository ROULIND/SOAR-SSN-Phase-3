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

-- Données fictives pour la table Users (avec photos de profil)
INSERT INTO Users (first_name, last_name, username, email, pictureProfile, password) VALUES
('Eva', 'Anderson', 'evaA', 'eva.anderson@email.com', 'Baguette-PP.jpeg', 1509442),
('Frank', 'Williams', 'frankW', 'frank.williams@email.com', 'Benoit2-PP.jpeg', 1509442),
('Grace', 'Davis', 'graceD', 'grace.davis@email.com', 'BoldGuy2-PP.jpeg', 1509442),
('Henry', 'Taylor', 'henryT', 'henry.taylor@email.com', 'Dimi-PP.jpeg', 1509442),
('Isabel', 'Rodriguez', 'isabelR', 'isabel.rodriguez@email.com', 'GlassesGuy-PP.jpeg', 1509442),
('Jake', 'Turner', 'jakeT', 'jake.turner@email.com', 'Lafouine-PP.jpeg', 1509442),
('Katie', 'Hill', 'katieH', 'katie.hill@email.com', 'Leo-PP.jpeg', 1509442),
('Liam', 'Garcia', 'liamG', 'liam.garcia@email.com', 'MedhiFemale-PP.jpeg', 1509442),
('Mia', 'Fisher', 'miaF', 'mia.fisher@email.com', 'Melvin-PP.jpeg', 1509442),
('Nathan', 'Lopez', 'nathanL', 'nathan.lopez@email.com', 'OldGrandpa-PP.jpeg', 1509442),
('Olivia', 'Baker', 'oliviaB', 'olivia.baker@email.com', 'Sierro2-PP.jpeg', 1509442),
('Peter', 'Wong', 'peterW', 'peter.wong@email.com', 'Steve-PP.jpeg', 1509442),
('Quinn', 'Nguyen', 'quinnN', 'quinn.nguyen@email.com', 'ThumbsUp-PP.jpeg', 1509442),
('Ryan', 'Chen', 'ryanC', 'ryan.chen@email.com', 'Gretz-PP.jpeg', 1509442),
('Sophia', 'Larson', 'sophiaL', 'sophia.larson@email.com', 'Sierro3-PP.jpeg', 1509442),
('Thomas', 'Cooper', 'thomasC', 'thomas.cooper@email.com', 'Jona-PP.jpeg', 1509442),
('Uma', 'Ramirez', 'umaR', 'uma.ramirez@email.com', 'Denizkun-pp.jpeg', 1509442),
('Victor', 'Wells', 'victorW', 'victor.wells@email.com', 'Sierro4-PP.jpeg', 1509442),
('Wendy', 'Lee', 'wendyL', 'wendy.lee@email.com', 'Benoit-PP.jpeg', 1509442),
('Xavier', 'Chang', 'xavierC', 'xavier.chang@email.com', 'BoldGuy-PP.jpeg', 1509442),
('Yara', 'Hernandez', 'yaraH', 'yara.hernandez@email.com', 'DimiAI-PP.jpeg', 1509442),
('Zane', 'Reyes', 'zaneR', 'zane.reyes@email.com', 'SierroBeer.jpeg', 1509442),
('Ava', 'Perez', 'avaP', 'ava.perez@email.com', 'MehdiMale-PP.jpeg', 1509442),
('Benjamin', 'Harrison', 'benjaminH', 'benjamin.harrison@email.com', 'Baguette-PP.jpeg', 1509442),
('Caleb', 'Mitchell', 'calebM', 'caleb.mitchell@email.com', 'Benoit2-PP.jpeg', 1509442),
('Daisy', 'Jordan', 'daisyJ', 'daisy.jordan@email.com', 'BoldGuy2-PP.jpeg', 1509442),
('Elijah', 'Carter', 'elijahC', 'elijah.carter@email.com', 'Dimi-PP.jpeg', 1509442),
('Fiona', 'Reynolds', 'fionaR', 'fiona.reynolds@email.com', 'GlassesGuy-PP.jpeg', 1509442),
('Gavin', 'Stewart', 'gavinS', 'gavin.stewart@email.com', 'Lafouine-PP.jpeg', 1509442),
('Hazel', 'Fletcher', 'hazelF', 'hazel.fletcher@email.com', 'Leo-PP.jpeg', 1509442),
('Ivan', 'Hamilton', 'ivanH', 'ivan.hamilton@email.com', 'MedhiFemale-PP.jpeg', 1509442),
('Jade', 'Morrison', 'jadeM', 'jade.morrison@email.com', 'Melvin-PP.jpeg', 1509442),
('Kai', 'Barnes', 'kaiB', 'kai.barnes@email.com', 'OldGrandpa-PP.jpeg', 1509442),
('Lila', 'Ferguson', 'lilaF', 'lilaF.ferguson@email.com', 'Sierro2-PP.jpeg', 1509442),
('Mason', 'Gomez', 'masonG', 'mason.gomez@email.com', 'Steve-PP.jpeg', 1509442),
('Nora', 'Watson', 'noraW', 'nora.watson@email.com', 'ThumbsUp-PP.jpeg', 1509442),
('Oscar', 'Harrison', 'oscarH', 'oscar.harrison@email.com', 'Gretz-PP.jpeg', 1509442),
('Penelope', 'Wright', 'penelopeW', 'penelope.wright@email.com', 'Sierro3-PP.jpeg', 1509442),
('Quincy', 'Powell', 'quincyP', 'quincyP.powell@email.com', 'Jona-PP.jpeg', 1509442),
('Riley', 'Fisher', 'rileyF', 'riley.fisher@email.com', 'Denizkun-pp.jpeg', 1509442),
('Sofia', 'Martinez', 'sofiaM', 'sofia.martinez@email.com', 'Sierro4-PP.jpeg', 1509442),
('Theo', 'Simmons', 'theoS', 'theo.simmons@email.com', 'Benoit-PP.jpeg', 1509442),
('Ulysses', 'Owens', 'ulyssesO', 'ulysses.owens@email.com', 'BoldGuy-PP.jpeg', 1509442),
('Vivian', 'Webster', 'vivianW', 'vivian.webster@email.com', 'DimiAI-PP.jpeg', 1509442),
('Wesley', 'Dixon', 'wesleyD', 'wesley.dixon@email.com', 'SierroBeer.jpeg', 1509442),
('Xena', 'Yang', 'xenaY', 'xena.yang@email.com', 'MehdiMale-PP.jpeg', 1509442),
('Yannis', 'Tran', 'yannisT', 'yannis.tran@email.com', 'Baguette-PP.jpeg', 1509442),
('Zara', 'Hawkins', 'zaraH', 'zara.hawkins@email.com', 'Benoit2-PP.jpeg', 1509442),
('Aaron', 'Fleming', 'aaronF', 'aaron.fleming@email.com', 'BoldGuy2-PP.jpeg', 1509442),
('Bella', 'Rossi', 'bellaR', 'bella.rossi@email.com', 'Dimi-PP.jpeg', 1509442),
('Cameron', 'Gibson', 'cameronG', 'cameron.gibson@email.com', 'GlassesGuy-PP.jpeg', 1509442),
('Delilah', 'Barrett', 'delilahB', 'delilahB.barrett@email.com', 'Lafouine-PP.jpeg', 1509442),
('Ezra', 'McCarthy', 'ezraM', 'ezra.mccarthy@email.com', 'Leo-PP.jpeg', 1509442),
('Freya', 'Bishop', 'freyaB', 'freya.bishop@email.com', 'MedhiFemale-PP.jpeg', 1509442),
('Gideon', 'Owens', 'gideonO', 'gideon.owens@email.com', 'Melvin-PP.jpeg', 1509442),
('Harper', 'Dunn', 'harperD', 'harper.dunn@email.com', 'OldGrandpa-PP.jpeg', 1509442),
('Isaiah', 'Fisher', 'isaiahF', 'isaiah.fisher@email.com', 'Sierro2-PP.jpeg', 1509442),
('Jasmine', 'Holt', 'jasmineH', 'jasmine.holt@email.com', 'Steve-PP.jpeg', 1509442),
('Kai', 'Stephens', 'kaiS', 'kai.stephens@email.com', 'ThumbsUp-PP.jpeg', 1509442),
('Lila', 'Blackwell', 'lilaB', 'lilaB.ferguson@email.com', 'Gretz-PP.jpeg', 1509442),
('Miles', 'Hendricks', 'milesH', 'miles.hendricks@email.com', 'Sierro3-PP.jpeg', 1509442),
('Nina', 'Wang', 'ninaW', 'nina.wang@email.com', 'Jona-PP.jpeg', 1509442),
('Owen', 'Pierce', 'owenP', 'owen.pierce@email.com', 'Denizkun-pp.jpeg', 1509442),
('Piper', 'Hernandez', 'piperH', 'piper.hernandez@email.com', 'Sierro4-PP.jpeg', 1509442),
('Quincy', 'Stevens', 'quincyS', 'quincy.powell@email.com', 'Benoit-PP.jpeg', 1509442),
('Rachel', 'Porter', 'rachelP', 'rachel.porter@email.com', 'BoldGuy-PP.jpeg', 1509442),
('Samuel', 'Nguyen', 'samuelN', 'samuel.nguyen@email.com', 'DimiAI-PP.jpeg', 1509442),
('Tessa', 'Harrison', 'tessaH', 'tessa.harrison@email.com', 'SierroBeer.jpeg', 1509442),
('Uriah', 'Lopez', 'uriahL', 'uriah.lopez@email.com', 'MehdiMale-PP.jpeg', 1509442),
('Violet', 'Chang', 'violetC', 'violet.chang@email.com', 'Baguette-PP.jpeg', 1509442),
('Winston', 'Gomez', 'winstonG', 'winston.gomez@email.com', 'Benoit2-PP.jpeg', 1509442),
('Xavier', 'Martinez', 'xavierM', 'xavier.martinez@email.com', 'BoldGuy2-PP.jpeg', 1509442),
('Yasmine', 'Ramirez', 'yasmineR', 'yasmine.ramirez@email.com', 'Dimi-PP.jpeg', 1509442),
('Zachary', 'Fletcher', 'zacharyF', 'zachary.fletcher@email.com', 'GlassesGuy-PP.jpeg', 1509442),
('Aria', 'Reyes', 'ariaR', 'aria.reyes@email.com', 'Lafouine-PP.jpeg', 1509442),
('Bryce', 'Morrison', 'bryceM', 'bryce.morrison@email.com', 'Leo-PP.jpeg', 1509442),
('Caroline', 'Barnes', 'carolineB', 'caroline.barnes@email.com', 'MedhiFemale-PP.jpeg', 1509442),
('Dante', 'Wright', 'danteW', 'dante.wright@email.com', 'Melvin-PP.jpeg', 1509442),
('Eliza', 'Simmons', 'elizaS', 'eliza.simmons@email.com', 'OldGrandpa-PP.jpeg', 1509442),
('Felix', 'Webster', 'felixW', 'felix.webster@email.com', 'Sierro2-PP.jpeg', 1509442),
('Giselle', 'Mitchell', 'giselleM', 'giselle.mitchell@email.com', 'Steve-PP.jpeg', 1509442),
('Hayden', 'Johnson', 'haydenJ', 'hayden.johnson@email.com', 'ThumbsUp-PP.jpeg', 1509442),
('Ivy', 'Hill', 'ivyH', 'ivy.hill@email.com', 'Gretz-PP.jpeg', 1509442),
('Jaxon', 'Wells', 'jaxonW', 'jaxon.wells@email.com', 'Sierro3-PP.jpeg', 1509442),
('Kylie', 'Owens', 'kylieO', 'kylie.owens@email.com', 'Jona-PP.jpeg', 1509442),
('Landon', 'Turner', 'landonT', 'landon.turner@email.com', 'Denizkun-pp.jpeg', 1509442),
('Mila', 'Hawkins', 'milaH', 'mila.hawkins@email.com', 'Sierro4-PP.jpeg', 1509442),
('Nolan', 'Ferguson', 'nolanF', 'nolan.ferguson@email.com', 'Benoit-PP.jpeg', 1509442),
('Oliver', 'Perez', 'oliverP', 'oliver.perez@email.com', 'BoldGuy-PP.jpeg', 1509442),
('Paisley', 'Cooper', 'paisleyC', 'paisley.cooper@email.com', 'DimiAI-PP.jpeg', 1509442),
('Quinn', 'Gibson', 'quinnG', 'quinn.gibson@email.com', 'SierroBeer.jpeg', 1509442),
('Ryder', 'Hendricks', 'ryderH', 'ryder.hendricks@email.com', 'MehdiMale-PP.jpeg', 1509442),
('Savannah', 'Wang', 'savannahW', 'savannah.wang@email.com', 'Baguette-PP.jpeg', 1509442),
('Tristan', 'Holt', 'tristanH', 'tristan.holt@email.com', 'Benoit2-PP.jpeg', 1509442),
('Uma', 'Blackwell', 'umaB', 'uma.blackwell@email.com', 'BoldGuy2-PP.jpeg', 1509442),
('Vivian', 'Dunn', 'vivianD', 'vivian.dunn@email.com', 'Dimi-PP.jpeg', 1509442),
('William', 'Rossi', 'williamR', 'william.rossi@email.com', 'GlassesGuy-PP.jpeg', 1509442),
('Xander', 'Garcia', 'xanderG', 'xander.garcia@email.com', 'Lafouine-PP.jpeg', 1509442),
('Yara', 'Hernandez', 'yaraH', 'yara.hernandez@email.com', 'Leo-PP.jpeg', 1509442),
('Zayn', 'Fleming', 'zaynF', 'zayn.fleming@email.com', 'MedhiFemale-PP.jpeg', 1509442),
('Abigail', 'Fisher', 'abigailF', 'abigail.fisher@email.com', 'Melvin-PP.jpeg', 1509442);



INSERT INTO Posts (user_id, text, date_published) VALUES
(1, 'Fun times ahead!', '2023-12-01 14:22:00'),
(2, 'Coding adventures!', '2023-12-02 11:10:00'),
(3, 'Sunny days and smiles.', '2023-12-03 16:45:00'),
(4, 'Coffee is life!', '2023-12-04 08:30:00'),
(5, 'Moonwalking in the park.', '2023-12-05 18:12:00'),
(6, 'Pizza for breakfast!', '2023-12-06 09:05:00'),
(7, 'Coding ninja strikes!', '2023-12-07 13:40:00'),
(8, 'Dance like no one watching.', '2023-12-08 22:15:00'),
(9, 'Exploring the unknown.', '2023-12-09 07:55:00'),
(10, 'Rainy day reflections.', '2023-12-10 14:30:00'),
(11, 'Inventing new colors.', '2023-12-11 10:20:00'),
(12, 'Chasing rainbows!', '2023-12-12 19:00:00'),
(13, 'Singing in the shower.', '2023-12-13 08:45:00'),
(14, 'Random acts of kindness.', '2023-12-14 16:28:00'),
(15, 'Jumping into the weekend!', '2023-12-15 12:15:00'),
(16, 'Solving world hunger...', '2023-12-16 21:00:00'),
(17, 'Yoga with penguins.', '2023-12-17 09:45:00'),
(18, 'Banana pancakes forever.', '2023-12-18 15:33:00'),
(19, 'Finding joy in chaos.', '2023-12-19 11:25:00'),
(20, 'Snowball fight victories.', '2023-12-20 17:10:00'),
(21, 'Secret agent pineapple.', '2023-12-21 08:55:00'),
(22, 'Magical unicorn dreams.', '2023-12-22 14:42:00'),
(23, 'Bouncing on trampolines.', '2023-12-23 10:35:00'),
(24, 'Launching paper airplanes.', '2023-12-24 18:20:00'),
(25, 'Chocolate chip happiness.', '2023-12-25 12:05:00'),
(26, 'Creating world peace.', '2023-12-26 20:00:00'),
(27, 'Climbing rainbows.', '2023-12-27 09:38:00'),
(28, 'Banjo-playing squirrels.', '2023-12-28 16:22:00'),
(29, 'Whistle while coding.', '2023-12-29 11:15:00'),
(30, 'Bubble wrap therapy.', '2023-12-30 19:10:00'),
(31, 'Excited for the weekend!', '2023-12-31 14:22:00'),
(32, 'New coding adventures!', '2024-01-01 11:10:00'),
(33, 'Enjoying sunny days.', '2024-01-02 16:45:00'),
(34, 'Coffee lovers unite!', '2024-01-03 08:30:00'),
(35, 'Moonwalked in the park.', '2024-01-04 18:12:00'),
(36, 'Breakfast pizza joy!', '2024-01-05 09:05:00'),
(37, 'Ninja coding vibes!', '2024-01-06 13:40:00'),
(38, 'Dancing without a care.', '2024-01-07 22:15:00'),
(39, 'Exploring the unknown.', '2024-01-08 07:55:00'),
(40, 'Reflections on rainy days.', '2024-01-09 14:30:00'),
(41, 'Inventing new experiences.', '2024-01-10 10:20:00'),
(42, 'Chasing virtual rainbows!', '2024-01-11 19:00:00'),
(43, 'Singing in the virtual shower.', '2024-01-12 08:45:00'),
(44, 'Random kindness online.', '2024-01-13 16:28:00'),
(45, 'Jumping into virtual weekends!', '2024-01-14 12:15:00'),
(46, 'Solving virtual world hunger...', '2024-01-15 21:00:00'),
(47, 'Virtual yoga adventures.', '2024-01-16 09:45:00'),
(48, 'Banana pancake love.', '2024-01-17 15:33:00'),
(49, 'Finding joy in virtual chaos.', '2024-01-18 11:25:00'),
(50, 'Snowball fights online victories.', '2024-01-19 17:10:00'),
(51, 'Secret agent pineapple vibes.', '2024-01-20 08:55:00'),
(52, 'Magical virtual unicorn dreams.', '2024-01-21 14:42:00'),
(53, 'Bouncing on virtual trampolines.', '2024-01-22 10:35:00'),
(54, 'Launching virtual paper airplanes.', '2024-01-23 18:20:00'),
(55, 'Chocolate chip happiness online.', '2024-01-24 12:05:00'),
(56, 'Creating virtual world peace.', '2024-01-25 20:00:00'),
(57, 'Climbing virtual rainbows.', '2024-01-26 09:38:00'),
(58, 'Banjo-playing virtual squirrels.', '2024-01-27 16:22:00'),
(59, 'Whistle while virtual coding.', '2024-01-28 11:15:00'),
(60, 'Bubble wrap therapy online.', '2024-01-29 19:10:00'),
(61, 'Contemplating life mysteries...', '2024-01-30 14:22:00'),
(62, 'Reflecting on the journey so far.', '2024-01-31 11:10:00'),
(63, 'Finding peace in the chaos.', '2024-02-01 16:45:00'),
(64, 'Grateful for simple moments.', '2024-02-02 08:30:00'),
(65, 'Embracing the dance of time.', '2024-02-03 18:12:00'),
(66, 'Discovering joy in small things.', '2024-02-04 09:05:00'),
(67, 'Thoughts on the art of patience.', '2024-02-05 13:40:00'),
(68, 'Navigating the river of thoughts.', '2024-02-06 22:15:00'),
(69, 'Silent conversations with the soul.', '2024-02-07 07:55:00'),
(70, 'Waves of reflection wash over.', '2024-02-08 14:30:00'),
(71, 'Sketching memories in the mind.', '2024-02-09 10:20:00'),
(72, 'Echoes of laughter in quietude.', '2024-02-10 19:00:00'),
(73, 'Harmony found in self-discovery.', '2024-02-11 08:45:00'),
(74, 'Whispers of wisdom in solitude.', '2024-02-12 16:28:00'),
(75, 'Grains of sand, thoughts unfold.', '2024-02-13 12:15:00'),
(76, 'Ripples of introspection spread.', '2024-02-14 21:00:00'),
(77, 'Mindscape painted with reflections.', '2024-02-15 09:45:00'),
(78, 'Dancing shadows, pondering light.', '2024-02-16 15:33:00'),
(79, 'Embracing the canvas of the mind.', '2024-02-17 11:25:00'),
(80, 'Reflective pause in life symphony.', '2024-02-18 17:10:00'),
(81, 'In the stillness, truths arise.', '2024-02-19 08:55:00'),
(82, 'Contours of introspective landscapes.', '2024-02-20 14:42:00'),
(83, 'Sailing through seas of thoughts.', '2024-02-21 10:35:00'),
(84, 'Reflections mirroring the soul.', '2024-02-22 18:20:00'),
(85, 'Wisdom echoes in silent reverie.', '2024-02-23 12:05:00'),
(86, 'Footprints of introspective travels.', '2024-02-24 20:00:00'),
(87, 'Pondering the tapestry of time.', '2024-02-25 09:38:00'),
(88, 'Reflections in the river of existence.', '2024-02-26 16:22:00'),
(89, 'In the quiet, finding resonance.', '2024-02-27 11:15:00'),
(90, 'Sculpting thoughts on the mind canvas.', '2024-02-28 19:10:00'),
(91, 'Gazing into the abyss of thoughts.', '2024-02-29 14:22:00'),
(92, 'Contours of the mind, etched in time.', '2024-03-01 11:10:00'),
(93, 'Whispers of the heart in quiet moments.', '2024-03-02 16:45:00'),
(94, 'Reflections like ripples in still waters.', '2024-03-03 08:30:00'),
(95, 'Echoes of yesterday, reflections of now.', '2024-03-04 18:12:00'),
(96, 'Serene skies within, storms without.', '2024-03-05 09:05:00'),
(97, 'In the garden of thoughts, blooms wisdom.', '2024-03-06 13:40:00'),
(98, 'Footprints of introspection in the sands of time.', '2024-03-07 22:15:00'),
(99, 'Quiet musings beneath the moonlit thoughts.', '2024-03-08 07:55:00'),
(100, 'Reflections dance in the mirror of the mind.', '2024-03-09 14:30:00');



INSERT INTO Comments (post_id, user_id, text) VALUES
(1, 100, 'Great post!'),
(2, 99, 'Thanks for sharing.'),
(3, 98, 'Interesting perspective!'),
(4, 97, 'Awesome thoughts!'),
(5, 96, 'Love your creativity.'),
(6, 95, 'Reflecting on this.'),
(7, 94, 'Your posts brighten my day.'),
(8, 93, 'Dancing through life.'),
(9, 92, 'Rain or shine, your posts inspire.'),
(10, 91, 'Virtual cheers.'),
(11, 90, 'Banana pancakes virtually.'),
(12, 89, 'Chaos is where joy is found.'),
(13, 88, 'Victorious in the virtual snowball fight.'),
(14, 87, 'Agent pineapple reporting in.'),
(15, 86, 'Magical unicorn dreams for everyone.'),
(16, 85, 'Bouncing virtually on trampolines.'),
(17, 84, 'Launching virtual paper airplanes with joy.'),
(18, 83, 'Wishing you virtual chocolate chip happiness.'),
(19, 82, 'Contributing to virtual world peace.'),
(20, 81, 'Climbing virtual rainbows together.'),
(21, 80, 'Banjo-playing virtually.'),
(22, 79, 'Whistling while virtually coding.'),
(23, 78, 'Bubble wrap therapy goes virtual.'),
(24, 77, 'Excited for your virtual weekend.'),
(25, 76, 'Embarking on new virtual coding adventures.'),
(26, 75, 'Enjoying virtual sunny days.'),
(27, 74, 'Uniting virtually over coffee.'),
(28, 73, 'Virtual moonwalking in the park.'),
(29, 72, 'Breakfast pizza joy goes virtual.'),
(30, 71, 'Ninja coding vibes in the virtual realm.'),
(31, 70, 'Love it!'),
(32, 69, 'Amazing!'),
(33, 68, 'Inspiring!'),
(34, 67, 'Cheers!'),
(35, 66, 'Virtual high-five!'),
(36, 65, 'Joyful vibes!'),
(37, 64, 'Keep shining!'),
(38, 63, 'Virtually dancing.'),
(39, 62, 'Thought-provoking!'),
(40, 61, 'Cherishing this!'),
(41, 60, 'Incredible!'),
(42, 59, 'So good!'),
(43, 58, 'Virtually stunning!'),
(44, 57, 'Fantastic!'),
(45, 56, 'Happiness unleashed!'),
(46, 55, 'Kudos!'),
(47, 54, 'Virtual applause!'),
(48, 53, 'Impressive!'),
(49, 52, 'Virtually splendid!'),
(50, 51, 'Enchanting!'),
(51, 50, 'Virtuoso!'),
(52, 49, 'Brilliant!'),
(53, 48, 'Captivating!'),
(54, 47, 'Fantastic journey!'),
(55, 46, 'Virtual magic!'),
(56, 45, 'Epic!'),
(57, 44, 'Wonderful!'),
(58, 43, 'In awe!'),
(59, 42, 'Virtually beautiful!'),
(60, 41, 'Inspiration overflowing!'),
(61, 40, 'Virtual brilliance!'),
(62, 39, 'Joyful musings!'),
(63, 38, 'Fantastic reflections!'),
(64, 37, 'Virtual serenity!'),
(65, 36, 'Virtually amazing!'),
(66, 35, 'Kudos!'),
(67, 34, 'Heartfelt joy!'),
(68, 33, 'Inspirational!'),
(69, 32, 'Virtually fantastic!'),
(70, 31, 'Exquisite!'),
(71, 30, 'Beautifully shared!'),
(72, 29, 'Incredible vibes!'),
(73, 28, 'Virtual harmony!'),
(74, 27, 'Kudos!'),
(75, 26, 'Captivating moments!'),
(76, 25, 'Enchanting!'),
(77, 24, 'Joyful musings!'),
(78, 23, 'Virtual brilliance!'),
(79, 22, 'Fantastic reflections!'),
(80, 21, 'Virtual serenity!'),
(81, 20, 'Virtually amazing!'),
(82, 19, 'Kudos!'),
(83, 18, 'Heartfelt joy!'),
(84, 17, 'Inspirational!'),
(85, 16, 'Virtually fantastic!'),
(86, 15, 'Exquisite!'),
(87, 14, 'Beautifully shared!'),
(88, 13, 'Incredible vibes!'),
(89, 12, 'Virtual harmony!'),
(90, 11, 'Kudos!'),
(91, 10, 'Captivating moments!'),
(92, 9, 'Enchanting!'),
(93, 8, 'Joyful musings!'),
(94, 7, 'Virtual brilliance!'),
(95, 6, 'Fantastic reflections!'),
(96, 5, 'Virtual serenity!'),
(97, 4, 'Virtually amazing!'),
(98, 3, 'Kudos!'),
(99, 2, 'Heartfelt joy!'),
(100, 1, 'Inspirational!');

INSERT INTO likes (post_id, user_id) VALUES
(1, 100),
(1, 99),
(2, 98),
(2, 97),
(3, 96),
(3, 95),
(4, 94),
(4, 93),
(5, 92),
(5, 91),
(6, 90),
(6, 89),
(7, 88),
(7, 87),
(8, 86),
(8, 85),
(9, 84),
(9, 83),
(10, 82),
(10, 81),
(11, 80),
(11, 79),
(12, 78),
(12, 77),
(13, 76),
(13, 75),
(14, 74),
(14, 73),
(15, 72),
(15, 71),
(16, 70),
(16, 69),
(17, 68),
(17, 67),
(18, 66),
(18, 65),
(19, 64),
(19, 63),
(20, 62),
(20, 61),
(21, 60),
(21, 59),
(22, 58),
(22, 57),
(23, 56),
(23, 55),
(24, 54),
(24, 53),
(25, 52),
(25, 51),
(26, 50),
(26, 49),
(27, 48),
(27, 47),
(28, 46),
(28, 45),
(29, 44),
(29, 43),
(30, 42),
(30, 41),
(31, 40),
(31, 39),
(32, 38),
(32, 37),
(33, 36),
(33, 35),
(34, 34),
(34, 33),
(35, 32),
(35, 31),
(36, 30),
(36, 29),
(37, 28),
(37, 27),
(38, 26),
(38, 25),
(39, 24),
(39, 23),
(40, 22),
(40, 21),
(41, 20),
(41, 19),
(42, 18),
(42, 17),
(43, 16),
(43, 15),
(44, 14),
(44, 13),
(45, 12),
(45, 11),
(46, 10),
(46, 9),
(47, 8),
(47, 7),
(48, 6),
(48, 5),
(49, 4),
(49, 3),
(50, 2),
(50, 1),
(51, 100),
(51, 99),
(52, 98),
(52, 97),
(53, 96),
(53, 95),
(54, 94),
(54, 93),
(55, 92),
(55, 91),
(56, 90),
(56, 89),
(57, 88),
(57, 87),
(58, 86),
(58, 85),
(59, 84),
(59, 83),
(60, 82),
(60, 81),
(61, 80),
(61, 79),
(62, 78),
(62, 77),
(63, 76),
(63, 75),
(64, 74),
(64, 73),
(65, 72),
(65, 71),
(66, 70),
(66, 69),
(67, 68),
(67, 67),
(68, 66),
(68, 65),
(69, 64),
(69, 63),
(70, 62),
(70, 61),
(71, 60),
(71, 59),
(72, 58),
(72, 57),
(73, 56),
(73, 55),
(74, 54),
(74, 53),
(75, 52),
(75, 51),
(76, 50),
(76, 49),
(77, 48),
(77, 47),
(78, 46),
(78, 45),
(79, 44),
(79, 43),
(80, 42),
(80, 41),
(81, 40),
(81, 39),
(82, 38),
(82, 37),
(83, 36),
(83, 35),
(84, 34),
(84, 33),
(85, 32),
(85, 31),
(86, 30),
(86, 29),
(87, 28),
(87, 27),
(88, 26),
(88, 25),
(89, 24),
(89, 23),
(90, 22),
(90, 21),
(91, 20),
(91, 19),
(92, 18),
(92, 17),
(93, 16),
(93, 15),
(94, 14),
(94, 13),
(95, 12),
(95, 11),
(96, 10),
(96, 9),
(97, 8),
(97, 7),
(98, 6),
(98, 5),
(99, 4),
(99, 3),
(100, 2),
(100, 1);

INSERT INTO Followers (user_id, followed_user_id) VALUES
(1, 100),
(1, 99),
(2, 98),
(2, 97),
(3, 96),
(3, 95),
(4, 94),
(4, 93),
(5, 92),
(5, 91),
(6, 90),
(6, 89),
(7, 88),
(7, 87),
(8, 86),
(8, 85),
(9, 84),
(9, 83),
(10, 82),
(10, 81),
(11, 80),
(11, 79),
(12, 78),
(12, 77),
(13, 76),
(13, 75),
(14, 74),
(14, 73),
(15, 72),
(15, 71),
(16, 70),
(16, 69),
(17, 68),
(17, 67),
(18, 66),
(18, 65),
(19, 64),
(19, 63),
(20, 62),
(20, 61),
(21, 60),
(21, 59),
(22, 58),
(22, 57),
(23, 56),
(23, 55),
(24, 54),
(24, 53),
(25, 52),
(25, 51),
(26, 50),
(26, 49),
(27, 48),
(27, 47),
(28, 46),
(28, 45),
(29, 44),
(29, 43),
(30, 42),
(30, 41),
(31, 40),
(31, 39),
(32, 38),
(32, 37),
(33, 36),
(33, 35),
(34, 34),
(34, 33),
(35, 32),
(35, 31),
(36, 30),
(36, 29),
(37, 28),
(37, 27),
(38, 26),
(38, 25),
(39, 24),
(39, 23),
(40, 22),
(40, 21),
(41, 20),
(41, 19),
(42, 18),
(42, 17),
(43, 16),
(43, 15),
(44, 14),
(44, 13),
(45, 12),
(45, 11),
(46, 10),
(46, 9),
(47, 8),
(47, 7),
(48, 6),
(48, 5),
(49, 4),
(49, 3),
(50, 2),
(50, 1),
(51, 100),
(51, 99),
(52, 98),
(52, 97),
(53, 96),
(53, 95),
(54, 94),
(54, 93),
(55, 92),
(55, 91),
(56, 90),
(56, 89),
(57, 88),
(57, 87),
(58, 86),
(58, 85),
(59, 84),
(59, 83),
(60, 82),
(60, 81),
(61, 80),
(61, 79),
(62, 78),
(62, 77),
(63, 76),
(63, 75),
(64, 74),
(64, 73),
(65, 72),
(65, 71),
(66, 70),
(66, 69),
(67, 68),
(67, 67),
(68, 66),
(68, 65),
(69, 64),
(69, 63),
(70, 62),
(70, 61),
(71, 60),
(71, 59),
(72, 58),
(72, 57),
(73, 56),
(73, 55),
(74, 54),
(74, 53),
(75, 52),
(75, 51),
(76, 50),
(76, 49),
(77, 48),
(77, 47),
(78, 46),
(78, 45),
(79, 44),
(79, 43),
(80, 42),
(80, 41),
(81, 40),
(81, 39),
(82, 38),
(82, 37),
(83, 36),
(83, 35),
(84, 34),
(84, 33),
(85, 32),
(85, 31),
(86, 30),
(86, 29),
(87, 28),
(87, 27),
(88, 26),
(88, 25),
(89, 24),
(89, 23),
(90, 22),
(90, 21),
(91, 20),
(91, 19),
(92, 18),
(92, 17),
(93, 16),
(93, 15),
(94, 14),
(94, 13),
(95, 12),
(95, 11),
(96, 10),
(96, 9),
(97, 8),
(97, 7),
(98, 6),
(98, 5),
(99, 4),
(99, 3),
(100, 2),
(100, 1);
