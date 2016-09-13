require 'gosu'


class Player

    attr_accessor :exp, :level, :name, :mass 


	def initialize

		exp = 0
		level = 1
		name = "Boxy McBoxface"
		mass = 5

		@image = Gosu::Image.new("player.png", false)

	end

	def draw pos_x, pos_y

		@image.draw(pos_x, pos_y, 2)
		
	end


end