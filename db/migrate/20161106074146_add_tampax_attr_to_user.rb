class AddTampaxAttrToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.integer :hours_wering_tampon
      t.boolean :tampon_leak
      t.boolean :disconfort_during_removal
      t.string :flow
      t.string :activity_level
      t.string :tampon_absorbency_type
    end
  end
end
