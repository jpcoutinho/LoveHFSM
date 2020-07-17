local stateManager = {}

local folder
local stack = {}

local stateList = {}

local currentState

--Seta o folder dos estados
stateManager.config = function(path)
  folder = path
end

--Cria os estados
stateManager.create = function(file)
  local state = require(folder .. "." .. file)
  stack[file] = state
end

--Cria uma maquina de estados. Ideal para maquina de estado hierarquica. Ao inves de termos todos os estados em uma unica tabela
--podemos ter estados especificos a determinadas tabelas dentro de uma tabela geral.
stateManager.new = function()
  
  return {}
end

--------------------------------------------
stateManager.load = function(stateSelected)
  currentState = stateSelected
  
  stack[currentState].load()
end

--[[
stateManager.changeState = function(newState)
  currentState = newState
end
--]]







--------------------------------------------------------
--Love2D CALLBACKS
----------------------------------------------
stateManager.update = function(dt)
  stack[currentState].update(dt) 
end

stateManager.draw = function()
  stack[currentState].draw()
end

--[[
stateManager.mousepressed = function(x, y, button)
  stack[currentState].mousepressed(x, y, button)
end
]]--

stateManager.touchreleased = function(id, x, y)
  stack[currentState].touchreleased(id, x, y)
end

stateManager.keyreleased = function(key)
  stack[currentState].keyreleased(key)
end

----------------------------------------------------


--[DETERMINA TODAS AS CALLBACKS QUE A MAQUINA DE ESTADOS VAI TRATAR]-- ter alguma forma dinamica de determinar isso seria legal. pensar depois
stateManager.callbacks = function()
  love.update = function(dt) 
    stateManager.update(dt) 
  end
  
  love.draw = function() 
    love.graphics.setBackgroundColor(1, 1, 1) 
    stateManager.draw() 
  end
  
  --[[
  love.mousepressed = function(x, y, button) 
    stateManager.mousepressed(x, y, button) 
  end
  ]]--
  
  love.touchreleased = function(id, x, y) 
    stateManager.touchreleased(id, x, y) 
  end
  
  love.keyreleased = function(key)
    stateManager.keyreleased(key)
  end
  
  function love.quit()
    print("Bye")
  end
end
--*****--


function setState(newState)
  print("observador chamado")
  
  stateManager.load(newState)
end

return stateManager