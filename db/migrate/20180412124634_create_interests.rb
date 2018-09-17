class CreateInterests < ActiveRecord::Migration[5.2]
  def change
    create_table :interests do |t|
      t.string :category
      t.references :investor, index: true

      t.timestamps
    end
  end
end
