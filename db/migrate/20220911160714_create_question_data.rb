class CreateQuestionData < ActiveRecord::Migration[7.0]
  def change
    create_table :question_data do |t|
      t.references :question, null: false, foreign_key: true
      t.integer :retention_rate, default: 0
      t.integer :correct_times, default: 0
      t.integer :times_done, default: 0
      t.integer :show_up_coeficient, default: 100

      t.timestamps
    end
  end
end
