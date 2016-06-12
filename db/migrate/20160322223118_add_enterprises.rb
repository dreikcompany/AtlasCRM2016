class AddEnterprises < ActiveRecord::Migration
  def change
    add_column :enterprises, :estatus, :string,limit: 1
  end
end
