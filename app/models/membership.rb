class Membership < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true
	has_many :promotion_memberships
	has_many :enterprise_memberships
end
