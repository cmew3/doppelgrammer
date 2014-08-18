class Post < ActiveRecord::Base

	has_attached_file :picture1
  validates_attachment_content_type :picture1, :content_type => /\Aimage\/.*\Z/
end
