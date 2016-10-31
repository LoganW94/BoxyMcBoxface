
class Tile
	
	attr_accessor :x, :y, :x2, :y2, :is_tile, :char, :image, :collide

	def initialize x, y, char
		@size = 32
		@x = x
		@y = y
		@char = char
	end

	def update rate
		@x += rate
	end

	def draw
		if @is_tile == true
			@image.draw(@x, @y, 4)
		end
	end
end