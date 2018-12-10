class AddColumnToStartUpInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :start_up_investors, :liked, :boolean
    add_column :start_up_investors, :disliked, :boolean
  end
end
