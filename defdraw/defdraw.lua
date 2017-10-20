
local M = {}

M.color_r = 255
M.color_g = 255
M.color_b = 255
M.color_a = 1
M.color = vmath.vector4(255, 255, 255, 1)



-- Create new surface to draw on
-- The atlas you use must be large enough to fit width and height
-- Generally you add a texture to the atlas the size of your game.project width and height
function M.create_surface(sprite, width, height, window_width, window_height)
	local surface = {}
	surface.dirty = false
	surface.sprite = sprite
	surface.resource_path = go.get(sprite,"texture0")
	surface.width = width
	surface.height = height
	surface.window_width = window_width
	surface.window_height = window_height	
	surface.header = { width = surface.width, height = surface.height, type = resource.TEXTURE_TYPE_2D, format = resource.TEXTURE_FORMAT_RGBA, num_mip_maps = 1 }
	surface.buffer = buffer.create(surface.width * surface.height, { {name=hash("rgba"), type=buffer.VALUE_TYPE_UINT8, count=4} } )
	surface.stream = buffer.get_stream(surface.buffer, hash("rgba"))
	resource.set_texture(surface.resource_path,surface.header,surface.buffer)
	return surface	
end

-- Updates the resource atlas texture with the current buffer data
function M.update_resource(surface)
	if surface.dirty == false then
		--print("Surface isn't dirty!")
		return
	end
	--print("Updating texture")
	resource.set_texture(surface.resource_path,surface.header,surface.buffer)
	surface.dirty = false
end

-- Destroys a surface
function M.destroy_surface(surface)	
end

-- Clear a surface to a color and alpha
function M.clear_surface(surface, color, alpha)
end

-- Shortcut for clear_surface
function  M.cls(surface, color, alpha)
	M.clear_surface(surface, color, alpha)
end

-- Sets the draw color
function M.set_color(r,g,b)
end

-- Sets a color gradient between a table of colors
function M.set_color_gradient(colors)
end

-- Interpolates between two or more colors
function M.interpolate(colors, distance)
	-- 0-1 blend distance between color 1 and color 2, 1-2 blend distance between color 2 and color 3 ...
	-- if number is larger than total numbers then will wrap around! supports negative numbers too
end

-- Sets the draw color based on a hex value as a string
function M.set_color_hex(hex)
end

-- Sets the color based on hue shift of old color by an amount (negative or positive)
function M.set_color_hue_shift(amount)
end

-- Sets the alpha
function M.set_alpha(alpha)
end

-- Sets the blending mode function
function M.set_blend(mode)
	-- 1 overwrite
	-- 2 lighter
	-- 3 multiply
	-- ??
end

-- Sets the clip area so only inside can be drawn in
function M.set_clipping(x,y,w,h)
end

-- Draws a point at a position
function M.draw_point(surface,x,y)
	if x < 0 or x > surface.window_width or y < 0 or y > surface.window_height then
		--print("oops, out of range")
		return
	end
	--print(x .. "," .. y)
	
	local index = (y * surface.width * 4) + (x * 4) + 1
	--print(index)
	surface.stream[index + 0] = M.color_r * M.color_a
	surface.stream[index + 1] = M.color_g * M.color_a
	surface.stream[index + 2] = M.color_b * M.color_a
	surface.stream[index + 3] = M.color_a or 0xff
	
	surface.dirty = true
	
end

-- Draws a rectangle at a position
function M.draw_rectangle(surface,x,y,w,h)
end

-- Draws a line between two points
function M.draw_line(surface,x1,y1,x2,y2)
end

-- Draws an oval
function M.draw_oval(surface,x,y,w,h)
end

-- Draws a polygon based on a table of vertex points
function M.draw_polygon(surface,verts,x,y)
	-- if 2 verts draw line
end

-- Draws a function onto a surface
function M.draw_function(surface, func)
	
end

-- Tints the surface that has alpha with a color
function M.tint_surface(surface,r,g,b)
end

-- Returns the color values of an area of a surface
function M.read_surface(surface,x,y,width,height)
end


return M