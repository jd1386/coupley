class Post < ActiveRecord::Base

belongs_to :user
has_many :replies

default_scope -> { order('created_at desc') }
validates :user_id, presence: true
# Disabled the following to enable users to upload image without content
# validates :content, presence: true

has_attached_file :image, 
	:styles => { large: "600x600>", medium: "300x300>", thumb: "150x150>" },
	:path => ":rails_root/public/system/image/:style/:hash.:extension",
	:url => "/system/image/:style/:hash.:extension",
  :hash_secret => "longSecretString" 

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

scope :has_photos, -> { where('image_file_name IS NOT NULL').order(:created_at) }
scope :has_link, -> { where('link IS NOT NULL').order(:created_at) } 

accepts_nested_attributes_for :replies

end
