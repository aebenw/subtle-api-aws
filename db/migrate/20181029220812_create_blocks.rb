class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.integer :user_id
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
