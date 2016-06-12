class Permission < ActiveRecord::Base
	validates :texto, presence: true, uniqueness: true
	validates :url, presence: true, uniqueness: true
end
