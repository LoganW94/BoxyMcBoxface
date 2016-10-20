
class Shape

attr_accessor :x, :y, :X, :Y, :height, :width, :r

	def rect x, y, X, Y, height, width
		@x = x
		@y = y
		@X = X
		@Y = Y
		@height = height
		@width = width
	end

	def circ x, y, r
		@x = x
		@y = y
		@r = r
	end

	def scale scaler
		scale_xy(scaler)
		scale_XY(scaler)
	end

	def scale_xy scaler
		scale_x = @x * scaler
		scale_y = @y * scaler
		@x = ((@x + scale_x)/2)
		@y = ((@y + scale_y)/2)
	end

	def scale_XY
		scale_X = @X * scaler
		scale_Y = @Y * scaler
		@X = ((@X + scale_x)/2)
		@Y = ((@Y + scale_y)/2)
	end

end