require 'gosu'

class Player

    attr_accessor :pos_x, :pos_y, :rate, :size

	def initialize		
		@image = Gosu::Image.new("graphics/pumpkin_jack.bmp", false)
		@counter = 0
		@can_jump = true
		@can_move_right = true
		@can_move_left = true
	end

	def update
		gravity
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