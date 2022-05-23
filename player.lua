Player = {}
function Player:load()
    self.x = 100
    self.y = 0
    self.width = 20
    self.height = 60
    self.xVel = 0
    self.yVel = 100
    self.maxSpeed = 200
    self.acceleration = 4000
    self.friction = 3500

    self.physics = {}
    self.physics.body = love.physics.newBody(World, self.x, self.y, "dynamic")
    self.physics.body:setFixedRotation(true)
    self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
    self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)
    
end

function Player:update(dt)
    self:syncPhysics()
    self:move(dt)
end

function Player:move(dt)
    if love.keyboard.isDown("d", "left") then
        if self.xVel < self.maxSpeed then       
        self.xVel = self.xVel + self.acceleration * dt
        end
    end
    if love.keyboard.isDown("a", "right") then
        if self.xVel > -self.maxSpeed then
        self.xVel = self.xVel - self.acceleration * dt
        end
    end
    if love.keyboard.isDown("w", "up") then
        if self.yVel > -self.maxSpeed then
        self.yVel = self.yVel + self.acceleration * dt
        end
    end
    if love.keyboard.isDown("s", "down") then
        if self.yVel < self.maxSpeed then
        self.yVel = self.yVel - self.acceleration * dt
        end
    end
end

function Player:syncPhysics()
    self.x, self.y = self.physics.body:getPosition()
    self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end

function Player:draw()
    love.graphics.rectangle("fill", self.x - self.width / 2, self.y - self.height / 2, self.width, self.height)
end
