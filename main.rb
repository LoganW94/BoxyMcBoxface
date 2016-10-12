require 'gosu'

require_relative 'player'
require_relative 'methods'
require_relative 'background'
require_relative 'enemy'
require_relative 'levelgenerator'

class Window < Gosu::Window

	

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "****pre pre pre pre pre alpha version Boxy McBoxface****"

		@state = 0
		@continue = false

		@is_player = false
		@is_background = false
		@is_method = false
		@is_level = false

		@new_game_pos = height/3
		@quit_game_pos = (height/3)*2
		@dot_pos = @new_game_pos

		@pos_x = width/4
		@player_pos_x = width/2-32
		@back_pos_x = 0
		@player_pos_y = 368
		@back_pos_y = -100
		@back_tile_1 = 0
		@back_tile_2 = 800
		@back_tile_3 = 1600
		@level_tile_1 = 0
		@level_tile_2 = 800
		@level_tile_3 = 1600
		

		@methods = Methods.new
		@font = Gosu::Font.new(70)
		@font_small = Gosu::Font.new(30)
		@dot = "@"
		@new_game = "New Game"
		@resume_game = "Resume Game"
		@quit_game = "Quit"

		@new_press_return, 
        @new_press_up, 
        @new_press_down, 
        @new_press_left, 
        @new_press_right, 
        @new_press_space, 
        @new_press_escape, 
        @new_press_tab = false

        @level = 1
		@confirm = false
		
		@code_entry_one = 0
		@code_entry_two = 0
		@code_entry_three = 0
		@code_entry_four = 0
		
		@mark = "_"
		@markx = 385

        @level_one_code = "0000"    #replace with hash
        @level_two_code = "5555"    #replace with hash
     
        @has_run = false
        @jump = false

        @floor = 368
    
############################################################################## # hard code enemy stuff
	
		@is_enemy = false


############################################################################## #physics variables here

		@gravity = 5
		@player_move_rate = 4

	end

	def update

		@methods.update


############################################################################## # main menu state if no game in progress
		if @state == 0 && @continue == false
			

            if button_down?(Gosu::KbUp) && @new_press_up
 				@dot_pos = @new_game_pos

            	if @dot_pos == @quit_game_pos
            		@dot_pos = @new_game_pos
            	end          			
                                
            end    

            if button_down?(Gosu::KbDown) && @new_press_down
                   
            	if @dot_pos == @new_game_pos
            		@dot_pos = @quit_game_pos
            	end            	

            end
		
			
			if button_down?(Gosu::KbReturn) && @new_press_enter

				if @dot_pos == @new_game_pos
					@state = 2
				elsif @dot_pos == @quit_game_pos
					self.close
				end						
			end
############################################################################## # game state	
		elsif @state == 1



			#add @player.update

			@background.update

=begin
			# temp enemy Code
			if @is_enemy == false
				@enemy = Enemy.new
				@enemy.pos_x = 700
				@enemy.pos_y = @floor
				@is_enemy = true
			end

			@enemy.update(@player_pos_x, @player_pos_y)
=end

			# player Code			
			if @player_pos_y < @floor && @player_pos_y != @floor
				@player_pos_y += @gravity
			end

			if button_down?(Gosu::KbUp) && @new_press_up && @player_pos_y >= @floor
         		@jump = true         		                                
            end 

            if @jump == true
            	@player_pos_y -= 10
            end

            @jump = @methods.jump(@jump)

            # player movement
			if button_down?(Gosu::KbLeft)

            	@back_tile_1 += 2
            	@back_tile_2 += 2

            	@level_tile_1 += @player_move_rate
            	@level_tile_2 += @player_move_rate

#            	@enemy.pos_x += @player_move_rate
            	             
            end

            if button_down?(Gosu::KbRight)
    
                @back_tile_1 -= 2
            	@back_tile_2 -= 2

            	@level_tile_1 -= @player_move_rate
            	@level_tile_2 -= @player_move_rate

#            	@enemy.pos_x -= @player_move_rate
            	                               
            end

            if button_down?(Gosu::KbReturn) && @new_press_enter
            	@state = 3
            end

            if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@dot_pos = @new_game_pos
				@new_game = @resume_game
			end

            # background loop

            @back_tile_1 = @methods.tile_move(@back_tile_1)
        	@back_tile_2 = @methods.tile_move(@back_tile_2)
        
        	@level_tile_1 = @methods.tile_move(@level_tile_1)
        	@level_tile_2 = @methods.tile_move(@level_tile_2)
            		
			
############################################################################## # main menu if game in progress
		elsif @state == 0 && @continue == true 

            if button_down?(Gosu::KbUp) && @new_press_up

 				@dot_pos = @new_game_pos

            	if @dot_pos == @quit_game_pos
            		@dot_pos = @new_game_pos
            	end          			
                                
            end    

            if button_down?(Gosu::KbDown) && @new_press_down
                   
            	if @dot_pos == @new_game_pos
            		@dot_pos = @quit_game_pos
            	end            	

            end		
			
			if button_down?(Gosu::KbReturn) && @new_press_enter

				if @dot_pos == @new_game_pos
					@state = 1
				elsif @dot_pos == @quit_game_pos
					self.close
				end						
			end	
