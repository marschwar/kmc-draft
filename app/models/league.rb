class League < ApplicationRecord
	belongs_to :user
	has_many :league_users
	has_many :users, through: :league_users
end
