--A class that makes it easy to work with pixels, contains coordinates and color
Pixel = {};

function Pixel.new (x, y, color)
	local o = {};
	o.x = x;
	o.y = y;
	o.color = color;
	return o;
end

-- returns new pixel that has offset from the original pixel
function Pixel.withOffset (pixel, offsetx, offsety)
	local o = {};
	o.x = pixel.x + offsetx;
	o.y = pixel.y + offsety;
	o.color = pixel.color;
	return o;
end