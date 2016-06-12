class PromotionAfiliationsController < ApplicationController
  def index
  	@ultimas_promociones = Membership.select("memberships.id, memberships.nombre, memberships.monto, promotion_memberships.estatus,
  	 to_char(promotion_memberships.f_inicio, 'DD/MM/YYYY') as f_inicio,to_char(promotion_memberships.f_fin, 'DD/MM/YYYY') as f_fin,
  	 (promotion_memberships.descuento*100) as descuento,
  	 promotion_memberships.descripcion,(memberships.monto -(memberships.monto*promotion_memberships.descuento) ) as total").joins(:promotion_memberships).order("promotion_memberships.id DESC").limit(10)
  	
  end

  def create
  	if params[:membership_id].empty?
  		respond_to do |format|
        	format.html { redirect_to promotion_afiliations_path, alert: 'el campo membresia no puede ser vacio' }
    	end
    else
    	@promotion_afiliation = PromotionMembership.new(f_inicio: params[:f_inicio],f_fin: params[:f_fin],
    		descripcion: params[:descripcion], descuento: params[:descuento] ,membership_id: params[:membership_id],
    		estatus: params[:estatus])
    	respond_to do |format|
    		if @promotion_afiliation.save
        		format.html { redirect_to promotion_afiliations_path, notice: 'promocion creada exitosamente' }
        	else
				format.html { redirect_to promotion_afiliations_path, alert: 'No se pudo guardar la promocion' }
        	end 
        end
  	end
  end

  def correo
  	if params[:membership_id].empty?
  		respond_to do |format|
        	format.html { redirect_to promotion_afiliations_path, alert: 'el campo membresia no puede ser vacio' }
    	end
    else
    	if params[:mensaje].empty?
    		respond_to do |format|
	        	format.html { redirect_to promotion_afiliations_path, alert: 'Debe Escribir un mensaje' }
	    	end
    	else
    		@enterpises = Enterprise.all
    		@mensaje = params[:mensaje]
    		@membership = Membership.find(params[:membership_id])
    		@promotion = PromotionMembership.where('membership_id = ? AND estatus = ? ',params[:membership_id],'A').order('id desc').limit(1)
    		if @promotion.empty?
	    		respond_to do |format|
				  	format.html { redirect_to promotion_afiliations_path , alert: 'La Membresia Actualmente no esta en promocion' }
			  	end
			else
				respond_to do |format|
					PromotionAfiliations.envio_masivo(@enterpises,@mensaje,@promotion,@membership).deliver
					format.html { redirect_to promotion_afiliations_path , notice: 'Todos los correos han sido enviados' }
				end
    		end
    	end
  	end
  end

end