############################################################################## # level select
		elsif @state == 2


			@has_run = false

			@move_markx = 33


			if button_down?(Gosu::KbLeft) &&  @new_press_left && @markx != 385
				@markx -= @move_markx
            end

            if button_down?(Gosu::KbRight) &&  @new_press_right && @markx != 484
            	@markx += @move_markx                              
            end	

            if @markx == 385 &&	button_down?(Gosu::KbUp) && @new_press_up && @code_entry_one != 9
            	@code_entry_one += 1
            elsif @markx == 385 && button_down?(Gosu::KbDown) && @new_press_down && @code_entry_one != 0
            	@code_entry_one -= 1
            end

            if @markx == 418 &&	button_down?(Gosu::KbUp) && @new_press_up && @code_entry_two != 9
            	@code_entry_two += 1
            elsif @markx == 418 && button_down?(Gosu::KbDown) && @new_press_down && @code_entry_two != 0
            	@code_entry_two -= 1
            end

            if @markx == 451 &&	button_down?(Gosu::KbUp) && @new_press_up && @code_entry_three != 9
            	@code_entry_three += 1
            elsif @markx == 451 && button_down?(Gosu::KbDown) && @new_press_down && @code_entry_three != 0
            	@code_entry_three -= 1
            end

            if @markx == 484 &&	button_down?(Gosu::KbUp) && @new_press_up && @code_entry_four != 9
            	@code_entry_four += 1
            elsif @markx == 484 && button_down?(Gosu::KbDown) && @new_press_down && @code_entry_four != 0
            	@code_entry_four -= 1
            end

            @code = "#{@code_entry_one}#{@code_entry_two}#{@code_entry_three}#{@code_entry_four}"
			@Code_display = "Level Code: #{@code_entry_one}#{@code_entry_two}#{@code_entry_three}#{@code_entry_four}"


			#replace with hash
			if @code == @level_one_code
				@level = 1
				@display = "Press Enter to play level: #{@level}"
				@confirm = true
			elsif @code == @level_two_code
				@level = 2
				@display = "Press Enter to play level: #{@level}"
				@confirm = true
			else
				@display = "Enter level code"
				@level = 0
				@confirm = false
			end
			
				
            if button_down?(Gosu::KbReturn) && @new_press_enter && @confirm == true
            	@state = 1
            	@continue = true

            end

            if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@continue = false
				@dot_pos = @new_game_pos
			end

			if @is_level == false
				@levelgen = LevelGenerator.new
				@levelgen.level = @level
				@is_level = true
			end
				
			if @is_player == false
				@player = Player.new
				@is_player = true
			end

			if @is_background == false
				@background = Background.new
				@is_background = true
			end


############################################################################## # end level state displays next level code
		elsif @state == 3

			if @has_run == false
				@next_level = @level + 1
				@has_run = true
			end

			#check @next_level against hash and return code
			@next_level_code = 5555

			@temp_end_text = "You beat level: #{@level}!!"
			@temp_end_text_2 = "Level: #{@next_level} code is: #{@next_level_code}"	

            if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@continue = false
				@dot_pos = @new_game_pos
				@is_player = false
				@is_level = false
			end

		end	
############################################################################## # other stuff to update

		@new_press_enter = !button_down?(Gosu::KbReturn)
		@new_press_up= !button_down?(Gosu::KbUp)
		@new_press_down = !button_down?(Gosu::KbDown)        
        @new_press_left = !button_down?(Gosu::KbLeft)
        @new_press_right = !button_down?(Gosu::KbRight)
        @new_press_space = !button_down?(Gosu::KbSpace)
        @new_press_escape = !button_down?(Gosu::KbEscape)
        @new_press_tab = !button_down?(Gosu::KbTab)		


	end 

	def draw

		if @state == 0
			@font.draw("#{@new_game}", @pos_x, @new_game_pos, 1 )
			@font.draw("#{@quit_game}", @pos_x, @quit_game_pos, 1)
			@font_small.draw("#{@dot}", @pos_x - 30, @dot_pos + 20, 1)

		elsif @state == 1

			@player.draw(@player_pos_x, @player_pos_y)

			if @is_enemy == true
				@enemy.draw
			end

			@background.draw_background(@back_tile_1, @back_pos_y)
			@background.draw_background(@back_tile_2, @back_pos_y)

			@background.draw_level(@level_tile_1, @back_pos_y)
			@background.draw_level(@level_tile_2, @back_pos_y)

			@background.draw_effects

		elsif @state == 2
			@font.draw("#{@display}", 25, height/2 - 200, 1)
			@font.draw("#{@Code_display}", 25, height/2, 1)
			@font.draw("#{@mark}", @markx.to_i, height/2, 1)

		elsif @state == 3
			@font.draw("#{@temp_end_text}", @pos_x-200, @new_game_pos, 1 )
			@font.draw("#{@temp_end_text_2}", @pos_x-200, @quit_game_pos, 1)
													
		end

	end
end

Window.new.show