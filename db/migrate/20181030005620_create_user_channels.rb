class CreateUserChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :user_channels do |t|
      t.integer :user_id
      t.integer :channel_id
      t.string :description

      t.timestamps
    end
  end
end
