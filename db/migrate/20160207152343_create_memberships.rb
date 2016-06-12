class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :nombre
      t.decimal :monto, precision: 10, scale: 2
      t.string :estatus, limit: 1

      t.timestamps
    end
  end
end
