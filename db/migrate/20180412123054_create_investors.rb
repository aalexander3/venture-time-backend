class CreateInvestors < ActiveRecord::Migration[5.2]
  def change
    create_table :investors do |t|
      t.string :name
      t.string :mission
      t.text :description
      t.string :interests
      t.string :logo
      t.string :url
      t.integer :funds_to_invest
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
