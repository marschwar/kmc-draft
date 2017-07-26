class User < ApplicationRecord
	has_secure_password

	has_many :leagues, through: :league_users

	validates_uniqueness_of :name

	scope :sorted, -> { order(:name) }
end
