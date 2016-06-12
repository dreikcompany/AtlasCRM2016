class TemplateController < ApplicationController
  def configuration
    if session[:user_id]
      @enterprise = Enterprise.find_by(user_id: session[:user_id])
      if @enterprise
        #@enterprise = Enterprise.find_by(nom_intranet: session[:nom_enterprise])
        @template = Template.find_by(enterprise_id: @enterprise.id)
      else
        redirect_to atlascrm_com_path(session[:nom_enterprise])
      end
    else
      redirect_to atlascrm_com_path(session[:nom_enterprise])
    end
  end

  def create
  	@enterprise = Enterprise.find_by(nom_intranet: session[:nom_enterprise])
  	@template = Template.new(bg_h: params[:pick_a_color_0],bg_a: params[:pick_a_color_1],logo: params[:logo],
      slider1: params[:slider1],slider2: params[:slider2],slider3: params[:slider3],
      favicon: params[:favicon],t_slider1: params[:t_slider1],t_slider2: params[:t_slider2],
      t_slider3: params[:t_slider3],estatus: params[:estatus], enterprise_id: params[:enterprise_id])
    respond_to do |format|
      if @template.save
        format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]),
        notice: 'La plantilla se ha creado satisfactoriamente' } 
      else
        redirect_to template_configuration_path
      end
    end
  end

  def update
    @enterprise = Enterprise.find_by(nom_intranet: session[:nom_enterprise])
    @template = Template.find_by(enterprise_id: @enterprise.id)
    respond_to do |format|
      if @template.update(bg_h: params[:pick_a_color_0],bg_a: params[:pick_a_color_1],logo: params[:logo],
        slider1: params[:slider1],slider2: params[:slider2],slider3: params[:slider3],
        favicon: params[:favicon],t_slider1: params[:t_slider1],t_slider2: params[:t_slider2],
        t_slider3: params[:t_slider3],estatus: params[:estatus], enterprise_id: params[:enterprise_id])
          format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]),
          notice: 'La plantilla se ha actualizado satisfactoriamente' } 
      else
        redirect_to template_configuration_path
      end
    end
  end

  private

end
