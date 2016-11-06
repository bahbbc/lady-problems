class AddMoreDetailToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :menstruation_days, null: true
      t.string :menstruation_intensity, null: true
      t.boolean :menstruation_reminder, null: true
      t.boolean :anticoncepcional, null: true
      t.integer :anticoncepcional_pause_days, null: true
      t.integer :anticoncepcional_hour, null: true
      t.integer :contraceptive, null: true
    end
  end
end
