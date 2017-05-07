require 'sqlite3'
require_relative 'question_follow'
require_relative 'questions_db'
require_relative 'reply'
require_relative 'user'
require_relative 'question_like'

class Question
  attr_reader :id, :title, :body, :author_id

  def self.find_by_author_id(author_id)
    questions = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless questions.length > 0
    questions.map do |question|
      Question.new(question)
    end
  end

  def self.most_followed(n)
    questions = QuestionFollow.most_followed_questions(n)
    raise "There are no questions" if questions.empty?
    raise "There are not that many questions" unless questions.length >= n
    questions
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    user = User.find_by_id(@author_id)
    raise "#{@author_id} not in DB" unless user
    user
  end

  def replies
    replies = Reply.find_by_question_id(@id)
    raise "#{@id} not in DB" unless replies
    replies
  end

  def followers
    users = QuestionFollow.followers_for_question_id(id)
    raise "#{id} not in DB" unless users
    users
  end
end
