class Application < ActiveRecord::Base
	belongs_to :artist
	belongs_to :institution

	validates :statement, :submission_call, :photo_url, presence: true
end