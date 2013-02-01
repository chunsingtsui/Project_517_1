class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content

      t.timestamps
      t.references :category
      t.references :post
      t.references :user
    end
  end
end
