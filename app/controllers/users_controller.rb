class UsersController < ApplicationController
  def crear_user_enterprise
    if params[:nom_enterprise].empty? || params[:nom_intranet].empty? || params[:email].empty? ||
      params[:nom_user].empty? || params[:clave].empty? || params[:re_clave].empty?
      respond_to do |format|
          format.html { redirect_to root_path, alert: 'Los Datos Suministrados son incorrectos' }
      end
    else
       @user = User.find_by(username:params[:nom_user])
       if @user
            respond_to do |format|
              format.html { redirect_to root_path, alert: 'el Usuario esta en uso' }
          end
       else
          @enterprise = Enterprise.find_by(nom_intranet: params[:nom_intranet])
          if @enterprise
            respond_to do |format|
              format.html { redirect_to root_path, alert: 'la intranet esta en uso' }
            end
          else
            @enterprise = Enterprise.find_by(nom_enterprise: params[:nom_enterprise])
            if @enterprise
              respond_to do |format|
                format.html { redirect_to root_path, alert: 'El Nombre de la Empresa ya Existe' }
              end
            else
              @enterprise = Enterprise.find_by(email: params[:email])
              if @enterprise 
                respond_to do |format|
                  format.html { redirect_to root_path, alert: 'El Correo ya Se encuentra registrado' }
                end
              else 
                @role_id = 2
                @estatus = 'A'
                @user = User.new(username: params[:nom_user],clave: params[:clave],role_id: @role_id, estatus: @estatus)
                if @user.save
                  @enterprise = Enterprise.new(nom_enterprise: params[:nom_enterprise], nom_intranet: params[:nom_intranet], 
                    email: params[:email],role_id: 2,estatus: @estatus)
                  @enterprise.save
                  log_in(@user)
                  respond_to do |format|
                    format.html { redirect_to root_path, notice: 'Usuario creado exitosamente' }
                  end
                else 
                  respond_to do |format|
                    format.html { redirect_to root_path, alert: 'Ocurrio un problema al guardar este usuario' }
                  end
                end
              end
            end
          end
       end
    end
  end

  def crear_user_cliente
    @nom_user = params[:nom_user]
    @user = User.find_by(username: @nom_user)
    if @user
      respond_to do |format|
          format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]), alert: 'el Usuario esta en uso' }
      end
    else
      if params[:clave] != params[:re_clave]
        respond_to do |format|
          format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]), alert: 'Las contraseñas deben ser iguales para confimación' }
        end
      else
        if params[:nombre].empty?
          respond_to do |format|
            format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]), alert: 'el nombre no puede ser vacio' }
          end
        else 
          @role_id = 5
          @estatus = 'A'
          @user = User.new(username: params[:nom_user],clave: params[:clave],role_id: @role_id, estatus: @estatus)
          if @user.save
            @client = Client.new(nombre: params[:nombre], apellido: params[:apellido],email: params[:email],
              user_id: @user.id, enterprise_id: session[:enterprise_id], estatus: @estatus)
              @client.save
              log_in(@user)
              respond_to do |format|
                format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]), notice: 'Usuario creado exitosamente' }
              end
          else
            respond_to do |format|
            format.html { redirect_to atlascrm_com_path(session[:nom_enterprise]), alert: 'Ocurrio un problema al guardar este usuario' }
            end
          end
        end 
      end
    end
  end

  def validate_user
  	@nom_user = params[:nom_user]
  	@user = User.find_by(username: @nom_user)

  	respond_to do |f|
  		f.js{}
  	end
  end

  def show
  end

  def log_in(user)
    session[:user_id] = user.id
    session[:user_name] = user.username
    session[:user_role_id] = user.role_id 
  end

end
