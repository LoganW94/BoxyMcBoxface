require 'gosu'


class Enemy

    attr_accessor :pos_x, :pos_y, :height, :width


	def initialize


		@image = Gosu::Image.new("enemy.bmp", false)
		height = @image.height
		width = @image.width

		@tick = 0


	end

	def update
		@tick += 1

		if @tick >= 10
			move
			@tick = 0
		end
		
	end

	def move 

	

	end

	def draw 

		@image.draw(pos_x, pos_y, 4)
		
	end


end