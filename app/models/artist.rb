class Artist < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods

	has_many :applications
	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
end