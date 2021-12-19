-- entities/triangle.lua

local world = require('world')

-- Triangle is the name of our first entity
local triangle = {}
triangle.body = love.physics.newBody(world, 200, 200, 'dynamic')
-- Give the triangle some weight
triangle.body.setMass(triangle.body, 32)
triangle.shape = love.physics.newPolygonShape(100, 100, 200, 100, 200, 200)
triangle.fixture = love.physics.newFixture(triangle.body, triangle.shape)
triangle.fixture:setRestitution(0.75)
triangle.fixture:setUserData('triangle')

return triangle