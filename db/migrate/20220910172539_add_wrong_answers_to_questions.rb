class AddWrongAnswersToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :wrong_answer_n1, :string 
    add_column :questions, :wrong_answer_n2, :string
    add_column :questions, :wrong_answer_n3, :string
  end
end
