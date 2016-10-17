require 'gosu'
require_relative 'parse'


class LevelGenerator

	attr_accessor :level, :player_x, :player_y, :num_enemies, :goal, :width, :height

	def initialize level
		@level = level
		loadlevel
		loadgraphics
		generate
		populate
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
=begin
		breaks up bmp and gives player_start, num_enemies, goal etc
		! = enemy
		@ = player_start
		? = goal
		* = tile
		# = nil
=end	
	end

	def draw
		#pass graphics and positions into background class which will handle everything
	end
	
end