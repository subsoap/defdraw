
local M = {}

M.alpha = 1.0
M.color_r = 1.0
M.color_g = 1.0
M.color_b = 1.0

-- Create new surface to draw on
function M.create_surface(width, height)	
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

-- Sets the draw color based on a hex value as a string
function M.set_color(hex)
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
function M.draw_point(x,y)
end

-- Draws a rectangle at a position
function M.draw_rectangle(x,y,w,h)
end

-- Draws a line between two points
function M.draw_line(x1,y1,x2,y2)
end

-- Draws an oval
function M.draw_oval(x,y,w,h)
end

-- Draws a polygon based on a table of vertex points
function M.draw_polygon(verts,x,y)
	-- if 2 verts draw line
end

-- Tints the surface that has alpha with a color
function M.tint_surface(r,g,b)
end

-- Returns the value of an area of a surface
function M.read_surface(x,y,width,height)
end


return M