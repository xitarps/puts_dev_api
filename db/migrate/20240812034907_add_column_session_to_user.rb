class AddColumnSessionToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :session, :uuid
  end
end
