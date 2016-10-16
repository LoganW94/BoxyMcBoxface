require 'gosu'
require_relative 'rubyparse'


class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :goal, :width, :height

	def initialize level

		@level = level

		@parse = Parse.new


		loadlevel


		loadgraphics


		generate


		populate


	end

	def loadlevel

		file_location = "./levels/level_#{@level}.txt"
		puts "file location: #{file_location}"

		begin	
			@level_file = File.open(file_location, "r")

			@level_hash = @parse.parse(@level_file)

			@level_file.close
		rescue => e
			puts e
		end

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
	end

	def draw

		#pass graphics and positions into background class which will handle everything

	end
	
end