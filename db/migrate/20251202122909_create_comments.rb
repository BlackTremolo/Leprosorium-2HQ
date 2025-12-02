class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |c|
      c.text :content
      c.text :author
      c.integer :post_id

      c.timestamps
    end
  end
end
