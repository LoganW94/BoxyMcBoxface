require 'gosu'
require_relative 'shapes'

class Player

    attr_accessor :pos_x, :pos_y, :rate, :size

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
		@counter = 0
		@can_jump = false
		@can_move_right = true
		@can_move_left = true
	end

	def update map
		collision(map)
		gravity
	end

	def move_right
		if @can_move_right == true
			@pos_x += @rate
		end
	end

	def move_left
		if @can_move_left == true
			@pos_x -= @rate
		end
	end

	def jump
		frames = 12
		if @can_jump == true
			while @counter != frames
				@pos_y -= 7
				@counter+=1
			end
			@counter = 0
			@can_jump = false
		end		
	end

	def gravity
		@pos_y += 0.5
	end

	def collision map
		local_tiles(map)

	end

	def local_tiles map
		# find the index of the tile player's x,y is in
		# then get the non-air tiles from the 8 surrounding the tile at x,y
		
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end