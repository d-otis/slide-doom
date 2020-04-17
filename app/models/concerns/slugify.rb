module SlugMod

	module Slugify
		def slug
			name.downcase.gsub(/[!?@ +,&]/, "-").gsub(/[().']/, "").gsub("$", "s").squeeze("-")
		end
	end

	module ClassMethods
		def find_by_slug(slug)
			self.all.find {|instance| instance.slug == slug} 
		end
	end
	
end