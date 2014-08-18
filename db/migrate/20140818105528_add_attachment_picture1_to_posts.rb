class AddAttachmentPicture1ToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :picture1
    end
  end

  def self.down
    remove_attachment :posts, :picture1
  end
end
