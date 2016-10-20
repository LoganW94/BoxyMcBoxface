

class Tile
	
	attr_accessor :x, :y, :X, :Y, :is_tile, :char, :image

	def initialize
		@size = 32
		X
		Y
	end

	def update x, y
		@X = x
		@y = y
		X
		Y
		if is_tile
			draw
		end
	end

	def X
		@X = @x + @size
	end

	def Y
		@Y = @y + @size
	end

	def draw
		@image.draw(@x, @y, 4)
	end
end