class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email, null: false

      t.integer :age, null: false
      t.boolean :age_confirmed, null: false, default: true

      t.string :facebook_id, null: false

      t.timestamps
    end
  end
end
