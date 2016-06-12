class AddDescripcionEnterprises < ActiveRecord::Migration
  def change
  	add_column :enterprises, :descripcion, :string
  end
end
