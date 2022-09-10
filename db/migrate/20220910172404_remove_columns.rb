class RemoveColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :n1_wrong_answers
    remove_column :questions, :n2_wrong_answers
    remove_column :questions, :n3_wrong_answers
  end
end
