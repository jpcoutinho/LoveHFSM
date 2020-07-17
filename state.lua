local state = {}

--https://love2d.org/wiki/Category:Callbacks

local dummy = function()
  print("Callback not defined")
  return
end

function state.new()
  
  local self = {}

  --love.directorydropped	= dummy
  --love.filedropped      = dummy
  self.focus            = dummy
  self.resize	          = dummy
  self.visible           = dummy

  self.displayrotated	  = dummy
  self.touchmoved	      = dummy
  self.touchpressed	    = dummy
  self.touchreleased    = dummy
  self.lowmemory        = dummy
  --self.draw	          = dummy
  --self.load	          = dummy
  --self.quit	          = dummy
  --self.run            = dummy
  --self.update	        = dummy


  self.errorhandler	    = dummy
  self.threaderror      = dummy

  self.gamepadaxis      = dummy	
  self.gamepadpressed	  = dummy
  self.gamepadreleased  = dummy
  self.joystickadded    = dummy
  self.joystickaxis	    = dummy
  self.joystickhat      = dummy
  self.joystickpressed  = dummy
  self.joystickreleased	= dummy
  self.joystickremoved  = dummy

  self.keypressed	      = dummy
  self.keyreleased      = dummy

  self.mousefocus	      = dummy
  self.mousemoved	      = dummy
  self.mousepressed	    = dummy
  self.mousereleased    = dummy
  self.wheelmoved	      = dummy

  self.textedited	      = dummy
  self.textinput        = dummy
  
  return self
end


return state