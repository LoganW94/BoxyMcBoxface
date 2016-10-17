
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
		line_num = 1
		last_line = file_list.size
		file_list.each do |current_line|			
			key = find_key(current_line)
			key_list << key
			key_list = clean_keys(key_list)
			value = find_value(current_line) 
			value_list << value
		end
		value_list.delete_at(2)
		value_list = stack_map(value_list)
		file_hash = create_hash(key_list, value_list)
		return file_hash
	end

	def find_key current_line
		key = ""
		current_line.each_char do |x|
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
		start = false
		value = ""
		current_line.each_char do |y|
			if y == ":" or y == "#" or y == "*"
				start = true
			end
			if start == true and y != "" and y != ":"
				value += y
			end
		end
		return value
	end

	def clean_keys list 
		size = list.size
		i = 3
		if i != size
			list.delete_at(i)
			i+=1
		end
		return list
	end

	def stack_map value_list
		map_array= []
		line_num = 0
		value_list_len = value_list.size.to_i
		value_list.each do |x|
			if line_num <= 2
				line_num +=1
			end
			if line_num >= 3
				map_array << x
			end	
		end
		line_num = 2
		while line_num < value_list_len
			value_list.delete_at(2)
			line_num += 1
		end		
		value_list << map_array
		return value_list
	end

	def create_hash key_list, value_list
		hash = {}
		i = 0
		while i < 3 
			hash[key_list[i]] = value_list[i]
			i += 1
		end
		return hash
	end
end