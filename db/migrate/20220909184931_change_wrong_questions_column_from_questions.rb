class ChangeWrongQuestionsColumnFromQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :wrong_answers, "varchar[] USING (string_to_array(wrong_answers, ','))"
  end
end
