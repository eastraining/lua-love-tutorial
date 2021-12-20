-- main.lua

-- import world and entities
local world = require('world')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local boundary_top = require('entities/boundary-top')
local boundary_bottom = require('entities/boundary-bottom')
local boundary_left = require('entities/boundary-left')
local boundary_right = require('entities/boundary-right')

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
  local ball_x, ball_y = ball.body:getWorldCenter()
  love.graphics.circle('fill', ball_x, ball_y, ball.shape:getRadius())
  love.graphics.polygon('line', paddle.body:getWorldPoints(paddle.shape:getPoints()))
  
  if paused then
    love.graphics.print('PAUSED', 375, 100)
  end
end

love.focus = function(f)
  if not f then
    paused = true
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
  if not paused then
    world:update(dt)
  end
end