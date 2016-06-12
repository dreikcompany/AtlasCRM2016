class Client < ActiveRecord::Base
  belongs_to :enterprise
  belongs_to :user
end
