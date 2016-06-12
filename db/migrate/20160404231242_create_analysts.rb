class CreateAnalysts < ActiveRecord::Migration
  def change
    create_table :analysts do |t|
      t.string :nombre
      t.string :apellido
      t.integer :edad
      t.text :direccion
      t.string :telefono
      t.string :sexo
      t.string :estatus
      t.references :enterprise, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
