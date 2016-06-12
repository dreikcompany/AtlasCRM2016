class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :nombre
      t.string :descripcion
      t.float :precio
      t.date :fechaini
      t.date :fechafin
      t.string :estatus

      t.timestamps
    end
  end
end
