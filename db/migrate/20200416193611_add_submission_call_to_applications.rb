class AddSubmissionCallToApplications < ActiveRecord::Migration[5.2]
  def change
  	add_column :applications, :submission_call, :string
  end
end
