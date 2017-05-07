class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :des
      t.string :add
      t.string :time
      t.references :user, foreign_key: true

      t.timestamps
    end
	    add_index :microposts, [:user_id, :created_at]

  end
end
