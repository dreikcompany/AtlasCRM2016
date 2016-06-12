class AddTemplateCampos < ActiveRecord::Migration

	add_attachment :templates , :favicon
  def change
  	 add_column :templates, :t_slider1, :text
  	 add_column :templates, :t_slider2, :text
  	 add_column :templates, :t_slider3, :text
  	 add_column :templates, :estatus, :string,limit: 1
  end
end
