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

return animations