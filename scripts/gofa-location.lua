--A class that makes it easy to work with Location, contains coordinates
Location = {};

function Location.new (x, y)
	local o = {};
	o.x = x;
	o.y = y;
	return o;
end