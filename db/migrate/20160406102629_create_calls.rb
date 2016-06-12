class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.date :fechaini
      t.time :hora
      t.string :asunto
      t.string :descripcion
      t.string :estatus
      t.references :client, index: true

      t.timestamps
    end
  end
end
