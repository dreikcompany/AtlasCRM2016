class AddFotoToProduct < ActiveRecord::Migration
    add_attachment :products , :fotoprincipal
	add_attachment :products , :foto1
    add_attachment :products , :foto2
  def change
  end
end
