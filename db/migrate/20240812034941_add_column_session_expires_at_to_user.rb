class AddColumnSessionExpiresAtToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :session_expires_at, :timestamp
  end
end
