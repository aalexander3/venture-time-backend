class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :start_up_investors, index: true
      t.timestamps
    end
  end
end
