class ClientsController < ApplicationController

  def index
    @enterprise=Enterprise.find(session[:enterprise_id])
    @productos = @enterprise.products
  	atlascrm_com()
  end


  def atlascrm_com
  @e = Enterprise.find_by(nom_intranet: params[:nom_intranet])
  if @e.nil?
    redirect_to buscador_path
  else
    session[:nom_enterprise] = @e.nom_enterprise
    session[:nom_intranet] = @e.nom_intranet
    session[:enterprise_id] = @e.id
    @p = Template.find_by(enterprise_id: @e.id)
    if @p
      session[:bg_h_f] = @p.bg_h
      session[:bg_a] = @p.bg_a
      session[:logo] = @p.logo.url
      session[:slider1] = @p.slider1.url
      session[:slider2] = @p.slider2.url
      session[:slider3] = @p.slider3.url
      session[:favicon] = @p.favicon.url
      session[:t_slider1] = @p.t_slider1
      session[:t_slider2] = @p.t_slider2
      session[:t_slider3] = @p.t_slider3
      render layout: 'template'
    else 
      session[:bg_h_f] = ''
      session[:bg_a] = ''
      session[:logo] = ''
      session[:slider1] = ''
      session[:slider2] = ''
      session[:slider3] = ''
      session[:favicon] = ''
      session[:t_slider1] = ''
      session[:t_slider2] = ''
      session[:t_slider3] = ''
      render layout: 'template'
    end
  end
end
end
