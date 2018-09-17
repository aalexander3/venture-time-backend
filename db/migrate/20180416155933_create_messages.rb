class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message_body
      t.string :username
      t.references :start_up_investor, index: true
      t.timestamps
    end
  end
end
