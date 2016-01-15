class Listing < ActiveRecord::Base

	acts_as_taggable
	acts_as_taggable_on :tags

	mount_uploader :listing, ListingUploader


	belongs_to :user

end
