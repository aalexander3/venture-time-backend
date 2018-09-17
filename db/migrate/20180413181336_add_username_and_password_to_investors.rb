class AddUsernameAndPasswordToInvestors < ActiveRecord::Migration[5.2]
  def change
    add_column :investors, :username, :string
    add_column :investors, :password_digest, :string
  end
end
