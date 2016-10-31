require 'gosu'

class Player

    attr_accessor :pos_x, :pos_y, :rate, :size

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
		@counter = 0
		@in_air = false
	end

	def update row_index, tile_index, map
		gravity
		collision(row_index, tile_index, map)
	end

	def collision row_index, tile_index, map
		above = map[row_index -1][tile_index]
		left = map[row_index][tile_index -1]
		right = map[row_index][tile_index +1]
		below = map[row_index +1][tile_index]
		puts below.is_tile
		if below.is_tile == true
			@in_air = false
		else 
			@in_air = true
		end

		if right.is_tile == true
			if right.x < @pos_x
				@pos_x -= @rate
			end
		end	
		if left.is_tile == true
			if left.x + 32 < @pos_x
				@pos_x += @rate
			end
		end				
	end

	def jump
		@pos_y -= 15
	end

	def gravity
		@pos_y += 5
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end