require 'gosu'


class Player

    attr_accessor :height, :width, :pos_x, :pos_y, :move_rate

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
		height = @image.height
		width = @image.width
		@counter = 0
		@move_rate = 3
	end

	def update
		@pos_x
		@pos_y
	end
	def move rate 
		@pos_x += rate		
	end

	def jump rate
		frames = 12
		while @counter != frames
			@pos_y -= rate - 2
			@counter+=1
		end
		@counter = 0		
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end