class AddFotosTemplate < ActiveRecord::Migration
	add_attachment :templates , :logo
	add_attachment :templates , :logo2
	add_attachment :templates , :slider1
	add_attachment :templates , :slider2
	add_attachment :templates , :slider3
  def change
  	add_reference :templates, :enterprise, index: true, foreign_key: true
  end
end
