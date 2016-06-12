class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :descripcion
      t.float :precio
      t.integer :cantidad
      t.references :enterprise, index: true

      t.timestamps
    end
  end
end
