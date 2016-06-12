class DeleteEmailUsers < ActiveRecord::Migration
  def change
  	change_table :users do |f|
  		f.remove :email
  	end
  end
end
