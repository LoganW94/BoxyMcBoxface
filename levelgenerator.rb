require 'gosu'
require_relative 'parse'
require_relative 'enemy'

class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :map, :level_hash, :tile_size, :tiled_map
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
		@num_enemies = 0
		loadlevel
		loadgraphics
		interpret
		create_tiles
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
		@tile_img = Gosu::Image.new("graphics/tile_3.png", false)
		@goal_img = Gosu::Image.new("graphics/goal.bmp", false)
	end

	def create_tiles
		x=0
		y=0
		@tiled_map = []
		@map.each do |line|
			line.each_char do |c|
				tile = Tile.new
				tile.x = x
				tile.y = y
				tile.char = c
				if tile.char == "*"
					tile.is_tile = true
					tile.image = @tile_img
				elsif tile.char == "#", "!", "@"
					tile.is_tile = false
				elsif tile.char == "?"
					tile.is_tile = false
					tile.image = @goal_img
				end		
				x += @tile_size
				@tiled_map << tile
			end
			y += @tile_size
		end
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
		i = 0
		@map.each do |line|
			line.each_char do |c|
				tile = @tiled_map[i]
				tile.update(x, y)
				x += @tile_size
			end
			x = x_init
			y += @tile_size	
		end
	end
	
end