

class Tile
	
	attr_accessor :x, :y, :x2, :y2, :is_tile, :char, :image

	def initialize x, y, char
		@size = 32
		@x = x
		@y = y
		@y2 = @y + @size
		@x2 = @x + @size
		@char = char
	end

	def update x, y
		@X = x
		@y = y
		@y2 = @y + @size
		@x2 = @x + @size
		if is_tile
			draw
		end
	end

	def draw
		@image.draw(@x, @y, 4)
	end
end