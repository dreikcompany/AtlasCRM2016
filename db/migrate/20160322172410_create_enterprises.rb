class CreateEnterprises < ActiveRecord::Migration
  def change
    create_table :enterprises do |t|
      t.string :nom_enterprise
      t.string :nom_intranet
      t.string :rif
      t.string :vision
      t.string :mision
      t.string :direccion
      t.string :telefono
      t.string :slogan
      t.timestamps
    end
  end
end
