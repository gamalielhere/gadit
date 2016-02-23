class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :upvotes
      t.integer :comments
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
