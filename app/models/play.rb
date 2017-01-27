class Play < ApplicationRecord
	validates :title, presence: true
	validates :director, presence: true
	validates :description, presence: true
	
	belongs_to :user
end
