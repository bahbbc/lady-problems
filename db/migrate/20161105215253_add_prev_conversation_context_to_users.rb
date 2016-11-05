class AddPrevConversationContextToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.text :prev_conversation_context, null: true
    end
  end
end
