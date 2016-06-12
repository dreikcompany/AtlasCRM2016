class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :asunto
      t.string :informacion
      t.date :fecha
      t.time :hora
      t.string :lugar
      t.references :enterprise, index: true

      t.timestamps
    end
  end
end
