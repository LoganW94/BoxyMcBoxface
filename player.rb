require 'gosu'

class Player

    attr_accessor :pos_x, :pos_y, :rate, :size, :player_index

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
	end

	def update map
		find_index(map)
		collision(map)
		gravity
	end
	def find_index map
		#finds the current index of player on map array
		
	end

	def collision map
		#gets the tiled tiles left, right, and center, for the rows above, below, and on the level of player index.
		
	end

	def jump
		@pos_y -= 8
	end

	def gravity
		@pos_y += 1
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end