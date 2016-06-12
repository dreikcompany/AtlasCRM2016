class EnterpriseMembership < ActiveRecord::Base
  belongs_to :enterprise
  belongs_to :membership
end
