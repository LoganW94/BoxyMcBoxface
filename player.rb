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
		@tiles = local_tiles(map)
		collision(@tiles)
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
				@pos_y -= 2
				@counter+=1
			end
			@counter = 0
			@can_jump = false
		end		
	end

	def gravity
		@pos_y + 5
	end

	def collision tiles
		px2 = @pos_x + @size
		py2 = @pos_y + @size
		tiles.each do |tile|
			if tile.char == "*"
				if px2 < tile.x
					@can_move_right = false
				end
				if tile.x2 < @pos_x
					@can_move_left = false
				end
				if py2 < tile.y
					@can_jump = true
				end
				if py2 > tile.y 
					gravity
				end
			end	
		end				
	end

	def local_tiles map
		# locates the tiles around player and returns that array of tile obj
		tiles = []
		rect = Shape.new
		rect.rect(@pos_x, @pos_y, 32, 32)
		#rect.scale(2)
		
		map.each do |tile|
			if rect.x2 < tile.x or tile.x2 < rect.x or rect.y2 < tile.y or tile.y2 < rect.y
				tiles << tile
			end
		end
	end

	def draw
		@image.draw(@pos_x, @pos_y, 5)		
	end
end