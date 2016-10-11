require 'gosu'


class Enemy

    attr_accessor :pos_x, :pos_y, :height, :width


	def initialize

		@pos_x = pos_x

		@image = Gosu::Image.new("enemy.bmp", false)
		height = @image.height
		width = @image.width

		@init_pos = 700

		@mov_rt = 3

		@step_counter = 1

		@flip = false

		@sight_range = 250

		@floor = 368
		
		@float == false

		@float_counter = 1

	end

	def update player_pos_x, player_pos_y

		player_distance_x = player_pos_x - @pos_x
		player_distance_y = player_pos_y - @pos_y

		range = Math.sqrt(player_distance_x**2 + player_distance_y**2).to_i

		if range > @sight_range
			idle 
		else
			hunt(player_pos_x, player_pos_y)
		end
		
	end

	def idle

		if @step_counter > 0 && @step_counter <= 30
			@pos_x += @mov_rt
		elsif @step_counter > 30 && @step_counter <= 60
			@pos_x -= @mov_rt
		end	

		@step_counter +=1

		if @step_counter == 61
			@step_counter = 1
		end

		if @pos_y < @floor - 100
			@flip = true
		elsif @pos_y >= @floor - 30
			@flip = false	
		end

		if @flip == false
			@pos_y -= @mov_rt/2
		elsif @flip == true
			@pos_y += @mov_rt/2
		end

	end

	def hunt player_pos_x, player_pos_y

		if @pos_y < @floor - 40
			if @pos_y >= player_pos_y
				@pos_y -= @mov_rt/2
			elsif @pos_y <= player_pos_y
				@pos_y += @mov_rt/2 	
			end
		else 
			float			
		end	
		
		if @pos_x >= player_pos_x
			@pos_x -= @mov_rt
		elsif @pos_x <= player_pos_x
			@pos_x += @mov_rt 	
		end	
		

	end

	def float
		
		if @float_counter > 0 && @float_counter < 41
			@pos_y += @mov_rt/2
		elsif @float_counter > 40 && @float_counter < 81
			@pos_y -= @mov_rt/2
		end

		@float_counter += 1	

		if @float_counter == 81
			@float_counter = 1
		end

	end

	def draw 

		@image.draw(@pos_x, @pos_y, 4)
		
	end


end