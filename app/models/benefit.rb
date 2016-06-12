class Benefit < ActiveRecord::Base
	validates :descripcion, presence: true, uniqueness: true
end
