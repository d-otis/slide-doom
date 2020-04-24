# require_relative "./concerns/slugify"

class Artist < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods

	has_many :applications
	has_secure_password

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	# def slug
	# 	name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	# end

	# def self.find_by_slug(slug)
	# 	self.all.find {|instance| instance.slug == slug} 
	# end
end