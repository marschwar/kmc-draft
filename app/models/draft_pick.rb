class DraftPick < ApplicationRecord
	belongs_to :player
	belongs_to :user
	belongs_to :league

	scope :sorted, -> { order('position') }
end
