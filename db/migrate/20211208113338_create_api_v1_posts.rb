class CreateApiV1Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :sub
      t.string :user_name

      t.timestamps
    end
  end
end
