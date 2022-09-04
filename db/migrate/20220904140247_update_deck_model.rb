class UpdateDeckModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :decks, :show_up_coeficient, :string
    add_column :decks, :questios_contained, :integer, default: 0, null: false
    rename_column :decks, :correct_times, :correct_times_rate 
    change_column :decks, :correct_times_rate, :integer, default: 0, null: false
    rename_column :decks, :times_done, :questions_times_done
    change_column :decks, :questions_times_done, :integer, default: 0, null: false
  end
end
