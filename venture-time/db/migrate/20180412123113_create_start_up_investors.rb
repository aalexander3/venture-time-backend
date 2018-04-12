class CreateStartUpInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :start_up_investors do |t|
      t.references :investor, index: true
      t.references :start_up, index: true

      t.timestamps
    end
  end
end
