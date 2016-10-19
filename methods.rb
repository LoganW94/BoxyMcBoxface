

class Methods

	def initialize

	end

	def tile_move tile
		if tile >= 800
			tile -= 1600
		end
		if tile <= -800
			tile += 1600
		end		
		return tile
	end

	def collision 
	end

end