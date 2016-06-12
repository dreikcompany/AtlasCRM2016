class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :bg_h
      t.string :bg_a
      t.string :bg_f

      t.timestamps
    end
  end
end
