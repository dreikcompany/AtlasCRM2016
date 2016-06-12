class Template < ActiveRecord::Base
	belongs_to :enterprise

	has_attached_file :favicon , styles: {mini: "32x32"}
	validates_attachment_content_type :favicon , content_type: /\Aimage\/.*\Z/

	has_attached_file :logo , styles: {mini: "170x50"}
	validates_attachment_content_type :logo , content_type: /\Aimage\/.*\Z/

	has_attached_file :logo2 , styles: {mini: "120x20"}
	validates_attachment_content_type :logo2 , content_type: /\Aimage\/.*\Z/

	has_attached_file :slider1 , styles: {medium: "1152x360"}
	validates_attachment_content_type :slider1 , content_type: /\Aimage\/.*\Z/

	has_attached_file :slider2 , styles: {medium: "1152x360"}
	validates_attachment_content_type :slider2 , content_type: /\Aimage\/.*\Z/

	has_attached_file :slider3 , styles: {medium: "1152x360"}
	validates_attachment_content_type :slider3 , content_type: /\Aimage\/.*\Z/
end
