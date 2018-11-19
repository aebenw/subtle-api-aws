class CreateChannelFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_followers do |t|

      t.integer :follower_id
      t.integer :channel_id
    end
  end
end
