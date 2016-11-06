class AddLastMenstruationDateToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.date :menstruation_date, null: true
    end
  end
end
