class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.integer :nuance_id
      t.integer :post_id
      t.integer :measure

      t.timestamps
    end
  end
end
