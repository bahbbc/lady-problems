class AddTamponType < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :tampon_type
    end
  end
end
