class Post < ActiveRecord::Base
  has_attached_file :picture1, styles: {medium: "220x220#"}
  validates_attachment_content_type :picture1, :content_type => /\Aimage\/.*\Z/
  validates :picture1, presence: true

  has_attached_file :picture2, styles: {medium: "220x220#"}
  validates_attachment_content_type :picture2, :content_type => /\Aimage\/.*\Z/
  validates :picture2, presence: true

  validates :caption1, presence: true, length: {maximum: 30, too_long: "Sorry your caption is too long"}
  validates :caption2, presence: true, length: {maximum: 30, too_long: "Sorry your caption is too long"}
end
