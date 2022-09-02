class CreateDecks < ActiveRecord::Migration[7.0]
  def change
    create_table :decks do |t|
      t.string   :name
      t.string   :description
      t.integer  :show_up_coeficient
      t.integer  :retention_spectrum
      t.integer  :correct_times
      t.integer  :times_done

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
