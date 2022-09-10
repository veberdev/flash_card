class ChangeWrongAnswerToTreeColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :wrong_answers
    add_column :questions, :n1_wrong_answers, :string 
    add_column :questions, :n2_wrong_answers, :string
    add_column :questions, :n3_wrong_answers, :string
  end
end
