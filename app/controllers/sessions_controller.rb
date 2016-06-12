class SessionsController < ApplicationController
  def new
  end
 
  def create
    @user = User.find_by(username: params[:username], clave: params[:clave], estatus: 'A')
    if @user
      if @user.role_id == 1
        log_in(@user)
        redirect_to root_path
      elsif @user.role_id == 2
        enterprise = Enterprise.find_by(user_id: @user.id, estatus:'A')
        if enterprise
          log_in(@user) 
          session[:enterprise_intranet] = enterprise.nom_intranet
          redirect_to atlascrm_com_path(enterprise.nom_intranet)
        else
          redirect_to buscador_path
        end
      else
        redirect_to buscador_path
      end
    else
    	redirect_to root_path, alert: 'el Usuario o Contraseña son incorrectos'
    end
  end

  def create_enterprise
    @user = User.find_by(username: params[:username], clave: params[:clave], estatus: 'A')
    if @user
      if @user.role_id == 2
        enterprise = Enterprise.find_by(user_id: @user.id, estatus:'A')
        if enterprise.nom_enterprise == session[:nom_enterprise]
          log_in(@user)
          redirect_to atlascrm_com_path(enterprise.nom_intranet)
        else
          redirect_to atlascrm_com_path(session[:nom_intranet]) , alert: 'el Usuario o Contraseña son incorrectos'
        end
      elsif @user.role_id == 3
        enterprise = Enterprise.find_by(nom_enterprise: session[:nom_enterprise])
        @analyst = Analyst.find_by(user_id: @user.id, enterprise_id: enterprise.id)
        if @analyst
          log_in(@user)
          redirect_to atlascrm_com_path(enterprise.nom_intranet)
        else
          redirect_to atlascrm_com_path(enterprise.nom_intranet) , alert: 'el Usuario o Contraseña son incorrectos'
        end
      elsif @user.role_id == 4
        enterprise = Enterprise.find_by(nom_enterprise: session[:nom_enterprise])
        @excecutive = Excecutive.find_by(user_id: @user.id, enterprise_id: enterprise.id)
        if @excecutive
          log_in(@user)
          redirect_to atlascrm_com_path(enterprise.nom_intranet)
        else
          redirect_to atlascrm_com_path(enterprise.nom_intranet) , alert: 'el Usuario o Contraseña son incorrectos'
        end
      elsif @user.role_id == 5
        enterprise = Enterprise.find_by(nom_enterprise: session[:nom_enterprise])
        @client = Client.find_by(user_id: @user.id, enterprise_id: enterprise.id)
        if @client
          log_in(@user)
          redirect_to atlascrm_com_path(enterprise.nom_intranet)
        else
          redirect_to atlascrm_com_path(enterprise.nom_intranet) , alert: 'el Usuario o Contraseña son incorrectos'
        end
      else
        redirect_to buscador_path
      end
    else
      enterprise = Enterprise.find_by(nom_enterprise: session[:nom_enterprise])
      redirect_to atlascrm_com_path(enterprise.nom_intranet) , alert: 'el Usuario o Contraseña son incorrectos'
    end
  end

  def log_in(user)
    session[:user_id] = user.id
    session[:user_name] = user.username
    session[:user_role_id] = user.role_id 
  end

  def destroy
  	session.clear
    redirect_to root_path
  end

  def destroy_enterprise
    @nombre = session[:nom_enterprise]
    session.clear
    redirect_to atlascrm_com_path(@nombre)
  end

end
