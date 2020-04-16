class CreateApplications < ActiveRecord::Migration[5.2]
  def change
  	create_table :applications do |t|
  		t.integer :artist_id
  		t.integer :institution_id
  		t.string :statement
  		t.string :photo_url
  	end
  end
end
