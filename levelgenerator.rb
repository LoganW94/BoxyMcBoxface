require 'gosu'
require_relative 'rubyparse'


class LevelGenerator

	attr_accessor :level, :player_start, :num_enemies, :goal, :width, :height

	def initialize

		@parse = Parse.new


		loadlevel


		loadgraphics


		generate


		populate


	end

	def loadlevel

		@level_file = File.open("./levels/level_1.txt", "r")

		@data_hash = @parse.parse(@level_file)

		@level_file.close

	end

	def loadgraphics

		@tile

	end

	def generate

	end

	def populate

	end

	def interpret 
=begin
		breaks up bmp and gives player_start, num_enemies, goal etc
		red = enemy
		blue = player_start
		green = goal
		black = tile
		magenta = transparent

=end	
		values = []


		@level_img.each do |pixel|
			i.length.times do |x|
				values.push(pixel)
   			end
		end

		values.each do |i|
	      	i.length.times do |x|

	      		if i[x].val == 2
	      			# get location and set @player_start = to that value
	      		elsif i[x].val == 3
	      			# num_enemies += 1
	      		elsif i[x].val == 4
	      			# set @goal location 
	      		else 
	      			@tile_err.draw(pos_x, pos_y, 0)
	      		end
	      	end
	    end



	end

	def draw

		#pass graphics and positions into background class which will handle everything

		values.each do |i|
	      	i.length.times do |x|

	      		if i[x].val == 0
	      			#do nothing it's transparent
	      		elsif i[x].val == 1
	      			#draw tile
	      		elsif i[x].val == 2
	      			# draw player
	      		elsif i[x].val == 3
	      			# draw enemies
	      		else 
	      			@tile_err.draw(pos_x, pos_y, 0)
	      		end
	      	end
	    end		

	end
	
end