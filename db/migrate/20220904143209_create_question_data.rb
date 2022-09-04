class CreateQuestionData < ActiveRecord::Migration[7.0]
  def change
    create_table :question_data do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :retention_spectrum
      t.integer :correct_times
      t.integer :show_up_coeficient

      t.timestamps
    end
  end
end
