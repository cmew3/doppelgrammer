class Post < ActiveRecord::Base

  has_and_belongs_to_many :tags

  has_attached_file :picture1, styles: {medium: "220x220#"}, :storage => :s3,
    :s3_credentials => {
      :bucket => 'doppelgrammer',
      :access_key_id => Rails.application.secrets.s3_access_key_id,
      :secret_access_key => Rails.application.secrets.s3_secret_access_key_id
    }

  validates_attachment_content_type :picture1, :content_type => /\Aimage\/.*\Z/
  validates :picture1, presence: true

  has_attached_file :picture2, styles: {medium: "220x220#"}, :storage => :s3, :s3_credentials => {
      :bucket => 'doppelgrammer',
      :access_key_id => Rails.application.secrets.s3_access_key_id,
      :secret_access_key => Rails.application.secrets.s3_secret_access_key_id
    }
    
  validates_attachment_content_type :picture2, :content_type => /\Aimage\/.*\Z/
  validates :picture2, presence: true

  validates :caption1, presence: true, length: {maximum: 30, too_long: "Sorry your caption is too long"}
  validates :caption2, presence: true, length: {maximum: 30, too_long: "Sorry your caption is too long"}

  def tag_list
  end

  def tag_list=(some_tags)
    return if some_tags.empty?
    some_tags.split(" ").uniq.each do |tag|
      self.tags << Tag.find_or_create_by(text: tag)
    end
  end

end
