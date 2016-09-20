require 'gosu'


class Player

    attr_accessor :name


	def initialize

		name = "Boxy McBoxface"

		@image = Gosu::Image.new("player.png", false)

	end

	def draw pos_x, pos_y

		@image.draw(pos_x, pos_y, 4)
		
	end


end