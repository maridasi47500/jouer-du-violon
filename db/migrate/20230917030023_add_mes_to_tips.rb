class AddMesToTips < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :mes, :integer
  end
end
