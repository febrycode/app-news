class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :name, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
    add_index :news, :status
  end
end
