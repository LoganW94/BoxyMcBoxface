require 'gosu'

class Background

	def initialize
		@sun_init = 0
		@sun = Gosu::Image.new("graphics/sun.bmp", false)
	end

	def update
		@sun_init += 0.02
	end

	def draw_background pos_x, pos_y
		draw_effect
		@back_image.draw(pos_x, pos_y, 1)	
	end

	def draw_effects
		@sun.draw(@sun_init, 0, 2)
	end
end