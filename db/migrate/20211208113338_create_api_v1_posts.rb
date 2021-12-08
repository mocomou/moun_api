class CreateApiV1Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
