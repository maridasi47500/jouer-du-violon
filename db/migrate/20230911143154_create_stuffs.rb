class CreateStuffs < ActiveRecord::Migration[7.0]
  def change
    create_table :stuffs do |t|
      t.integer :memo_id
      t.text :content

      t.timestamps
    end
  end
end
