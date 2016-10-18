require 'gosu'


class Player

    attr_accessor :height, :width, :pos_x, :pos_y

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
		height = @image.height
		width = @image.width	
	end

	def update
		@pos_x
		@pos_y
	end
	def move rate 
		@pos_x += rate		
	end

	def jump
		@pos_y -= 70
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end