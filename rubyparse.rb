
class Parse

	def parse file

		file_list = []
		while ! file.eof?
			line = file.gets.chomp
			file_list << line
		end

		file_hash = {}
		key_list = []
		value_list = []
		file_list.each do |current_line|
			key = find_key(current_line)
			key_list << key
			key_list = clean(key_list)
			#value = find_value(current_line) 
			#value_list << value
			#file_hash[key] = value
		end
		puts key_list.inspect
		#puts file_hash.inspect
		return file_hash
	end

	def find_key current_line
		key = ""
		current_line.each_char do |x|
			# replace with better system at some point
			if x == "#" or x == "*"
				break
			end
			key += x 
			if x == ":"
				break
			end
		end
		return key
	end

	def find_value current_line

		return value
	end

	def clean list # replace with dynamic code
		size = list.size
		i = 3
		if i != size
			list.delete_at(i)
			i+=1
		end
		return list
	end

	def list
#   searches through the value of "Map:" and finds the player start_x, start_y, 

	end


end