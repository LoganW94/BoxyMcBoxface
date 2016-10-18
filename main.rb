require 'gosu'

require_relative 'player'
require_relative 'methods'
require_relative 'background'
require_relative 'enemy'
require_relative 'levelgenerator'

class Window < Gosu::Window

	

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "****pre alpha version Pumpkin Jack****"

		@state = 0
		@continue = false
		@new_game_pos = height/3
		@quit_game_pos = (height/3)*2
		@dot_pos = @new_game_pos
		@pos_x = width/4
		@player_pos_x = width/2-32
		@back_pos_x = 0
		@level_x = 0
		@level_y = 0
		@player_pos_y = 368
		@back_pos_y = -100
		@back_tile_1 = 0
		@back_tile_2 = 800
		@level_tile_1 = 0
		@level_tile_2 = 800	
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
        @level_one_code = "0000"    
        @level_two_code = "5555"    
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
			@background.update
		
			#@player.pos_y += @gravity

			if button_down?(Gosu::KbUp)
				if ! in_air
          			@player.jump
          			in_air
          		end	                                
            end 
            if @player.pos_x <= 101
            	@level_x += @player_move_rate
            elsif @player.pos_x >= 699
            	@level_x -= @player_move_rate
            end	
            # player movement
			if button_down?(Gosu::KbLeft)
            	@back_tile_1 += 0.5
            	@back_tile_2 += 0.5
            	if @player.pos_x > 100
            		@player.move(-@player_move_rate)
            	end        	             
            end
            if button_down?(Gosu::KbRight) 
                @back_tile_1 -= 0.5
            	@back_tile_2 -= 0.5
            	if @player.pos_x < 700 
            		@player.move(@player_move_rate.to_i)
            	end       	                               
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
            	@levelgen = LevelGenerator.new(@level)
            	@player = Player.new
            	@player.pos_x = @levelgen.player_x
            	@player.pos_y = @levelgen.player_y
            	@background = Background.new
            	@state = 1
            	@continue = true

            end
            if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@continue = false
				@dot_pos = @new_game_pos
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
			@player.draw
			@background.draw_background(@back_tile_1, @back_pos_y)
			@background.draw_background(@back_tile_2, @back_pos_y)
			@background.draw_effects
			@levelgen.draw(@level_x, @level_y)
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