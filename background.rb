require 'gosu'


class Background


	def initialize

		@back_image = Gosu::Image.new("boxy_background_1.png", false)
		
	end

	def update

	end

	def draw pos_x, pos_y

		@back_image.draw(pos_x, pos_y, 1)
			
	end

end