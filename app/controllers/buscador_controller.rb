class BuscadorController < ApplicationController
	layout false
  def index
  	render layout: 'buscador' 
  end

  def result
  	@s = params[:txtbuscar]
  	q = @s.strip + '%'
  	@enterprises = Enterprise.all.where('nom_enterprise like ?',q)
  	render layout: 'buscador' 
  end
end
