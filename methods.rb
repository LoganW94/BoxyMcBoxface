

class Methods

	def initialize

		@jump = false
        @jump_frames = 0

	end

	def update 
	
	end

	def jump jump

		@jump = jump

		if @jump == true && @jump_frames < 15
        	@jump_frames +=1
        elsif @jump == true && @jump_frames == 15
        	@jump =false
        	@jump_frames = 0	
        end

        return @jump

	end

	def tile_move tile

		if tile >= 800
			tile -= 1600
		end

		if tile <= -800
			tile += 1600
		end		

		return tile
	end

	def collision 

	end

end