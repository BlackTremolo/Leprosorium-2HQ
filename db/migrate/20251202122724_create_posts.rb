class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |post|
        post.text :content
        post.text :author

        post.timestamps
    end
  end
end
