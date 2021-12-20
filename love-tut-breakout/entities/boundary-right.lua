-- entities/boundary-right.lua

local world = require('world')

local entity = {}
entity.body = love.physics.newBody(world, 805, 300, 'static')
entity.shape = love.physics.newRectangleShape(10, 600)
entity.fixture = love.physics.newFixture(entity.body, entity.shape)
entity.fixture:setUserData(entity)

return entity