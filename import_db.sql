CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_followers (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL, 
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_id INTEGER NOT NULL,
    parent_id INTEGER,
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    
    FOREIGN KEY (subject_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)    
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

-- Seeding with some starting data to play around with
INSERT INTO
    users (id, fname, lname)
VALUES
    (1, 'Pierce', 'Brosnan'),
    (2, 'Sean', 'Connery'),
    (3, 'Daniel', 'Craig'),
    (4, 'Roger', 'Moore')
;

INSERT INTO
    questions (id, title, body, author_id)
VALUES
    (1, "Best?", "Which of us is the best?", 1),
    (2, "Favorite Bond girl?", "(see subject)", 2),
    (3, "Trebek, man", "Such an idiot.", 2)
;

INSERT INTO
    question_followers (id, question_id, user_id)
VALUES
    -- follow own questions
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 2),
    -- and more
    (4, 1, 2),
    (5, 1, 3),
    (6, 1, 4)
; 

INSERT INTO
    replies (id, subject_id, parent_id, author_id, body)
VALUES
    (1, 1, NULL, 1, "I don't know why I ask, because, obviously, me."),
    (2, 1, 1, 3, "I dunno, but that guy in Skyfall was pretty great."),
    (3, 1, 2, 2, "Your mom is pretty fond of *me,* Craig.")
;

INSERT INTO
    question_likes (id, user_id, question_id)
VALUES
    (1, 4, 1)
;


