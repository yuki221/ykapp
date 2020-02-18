class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :user_id, :bigint
    add_column :posts, :image_id, :string
  end
end
