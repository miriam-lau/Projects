DROP TABLE users;
DROP TABLE questions;
DROP TABLE question_follows;
DROP TABLE replies;
DROP TABLE question_likes;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY(user_id) REFERENCES user(id),
  FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY(subject_question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  author_id INTEGER NOT NULL,
  FOREIGN KEY(question_id) REFERENCES questions(id),
  FOREIGN KEY(author_id) REFERENCES users(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Jill', 'Delosangeles'),
  ('Miriam', 'Lau');

INSERT INTO
  questions(title, body, author_id)
VALUES
  ('Color', 'What''s your favorite color?', (SELECT id FROM users WHERE
    fname = 'Jill')),
  ('Hobby', 'What''s your favorite hobby?', (SELECT id FROM users WHERE
    fname = 'Miriam'));

INSERT INTO
  replies(subject_question_id, parent_reply_id, author_id, body)
VALUES
  ((SELECT id FROM questions WHERE id = 1), NULL,
  (SELECT id FROM users WHERE fname = 'Miriam'), 'Purple'),
  ((SELECT id FROM questions WHERE id = 2), NULL,
  (SELECT id FROM users WHERE fname = 'Jill'), 'Dancing'),
  ((SELECT id FROM questions WHERE id = 1), 1,
  (SELECT id FROM users WHERE fname = 'Jill'), 'Green');

INSERT INTO
  question_follows(user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Jill'), 2),
  ((SELECT id FROM users WHERE fname = 'Miriam'), 1);

INSERT INTO
  question_likes(question_like, question_id, author_id)
VALUES
  ((SELECT id FROM questions WHERE id = 1), (SELECT id FROM users WHERE fname = 'Jill'));
