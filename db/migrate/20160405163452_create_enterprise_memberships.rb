class CreateEnterpriseMemberships < ActiveRecord::Migration
  def change
    create_table :enterprise_memberships do |t|
      t.date :f_inicio
      t.date :f_fin
      t.decimal :monto, precision: 10, scale: 2
      t.string :estatus
      t.references :enterprise, index: true
      t.references :membership, index: true
      t.timestamps
    end
  end
end
