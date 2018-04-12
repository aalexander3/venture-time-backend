class CreateStartUps < ActiveRecord::Migration[5.2]
  def change
    create_table :start_ups do |t|
      t.string :name
      t.string :mission
      t.text :description
      t.string :field
      t.string :logo
      t.string :url
      t.integer :funds_needed
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
