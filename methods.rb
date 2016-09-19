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

	def jump

		y = 70	# proper animation needed

		return y

	end


end