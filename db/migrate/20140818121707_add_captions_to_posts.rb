class AddCaptionsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :caption1, :string
    add_column :posts, :caption2, :string
  end
end
