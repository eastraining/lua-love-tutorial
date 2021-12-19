local function_module = require('function-module')
local table_module = require('table-module')

print('function_module is', function_module)
print('table_module is', table_module)

love.draw = function()
  function_module()
  table_module.print_stuff()
end