-- entities.lua

local boundary_x = require('entities/boundary-x')
local boundary_y = require('entities/boundary-y')
local ball = require('entities/ball')
local paddle = require('entities/paddle')
local brick = require('entities/brick')

return {
  boundary_x(400, 606),
  boundary_y(-6, 300),
  boundary_y(806, 300),
  boundary_x(400, -6),
  paddle(300, 500),
  ball(200, 200),
  brick(100, 100),
  brick(200, 100),
  brick(300, 100)
}