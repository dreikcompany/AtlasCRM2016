class PromotionAfiliations < ActionMailer::Base
  default :from => 'atlascrm2016@gmail.com'

    def envio_masivo(enterprises,mensaje,promotion,membership)
    	@enterprises = enterprises
      @mensaje = mensaje
      @promotion = promotion
      @membership = membership
    	email = ''
    	@enterprises.each do |enterprise|
			email = enterprise.nom_enterprise+' <'+enterprise.email+'>'+','+email
			#attachments["prueba.txt"] = File.read("#{Rails.root}/public/images/prueba.txt")
		  end
		  mail(to: email,subject: 'Promocion en Membresias de AtlasCRM2016')
    end
end
