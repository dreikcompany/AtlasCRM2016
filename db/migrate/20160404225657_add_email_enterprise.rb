class AddEmailEnterprise < ActiveRecord::Migration
  	def change 
  		add_column :enterprises, :email, :string
  	end
end
