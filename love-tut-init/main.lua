local current_color = {1, 1, 1, 1}
local seconds = 0

local key_map = {
  b = function()
    -- Blue 
    current_color = {0, 0, 1, 1}
  end,
  g = function()
    -- Green
    current_color = {0, 1, 0, 1}
  end,
  r = function()
    -- Red
    current_color = {1, 0, 0, 1}
  end,
  w = function()
    -- White
    current_color = {1, 1, 1, 1}
  end,
  escape = function()
    love.event.quit()
  end
}

love.draw = function()
  local left = seconds * 10
  local square = {left, 100, left, 200, 200, 200, 200, 100}

  -- Print a counter clock
  local clock_display = 'Seconds: ' .. math.floor(seconds)
  love.graphics.print(clock_display, 0, 0, 0, 2, 2)

  -- Initialize the square with the default color (white)
  love.graphics.setColor(current_color)
  love.graphics.polygon('fill', square)
end


love.keypressed = function(pressed_key)
  if key_map[pressed_key] then
    key_map[pressed_key]()
  end
end

love.update = function(dt)
  -- Add up all the delta time as we get it
  seconds = seconds + dt
end