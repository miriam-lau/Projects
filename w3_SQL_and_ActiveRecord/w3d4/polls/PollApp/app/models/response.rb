# == Schema Information
#
# Table name: responses
#
#  id            :integer          not null, primary key
#  answer_choice :integer          not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :respondent_already_answered

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses
      .where.not("responses.id = ?", self.id)
  end

  private

  def respondent_already_answered
    if respondent_already_answered?
      errors[:base] << 'Cannot answer again!'
    end
  end

  def respondent_already_answered?
    previous_responses = self.sibling_responses
    previous_responses.any? { |r| r.user_id == self.user_id }
  end
end
