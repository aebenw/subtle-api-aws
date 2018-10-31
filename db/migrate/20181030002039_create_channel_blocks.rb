class CreateChannelBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :channel_blocks do |t|
      t.integer :channel_id
      t.integer :block_id
      t.timestamps
    end
  end
end
