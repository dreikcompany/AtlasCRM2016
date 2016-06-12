class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 8
      t.string :email
      t.string :clave, limit: 8
      t.string :foto
      t.text :p_secreta
      t.text :r_secreta
      t.string :estatus, limit: 1

      t.timestamps
    end
  end
end
