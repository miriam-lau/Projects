require 'sqlite3'
require_relative 'question_follow'
require_relative 'questions_db'
require_relative 'question'
require_relative 'reply'
require_relative 'question_like'

class User
  attr_accessor :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
        AND lname = ?
    SQL
    return nil unless user.length > 0
    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    questions = Question.find_by_author_id(@id)
    raise "#{@id} not found in DB" unless questions
    questions
  end

  def authored_replies
    replies = Reply.find_by_author_id(@id)
    raise "#{@id} not found in DB" unless replies
    replies
  end

  def followed_questions
    questions = QuestionFollow.followed_questions_for_user_id(@id)
    raise "#{@id} is not following questions" unless questions
    questions
  end
end
