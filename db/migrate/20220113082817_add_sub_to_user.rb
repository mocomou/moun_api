class AddSubToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :sub, :string
  end
end
