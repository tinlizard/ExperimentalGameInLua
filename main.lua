local animations = require("animations")

function love.load()
    --load images for idling and walking, and set title
    isIdling = true
    isWalking = false
    x_pos = 300 
    y_pos = 200
    facingRight = true
    --load spritesheet and background image
    local image = love.graphics.newImage("adventurer-sheet-2.png")
    background = love.graphics.newImage("orig.png")
    --set window title
    love.window.setTitle("Experimental Game")
    --set window width and height
    love.window.setMode(576,324)
    --load animations
    idle_animation = animations.NewIdleAnimation(image, 5,21.5, 34, 0.4)
    walk_animation = animations.WalkingAnimation(image,0.5)
    -- prevent blurry image
    image:setFilter("nearest", "nearest")
end

function love.draw()
    --get current sprite number
    local spriteNum = math.floor(idle_animation.currentTime / idle_animation.duration * #idle_animation.quads) + 1
    local walkSpriteNum = math.floor(walk_animation.currentTime / walk_animation.duration * #walk_animation.walkingQuads) + 1
    love.graphics.draw(background,0,0)
    --if isIdling is true, then draw the idle animation
    if isIdling and not isWalking then
        love.graphics.draw(idle_animation.spriteSheet, idle_animation.quads[spriteNum], x_pos, y_pos, 0, 1.8)
    end
    --if isWalking is true, then draw the walking animation
    if isWalking and not isIdling then
        local scaleX = 1.8
        if not facingRight then
            scaleX = -1.8 -- Flip horizontally when facing left
        end
        love.graphics.draw(walk_animation.spriteSheet, walk_animation.walkingQuads[walkSpriteNum],x_pos,y_pos,0,scaleX,1.8)
    end
end

function love.update(dt)
    -- Update idle animation time
    if isIdling then
        idle_animation.currentTime = idle_animation.currentTime + dt
        if idle_animation.currentTime >= idle_animation.duration then
            idle_animation.currentTime = idle_animation.currentTime - idle_animation.duration
        end
    end

    -- Update walking animation time
    if isWalking then
        walk_animation.currentTime = walk_animation.currentTime + dt
        if walk_animation.currentTime >= walk_animation.duration then
            walk_animation.currentTime = walk_animation.currentTime - walk_animation.duration
        end 
    end
    
    -- Check for walking input
    if love.keyboard.isDown("d") then
        isIdling = false
        isWalking = true
        x_pos = x_pos + 2 -- Adjust this value for movement speed
        facingRight = true
    elseif love.keyboard.isDown("a") then
        isIdling = false
        isWalking = true
        x_pos = x_pos - 2 -- Adjust this value for movement speed
        facingRight = false
    else
        isIdling = true
        isWalking = false
    end
end
