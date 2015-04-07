class Game < ActiveRecord::Base
	validates :player_1_name, :player_2_name, presence: true
	validates :player_1_number, :player_2_number, numericality: true, length: { is: 4 }
	belongs_to :user
	has_many :turns
end
