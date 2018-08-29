class AddTitleToBail < ActiveRecord::Migration[5.2]
  def change
    add_column :bails, :title, :string
  end
end
