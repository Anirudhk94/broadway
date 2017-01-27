class Play < ApplicationRecord
	validates :title, presence: true
	validates :director, presence: true
	validates :description, presence: true
end
