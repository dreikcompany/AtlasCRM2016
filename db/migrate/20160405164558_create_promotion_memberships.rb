class CreatePromotionMemberships < ActiveRecord::Migration
  def change
    create_table :promotion_memberships do |t|
      t.date :f_inicio
      t.date :f_fin
      t.decimal :descuento , precision: 3, scale: 2
      t.string :estatus
      t.references :membership, index: true

      t.timestamps
    end
  end
end
