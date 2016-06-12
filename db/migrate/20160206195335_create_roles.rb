class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :nombre
      t.string :estatus, limit: 1

      t.timestamps
    end
  end
end
