-- main.lua

local entities = require('entities')
local world = require('world')
local input = require('input')

love.draw = function()
  for _, entity in ipairs(entities) do
    if entity.draw then entity:draw() end
  end

  if input.paused then
    love.graphics.print('PAUSED', 375, 100)
  end
end

love.focus = function(f)
  input.toggle_focus(f)
end

love.keypressed = function(pressed_key)
  input.press(pressed_key)
end

love.keyreleased = function(released_key)
  input.release(released_key)
end

love.update = function(dt)
  if not input.paused then
    for _, entity in ipairs(entities) do
      if entity.update then entity:update(dt) end
    end
    world:update(dt)
  end
end