
class Parse


	def parse file

		file_list = []

		while ! file.eof?

			line = file.gets.chomp
			file_list << line

		end

		file_hash = {}

		find_key(file_list, file_hash)

		find_value(file_list, file_hash)

		#puts file_hash

	end

	def find_key file_list, file_hash

#		keys: "Level:", "Map:" 


	end

	def find_value file_list, file_hash


	end

	def list
#   searches through the value of "Map:" and finds the player start_x, start_y, 

	end


end