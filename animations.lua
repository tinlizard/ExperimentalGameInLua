local animations = {}

function animations.NewIdleAnimation(image,y,width,height,duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {}

    for x=12, 91, width do
        table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
    end
    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end

function animations.WalkingAnimation(image,duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.walkingQuads = {}

    table.insert(animation.walkingQuads,love.graphics.newQuad(19,44,22,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(41,44,23,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(64,44,23,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(87,44,23,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(112,44,26,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(138,44,22,34,image:getDimensions()))
    table.insert(animation.walkingQuads,love.graphics.newQuad(162,44,23,34,image:getDimensions()))

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end

function animations.FightingAnimation(image,duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.fightingQuads = {}
    
    table.insert(animation.fightingQuads,love.graphics.newQuad(10,269,22,33,image:getDimensions()))
    table.insert(animation.fightingQuads,love.graphics.newQuad(39,264,41,33,image:getDimensions()))
    table.insert(animation.fightingQuads,love.graphics.newQuad(84,269,36,33,image:getDimensions()))
    table.insert(animation.fightingQuads,love.graphics.newQuad(119,269,34,33,image:getDimensions()))

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation    
end

return animations
