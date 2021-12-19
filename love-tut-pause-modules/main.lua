-- main.lua

-- import world and entities
local world = require('world')
local triangle = require('entities/triangle')
local bar = require('entities/bar')
local title = require('entities/title')
local number = require('entities/number')

-- Boolean to keep track of whether our game is paused or not
local paused = false

local key_map = {
  escape = function()
    love.event.quit()
  end,
  space = function()
    paused = not paused
  end
}

love.draw = function()
  love.graphics.polygon('line', triangle.body:getWorldPoints(triangle.shape:getPoints()))
  love.graphics.polygon('line', bar.body:getWorldPoints(bar.shape:getPoints()))
  love.graphics.print(title .. ' ' .. number, 350, 50)
  if paused then
    love.graphics.print('PAUSED', 375, 100)
  end
end

love.keypressed = function(pressed_key)
  -- Check in the key map if there is a function
  -- that matches this pressed key's name
  if key_map[pressed_key] then
    key_map[pressed_key]()
  end
end

love.update = function(dt)
  function love.focus(f)
    if not f then
      paused = true
    end
  end
  if not paused then
    world:update(dt)
  end
end