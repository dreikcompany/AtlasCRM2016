class ExecutivesController < ApplicationController
def index
  	@clients = Client.select("id, nombre").where(:activo => true).order("id ");
  #	@ultimos_clientes = Client.select("clients.id, clients.nombre, memberships.monto, promotion_memberships.estatus,
  #	 promotion_memberships.f_inicio,promotion_memberships.f_fin,(promotion_memberships.descuento*100) as descuento,
  #	 promotion_memberships.descripcion,(memberships.monto -(memberships.monto*promotion_memberships.descuento) ) as total").joins(:promotion_memberships).order("promotion_memberships.id DESC").limit(10);
  atlascrm_com()
  end
 
  def create
  	#if params[:nombre_id].empty?
  	#	respond_to do |format|
     #   format.html { redirect_to executives_path, alert: 'el campo campaña no puede ser vacio' }
    #	end
    #else
    	@executives = Campaigns.new(nombre: params[:nombre], descripcion: params[:descripcion] ,precio: params[:precio], fechaini: params[:fechaini], fechafin: params[:fechafin], estatus: params[:estatus])
    respond_to do |format|
    		if @executives.save
        		format.html { redirect_to executives_path, notice: 'campaña creada exitosamente' }
      	else
				format.html { redirect_to executives_path, alert: 'No se pudo guardar la camapaña' }
       	end 
       end
  	#end
  end

  def create_call
    if params[:client_id].empty?
    respond_to do |format|
        format.html { redirect_to executives_path, alert: 'el campo cliente no puede ser vacio' }
      end
    else
    @executives = Call.new(fechaini: params[:fechaini],hora: params[:hora],asunto: params[:asunto],
      descripcion: params[:descripcion], client_id: params[:client_id],
      estatus: params[:estatus])
    respond_to do |format|
        if @executives.save
            format.html { redirect_to executives_path, notice: 'llamda registrada exitosamente' }
        else
      format.html { redirect_to executives_path, alert: 'No se pudo registrar la llamada' }
          end 
       end
    end
  end



   def correo
    if params[:client_id].empty?
      respond_to do |format|
          format.html { redirect_to executives_path, alert: 'el campo cliente no puede ser vacio' }
      end
    else
      if params[:mensaje].empty?
        respond_to do |format|
            format.html { redirect_to executives_path, alert: 'Debe Escribir un mensaje' }
        end
      else
        @client = Client.all
        @mensaje = params[:mensaje]
        #@membership = Membership.find(params[:membership_id])
        @campaign = Campaign.where('client_id = ? AND estatus = ? ',params[:client_id],'A').order('id desc').limit(1)
        if @campaign.empty?
          respond_to do |format|
            format.html { redirect_to executives_path , alert: 'La Campaña no esta activa' }
          end
      else
        respond_to do |format|
          Excecutives.envio_masivo(@client,@mensaje,@campaign).deliver
          format.html { redirect_to executives_path , notice: 'Todos los correos han sido enviados' }
        end
        end
      end
    end
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
