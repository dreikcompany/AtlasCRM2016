class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :url
      t.string :texto
      t.integer :padre
      t.string :estatus, limit: 1
      t.timestamps
    end
  end
end
