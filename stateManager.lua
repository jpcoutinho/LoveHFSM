local stateManager = {}

local folder
local stack = {}

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

--------------------------------------------
stateManager.load = function(stateSelected)
  currentState = stateSelected
  
  stack[currentState].load() 
end


stateManager.changeState = function(newState)
  currentState = newState
end

----------------------------------------------
stateManager.update = function(dt)
  local current = stack[currentState].update(dt) 
  
  if  current ~= nil then
    currentState = current
    
    if stack[currentState] then
      return currentState
    end
  end
  
end

stateManager.draw = function()
 stack[currentState].draw()
end

return stateManager