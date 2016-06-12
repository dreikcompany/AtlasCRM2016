class EnterprisesController < ApplicationController
  #before_action :set_enterprise, only: [:show, :edit, :update, :destroy]

  # GET /enterprises
  # GET /enterprises.json
  def cargar
    redirect_to atlascrm_com_path(session[:nom_enterprise])
    
  end

  def index
    @enterprises = Enterprise.all
    @enterprise=Enterprise.find(session[:enterprise_id])
    @clientes= @enterprise.clients
    @ejecutivos= @enterprise.excecutives  
    @analistas = @enterprise.analysts
    @productos = @enterprise.products
    @reuniones = @enterprise.meetings
    atlascrm_com()
  end

  # GET /enterprises/1
  # GET /enterprises/1.json
  def show
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises
  # POST /enterprises.json
  def create
    @enterprise = Enterprise.new(enterprise_params)

    respond_to do |format|
      if @enterprise.save
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully created.' }
        format.json { render :show, status: :created, location: @enterprise }
      else
        format.html { render :new }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enterprises/1
  # PATCH/PUT /enterprises/1.json
  def update
    respond_to do |format|
      if @enterprise.update(enterprise_params)
        format.html { redirect_to @enterprise, notice: 'Enterprise was successfully updated.' }
        format.json { render :show, status: :ok, location: @enterprise }
      else
        format.html { render :edit }
        format.json { render json: @enterprise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enterprises/1
  # DELETE /enterprises/1.json
  def destroy
    @enterprise.destroy
    respond_to do |format|
      format.html { redirect_to enterprises_url, notice: 'Enterprise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def crear_executive_enterprise
            @executive = @enterprise.excecutives.new(nombre: params[:nombre],apellido: params[:apellido],
    estatus: 'A')
          respond_to do |format|
        if @executive.save
            format.html { redirect_to enterprises_path, notice: 'Empresa creada exitosamente' }
          else
        format.html { redirect_to enterprises_path, alert: 'No se pudo guardar la empresa' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enterprise_params
      params.require(:enterprise).permit(:nom_enterprise, :nom_intranet, :rif, :vision, :mision, :direccion, :telefono, :slogan, :user_id)
    end
end
