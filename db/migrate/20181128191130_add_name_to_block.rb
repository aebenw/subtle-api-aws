class AddNameToBlock < ActiveRecord::Migration[5.2]
  def change
    add_column :blocks, :name, :string
  end
end
