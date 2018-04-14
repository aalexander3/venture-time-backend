class AddUsernameAndPasswordToStartUps < ActiveRecord::Migration[5.2]
  def change
    add_column :start_ups, :username, :string
    add_column :start_ups, :password_digest, :string
  end
end
