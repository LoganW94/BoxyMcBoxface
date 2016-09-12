require 'gosu'

require_relative 'player'

class Window < Gosu::Window

	

	def initialize width = 800, height = 600, fullscreen = false
		super
		
		self.caption = "****pre pre pre pre pre alpha version Boxy McBoxface****"

		@state = 0
		@continue = false
		@is_player = false

		@new_game_pos = height/3
		@quit_game_pos = (height/3)*2
		@dot_pos = @new_game_pos
		@pos_x = width/4
		@player_pos_x = 150
		@player_pos_y = 400

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

        @level_one_code = 0000
        @level_two_code = 4533
        #etc

	end

	def update

##############################################################################
		if @state == 0 && @continue == false# main menu state if no game in progress
			

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
##############################################################################
		elsif @state == 1 # game state			

			if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@dot_pos = @new_game_pos
				@new_game = @resume_game
			end

			if button_down?(Gosu::KbLeft)
            	@player_pos_x -=5                  
            end

            if button_down?(Gosu::KbRight)
                @player_pos_x +=5                                     
            end
##############################################################################
		elsif @state == 0 && @continue == true # main menu if game in progress

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
##############################################################################
		elsif @state == 2 # level select

			if @is_player == false
				@player = Player.new
				@is_player = true
			end

			@dot_pos = height/2 - 35
			@level = 1
			@display = "Press Enter to play level: #{@level}"

			
			@code_entry_one = "0"
			@code_entry_two = "0"
			@code_entry_three = "0"
			@code_entry_four = "0"
			@code = @code_entry_one + @code_entry_two + @code_entry_three + @code_entry_four
			@Code_display = "Level Code: #{@code}"
			

			if button_down?(Gosu::KbLeft) &&  @new_press_left
                
            end

            if button_down?(Gosu::KbRight) &&  @new_press_right
                                   
            end       

            if button_down?(Gosu::KbUp) && @new_press_up         			
                                
            end    

            if button_down?(Gosu::KbDown) && @new_press_down
            	
            end	
				
            if button_down?(Gosu::KbReturn) && @new_press_enter
            	@state = 1
            	@continue = true

            end

            if button_down?(Gosu::KbEscape) && @new_press_escape
				@state = 0
				@continue = false
				@dot_pos = @new_game_pos
			end
##############################################################################
		end	

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
			@font_small.draw("#{@dot}", @pos_x - 25, @dot_pos + 20, 1)
		elsif @state == 1
			@player.draw(@player_pos_x, @player_pos_y)

		elsif @state == 2
			@font.draw("#{@display}", 25, height/2 - 200, 1)
			@font.draw("#{@Code_display}", 25, height/2, 1)				
		end

	end
end

Window.new.show