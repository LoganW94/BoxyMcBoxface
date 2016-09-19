require 'gosu'


class Methods

	def initialize

		@frames = 0

		@jump = false


	end

	def update 
		@frames += 1 

		if @frames >= 100000
			@frames = 1
		end

	end

	def jump jump

		if jump == true
			@frames_init = @frames
			jump = false
		end

		if @frames_init == @frames
			y = 40	
		elsif @frames_init == @frames + 1
			y += 40
		elsif @frames_init == @frames + 2
			y += 30
		elsif @frames_init == @frames + 3
			y += 30
		elsif @frames_init == @frames + 4
			y += 20	
		elsif @frames_init == @frames + 5
			y += 10		
		elsif @frames_init == @frames + 6
			y += 10		
		elsif @frames_init == @frames + 7
			y += 50																			
		end

		@frames_init +=1

		return y

	end


end