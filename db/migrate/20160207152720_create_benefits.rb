class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :descripcion
      t.string :estatus, limit: 1

      t.timestamps
    end
  end
end
