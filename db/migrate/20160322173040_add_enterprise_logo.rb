class AddEnterpriseLogo < ActiveRecord::Migration
	add_attachment :enterprises , :logo
	def change
		add_reference :enterprises, :user, index: true, foreign_key: true
	end
end
