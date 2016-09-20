require 'gosu'


class Player

    attr_accessor :name, :height, :width


	def initialize

		name = "Boxy McBoxface"
		@image = Gosu::Image.new("player.png", false)
		height = @image.height
		width = @image.width	

		

	end

	def draw pos_x, pos_y

		@image.draw(pos_x, pos_y, 4)
		
	end


end