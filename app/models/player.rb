class Player < ApplicationRecord
	POSITIONS = %w(tor abwehr mittelfeld sturm)

	belongs_to :league
	belongs_to :team

	scope :of_league, -> (league) { where('league_id = ?', league) }
end
