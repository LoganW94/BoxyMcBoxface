
class Shape

attr_accessor :x, :y, :x2, :y2, :height, :width, :r

	def rect x, y, height, width
		@size = 32
		@x = x
		@y = y
		@x2 = x + @size
		@y2 = y + @size
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
		scale_xy2(scaler)
	end

	def scale_xy scaler
		scale_x = @x * scaler
		scale_y = @y * scaler
		@x = ((@x + scale_x)/2)
		@y = ((@y + scale_y)/2)
	end

	def scale_xy2 scaler
		scale_x2 = @x2 * scaler
		scale_y2 = @y2 * scaler
		@x2 = ((@x2 + scale_x2)/2)
		@y2 = ((@y2 + scale_y2)/2)
	end

end