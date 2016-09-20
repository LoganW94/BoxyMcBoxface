require 'gosu'


class Background


	def initialize

		@sun_init = 0

		@back_image = Gosu::Image.new("boxy_background_1.bmp", false)
		@sun = Gosu::Image.new("sun.bmp", false)
		@temp =  Gosu::Image.new("temp_floor.bmp", false)
		
	end

	def update

		@sun_init += 0.02

	end

	def draw_background pos_x, pos_y

		@back_image.draw(pos_x, pos_y, 1)
		 
			
	end

	def draw_level pos_x2, pos_y2

		@temp.draw(pos_x2, pos_y2, 3)

	end

	def draw_effects

		@sun.draw(@sun_init, 0, 2)

	end

end