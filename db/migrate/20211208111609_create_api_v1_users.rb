class CreateApiV1Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_icon

      t.timestamps
    end
  end
end
