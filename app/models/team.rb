class Team < ApplicationRecord
	scope :sorted, -> {order(:name)}
end
