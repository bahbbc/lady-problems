class ChangeHoursWearingTampon < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :hours_wering_tampon, :string
  end
end
