class Application < ActiveRecord::Base
	belongs_to :artist
	belongs_to :institution
end