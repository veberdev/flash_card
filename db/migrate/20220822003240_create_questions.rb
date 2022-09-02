class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct_answer
      t.string :wrong_answers
      t.references :deck, null: false, foreign_key: true

      t.timestamps
    end
  end
end
