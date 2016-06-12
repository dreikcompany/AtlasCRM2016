class AddPromotionsMembership < ActiveRecord::Migration
  	def change 
  		add_column :promotion_memberships, :descripcion, :string
  	end
end
