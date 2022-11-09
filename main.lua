math.randomseed(os.time())

local mouse_trail = require("utils.particles")

function love.load()
end

function love.mousepressed(x, y, button)
  if button == 1 or button == 2 then
    mouse_trail:add(x, y)
  end
end

function love.mousemoved(x, y, delta_x, delta_y)
  mouse_trail:add(x, y)
end

function love.wheelmoved(x, y)
  mouse_trail:modify_amount(y)
end

function love.keypressed(key, scancode, is_repeat)
  if key == "up" then
    mouse_trail:modify_amount(1)
  elseif key == "down" then
    mouse_trail:modify_amount(-1)
  end
end

function love.update(delta_time)
  mouse_trail:update(delta_time)
end

function love.draw()
  mouse_trail:draw()

  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Amount: "..mouse_trail.amount.."\nParticles: "..#mouse_trail.particles.."\nFPS: "..love.timer.getFPS(), 5, 5)
end
