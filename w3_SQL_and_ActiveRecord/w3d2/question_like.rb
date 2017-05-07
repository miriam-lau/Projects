require 'sqlite3'
require_relative 'question_follow'
require_relative 'questions_db'
require_relative 'question'
require_relative 'reply'
require_relative 'user'

class QuestionLike
  def self.likers_for_question_id(question_id)
    users = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_likes ON question_likes.author_id = users.id
      JOIN
        questions ON question_likes.question_id = questions.id
      WHERE
        questions.id = ?
    SQL
    return nil unless users.length > 0
    users.map do |user|
      User.new(user)
    end
  end
end
