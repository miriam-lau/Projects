require 'sqlite3'
require_relative 'questions_db'
require_relative 'question_follow'
require_relative 'question'
require_relative 'user'
require_relative 'question_like'

class Reply
  attr_reader :id
  attr_accessor :subject_question_id, :parent_reply_id, :author_id, :body

  def self.find_by_author_id(author_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        replies
      WHERE
        author_id = ?
    SQL
    return nil unless replies.length > 0
    replies.map do |reply|
      Reply.new(reply)
    end
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless replies.length > 0
    replies.map do |reply|
      Reply.new(reply)
    end
  end

  def initialize(options)
    @id = options['id']
    @subject_question_id = options['subject_question_id']
    @parent_reply_id = options['parent_reply_id']
    @author_id = options['author_id']
    @body = options['body']
  end

  def author
    user = User.find_by_id(@author_id)
    raise "#{@author_id} is not in DB" unless user
    user
  end

  def question
    question = QuestionsDBConnection.instance.execute(<<-SQL, @subject_question_id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0
    Question.new(question.first)
  end

  def parent_reply
    reply = QuestionsDBConnection.instance.execute(<<-SQL, @parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless reply.length > 0
    Reply.new(reply.first)
  end

  def child_replies
    replies = QuestionsDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    return nil unless replies.length > 0
    replies.map do |reply|
      Reply.new(reply)
    end
  end
end
