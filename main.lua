local NUMBEROFSTARS = 10

local stars = {}
function addStar()
  local star = {}
  star.x = love.graphics.getWidth()/2
  star.y = love.graphics.getHeight()/2
  star.vx = math.random()*2-1
  star.vy = math.random()*2-1
  star.r = math.random()
  star.vr = math.random() * 0.001
  table.insert(stars, star)
end

for i=1,NUMBEROFSTARS do
  addStar()
end

function love.update(dt)
  for i,v in ipairs(stars) do
    v.x = v.x + v.vx*dt*100
    v.y = v.y + v.vy*dt*100
    v.r = v.r + v.vr*dt*100
    v.r = math.min(v.r, 4)
  end
  if math.random() < 0.05 then
    addStar()
  end
end

function love.draw()
  for i,v in ipairs(stars) do
    love.graphics.circle("fill", v.x, v.y, v.r, 32)
  end
end
