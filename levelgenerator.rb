require 'gosu'
require_relative 'parse'
require_relative 'tile'

class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :map, :level_hash, :tile_size, :tiled_map, :goal_x, :player_row_index, :player_tile_index
=begin
		breaks up bmp and gives player_start, num_enemies
		! = enemy
		@ = player_start
		? = goal
		* = tile
		# = nil
=end
	def initialize level
		@tile_size = 32
		@level = level + 1
		@num_enemies = 0
		loadlevel
		loadgraphics
		interpret
		create_tiles
		find_player_index
		@travel = 0
	end

	def update movement
		@tiled_map.each do |r| 
			r.each do |tile|
				tile.update(movement)
			end
		end	
		current_index(movement)
	end

	def current_index movement
		@travel += movement
		if @travel >= 32
			@player_tile_index -= 1
			#puts "[#{@player_row_index}, #{@player_tile_index}]"
			@travel = 0
		end 
		if @travel <= -32
			@player_tile_index += 1
			@travel = 0
			#puts "[#{@player_row_index}, #{@player_tile_index}]"
		end
	end

	def find_player_index
		r = 0
		t = 0
		@map.each do |row|
			row.each_char do |char|
				if char == "@"
					puts "inti index [#{r}, #{t}] init start #{@player_x}"
					@player_row_index = r
					@player_tile_index = t
				end 
				t +=1
			end
			t = 0
			r += 1
		end
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
		@map = @level_hash["Map:"]
	end

	def loadgraphics
		@tile_img = Gosu::Image.new("graphics/tile_3.png", false)
		@goal_img = Gosu::Image.new("graphics/goal.bmp", false)
		@nil_img = Gosu::Image.new("graphics/tile_nil.bmp", false)
	end

	def create_tiles
		x=0
		y=0
		@tiled_map = []
		@map.each do |line|
			row = []
			line.each_char do |c|
				tile = Tile.new(x, y, c)
				if tile.char == "*" or tile.char == "!"
					tile.is_tile = true
					tile.image = @tile_img
				elsif tile.char == "#" or tile.char == "@"
					tile.is_tile = false
				elsif tile.char == "?"
					tile.is_tile = true
					tile.image = @goal_img
					tile.y -= 125
				end
				row << tile
				x += @tile_size
			end
			@tiled_map << row
			x = 0
			y += @tile_size
		end
	end

	def interpret 
		x = 0
		y = 0
		@map.each do |line|
			line.each_char do |c|
				if c == "!"
					@num_enemies +=1
				elsif c == "?"
					@goal_x = x						
				elsif c == "@"
					@player_x = x
					@player_y = y
					puts "player"
				end 
				x += @tile_size
			end
			x = 0
			y += @tile_size			
		end					
	end

	def draw
  		@tiled_map.each do |r| 
			r.each do |tile|
				tile.draw
			end
		end	
	end
end