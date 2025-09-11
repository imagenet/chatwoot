class AddPrivateInboxes < ActiveRecord::Migration[7.0]
  def change
    add_column :inboxes, :private, :boolean, default: false
  end
end
