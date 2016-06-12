class User < ActiveRecord::Base
	validates :username, presence: true, uniqueness: true
	validates :clave, presence: true, length:{minimum: 3 }
	#validates :email, uniqueness: true
	belongs_to :role
	has_one :enterprise
	has_attached_file :avatar , styles: {mini: "100x100"}
	validates_attachment_content_type :avatar , content_type: /\Aimage\/.*\Z/
end
