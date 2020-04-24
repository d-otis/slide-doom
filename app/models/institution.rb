class Institution < ActiveRecord::Base
	include SlugMod::Slugify
	extend SlugMod::ClassMethods
	has_many :applications

	# def slug
	# 	name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
	# end

	# def self.find_by_slug(slug)
	# 	self.all.find {|instance| instance.slug == slug} 
	# end

end