class CreateMyfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :myfiles do |t|
      t.string :title
      t.string :filename
      t.integer :post_id

      t.timestamps
    end
  end
end
