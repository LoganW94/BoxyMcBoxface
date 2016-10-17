require 'gosu'


class Player

    attr_accessor :height, :width

	def initialize		
		@image = Gosu::Image.new("graphics/player.png", false)
		height = @image.height
		width = @image.width	
	end

	def draw pos_x, pos_y
		@image.draw(pos_x, pos_y, 4)		
	end
end