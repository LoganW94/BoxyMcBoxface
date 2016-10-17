require 'gosu'
require_relative 'parse'


class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :goal_x, :width, :height
=begin
		breaks up bmp and gives player_start, num_enemies, goal etc
		! = enemy
		@ = player_start
		? = goal
		* = tile
		# = nil
=end
	def initialize level
		@tile_size = 32
		@level = level
		@player_x = 0
		@player_y = 0
		@num_enemies = 0
		@goal_x = 0
		loadlevel
		loadgraphics
		interpret
		puts "Enemies: #{num_enemies}\nGoal position: #{@goal_x}\nPlayer location: #{@player_x},#{@player_y} "
	end

	def loadlevel
		file_location = "./levels/level_#{@level}.txt"
		@level_hash = {}
		begin	
			@level_file = File.open(file_location, "r")
			@level_hash = Parse.new.parse(@level_file)
			@level_file.close
		rescue => e
			puts e
		end
	end

	def loadgraphics
		@tile
		@goal
	end

	def generate
	end

	def populate
	end

	def interpret 
		pos_x = 0
		pos_y = 0
		map_array = @level_hash["Map:"]
		map_array.each do |line|
			line.each_char do |c|
				if c == "!"
					@num_enemies +=1
				elsif c == "@"
					@player_x = pos_x
					@player_y = pos_y
				elsif c == "?"
					@goal_x = pos_x
				end 
				pos_x += @tile_size
			end
			pos_x = 0
			pos_y += @tile_size			
		end					
	end

	def draw
		#pass graphics and positions into background class which will handle everything
	end
	
end