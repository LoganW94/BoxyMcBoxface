
class Tile
	
	attr_accessor :x, :y, :x2, :y2, :is_tile, :char, :image, :collide

	def initialize x, y, char
		@size = 32
		@x = x
		@y = y
		#@y2 = @y + @size
		#@x2 = @x + @size
		@char = char
		#@collide = false
	end

	def update rate
		@x += rate
	end

	def collision px, py
		px2 = px + 32
		py2 = py + 32
		range_x = (px - x).abs
		range_y = (py - y).abs
		if @is_tile == true
			if range_x < 32 and range_y < 32
				if py > y2 or py2 > y or px < x2 or px2 > x
					@collide = true
				end
			else
				@collide = false
			end
		end
	end

	def draw
		if @is_tile == true
			@image.draw(@x, @y, 4)
		end
	end
end