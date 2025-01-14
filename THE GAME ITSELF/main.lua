--  Authors: William Xie, Jaafar Kaoussarani, Marianick Benoit, Jason Ma  --
--  File: main.lua                            --
--  Description: Executes the program         --

require "font"
require "camera"
require "physics"
require "config"
require "player"
require "map"
require "menu"
require "logo"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
levelConstant = 0

function love.load()
  windowSet(WINDOW_WIDTH, WINDOW_HEIGHT) --1280*720
  loadFont()
  logo = Logo()
  menu = Menu()
  physicsInit()
  map = Map()
  player = Player()
end

function love.update(dt)
  if logoDisplay then
    logo:update(dt)
  else
    if menuDisplay then
      menu:update(dt)
    else
      world:update(dt)
      camera:setPosition(player.body:getX() - WINDOW_WIDTH/2, -WINDOW_HEIGHT/2 + levelConstant)
      map:update(dt,player)
      player:update(dt)
    end
  end
end


function love.draw()
  if logoDisplay then 
    logo:draw()
  else
    if menuDisplay then
      menu:draw()
    else
      camera:set()
      map:draw(player)
      player:draw()
      love.graphics.setColor(1,1,1)
      camera:unset()
    end
  end
end
