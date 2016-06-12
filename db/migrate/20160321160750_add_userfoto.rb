class AddUserfoto < ActiveRecord::Migration
	add_attachment :users , :avatar
  def change
  	change_table :users do |f|
  		f.remove :foto
  	end
  end
end
