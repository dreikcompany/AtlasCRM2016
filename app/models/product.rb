class Product < ActiveRecord::Base
  belongs_to :enterprise

  has_attached_file :fotoprincipal , styles: {mini: "100x100"}
	validates_attachment_content_type :fotoprincipal , content_type: /\Aimage\/.*\Z/
	
has_attached_file :foto1 , styles: {mini: "100x100"}
	validates_attachment_content_type :foto1 , content_type: /\Aimage\/.*\Z/
	
has_attached_file :foto2 , styles: {mini: "100x100"}
	validates_attachment_content_type :foto2 , content_type: /\Aimage\/.*\Z/
	

end
