require 'sqlite3'
require_relative 'questions_db'
require_relative 'question'
require_relative 'reply'
require_relative 'user'
require_relative 'question_like'

class QuestionFollow

  def self.followers_for_question_id(question_id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON question_follows.user_id = users.id
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        questions.id = ?
    SQL
    return nil unless users.length > 0
    users.map do |user|
      User.new(user)
    end
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      JOIN
        users ON question_follows.user_id = users.id
      WHERE
        users.id = ?
    SQL
    return nil unless questions.length > 0
    questions.map do |question|
      Question.new(question)
    end
  end

  def self.most_followed_questions(n)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        *, COUNT(question_follows.user_id) AS num_users
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_follows.question_id
      JOIN
        users ON users.id = question_follows.user_id
      GROUP BY
        question_follows.question_id
      ORDER BY
        num_users DESC
      LIMIT
        ?
    SQL
    return nil unless questions.length > 0
    questions.map do |question|
      Question.new(question)
    end
  end
end
