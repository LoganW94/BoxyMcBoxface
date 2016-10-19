require 'gosu'
require_relative 'parse'
require_relative 'enemy'

class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :map, :level_hash
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
	end

	def loadlevel
		file_location = "./levels/level_#{@level+1}.txt"
		@level_hash = {}
		begin	
			@level_file = File.open(file_location, "r")
			@level_hash = Parse.new.parse(@level_file)
			@level_file.close
		rescue => e
			puts e
		end
		@map = @level_hash["Map:"]
	end

	def loadgraphics
		@tile = Gosu::Image.new("graphics/tile_3.png", false)
		@goal = Gosu::Image.new("graphics/goal.bmp", false)
	end

	def interpret 
		pos_x = 0
		pos_y = 0
		@map.each do |line|
			line.each_char do |c|
				if c == "!"
					@num_enemies +=1
				elsif c == "@"
					@player_x = pos_x
					@player_y = pos_y
				end 
				pos_x += @tile_size
			end
			pos_x = 0
			pos_y += @tile_size			
		end					
	end

	def draw x, y
		x_init = x
		@map.each do |line|
			line.each_char do |c|
				if c == "*"
					@tile.draw(x, y, 4)
				elsif c == "?"
					@goal.draw(x, y-224, 3)
				end
				x += @tile_size
			end
			x = x_init
			y += @tile_size	
		end
	end
	
end