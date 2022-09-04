class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.string   :name
      t.string   :description
      t.integer  :show_up_coeficient, default: 0, null: false
      t.integer  :retention_spectrum, default: 0, null: false
      t.integer  :correct_times, default: 0, null: false
      t.integer  :times_done, default: 0, null: false

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
