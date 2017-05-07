class ChangeAnswerChoiceColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :responses, :answer_choice, :answer_choice_id
  end
end
