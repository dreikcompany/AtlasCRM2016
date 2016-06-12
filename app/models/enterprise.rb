class Enterprise < ActiveRecord::Base
#	validates :nom_enterprise, presence: true, uniqueness: true
#	validates :nom_intranet, presence: true, uniqueness: true
	has_attached_file :logo , styles: {mini: "170x50"}
	validates_attachment_content_type :logo , content_type: /\Aimage\/.*\Z/
	belongs_to :user
	has_one :template
	has_many :clients
	has_many :products
	has_many :meetings
	has_many :excecutives
	has_many :analysts
end
