class AddAnalystEmail < ActiveRecord::Migration
  	def change 
  		add_column :analysts, :email, :string
  	end
end
