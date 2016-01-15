class Listing < ActiveRecord::Base

	acts_as_taggable
	acts_as_taggable_on :tags
	has_many :pictures

	mount_uploaders :images, ImageUploader


	belongs_to :user

end
