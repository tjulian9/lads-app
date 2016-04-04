--local button1 = display.newRect(display.contentCenterX, display.contentHeight / 3, display.contentWidth * 2 / 3, display.contentHeight / 8)
--button1:setFillColor(0, 0, 1)
--local button2 = display.newRect(display.contentCenterX, display.contentHeight / 2, display.contentWidth * 2 / 3, display.contentHeight / 8)
--local button3 = display.newRect(display.contentCenterX, display.contentHeight * 2 / 3, display.contentWidth * 2 / 3, display.contentHeight / 8)

local widget = require( "widget" )
local composer = require( "composer" )

local scene = composer.newScene()

-- Function to handle button events
local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.gotoScene(event.target.tag)
    end
end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
	background:setFillColor(1,1,1)
	sceneGroup:insert(background)
	
	local logo = display.newImage("Images/madisonlogo.jpg", display.contentCenterX, display.contentCenterY * 5/16)
	logo:scale(3, 3)
	sceneGroup:insert(logo)
	
	local buttonWidth = display.contentWidth * 5/6
	local buttonHeight = display.contentHeight / 8
	local buttonColor = { default={0,0,1}, over = {0,0.1,0.25} }
	local buttonLabelColor = { default={1,1,1}, over={0.9,0.9,0.9} }
	local buttonFontSize = display.contentWidth / 12
	
	local messageBtn = widget.newButton(
	    {
	    	x = display.contentCenterX,
	    	y = display.contentHeight * 15/32,
	        width = buttonWidth,
	        height = buttonHeight,
	        shape = "roundedRect",
	        fillColor = buttonColor,
	        label = "Messages",
	        labelColor = buttonLabelColor,
	        fontSize = buttonFontSize,
	        onEvent = handleButtonEvent,
	    }
	)
	messageBtn.tag = "messagePage"
	sceneGroup:insert(messageBtn)
	
	local bowlBtn = widget.newButton(
	    {
	    	x = display.contentCenterX,
	    	y = display.contentHeight * 5/8,
	        width = buttonWidth,
	        height = buttonHeight,
	        shape = "roundedRect",
	        fillColor = buttonColor,
	        labelColor = buttonLabelColor,
	        fontSize = buttonFontSize,
	        label = "Bible Bowl",
	        onEvent = handleButtonEvent,
	    }
	)
	bowlBtn.tag = "bowlPage"
	sceneGroup:insert(bowlBtn)
	
	local conventionBtn = widget.newButton(
	    {
	    	x = display.contentCenterX,
	    	y = display.contentHeight * 25/32,
	        width = buttonWidth,
	        height = buttonHeight,
	        shape = "roundedRect",
	        fillColor = buttonColor,
	        labelColor = buttonLabelColor,
	        fontSize = buttonFontSize,
	        label = "Convention",
	        onEvent = handleButtonEvent,
	    }
	)
	conventionBtn.tag = "conventionPage"
	sceneGroup:insert(conventionBtn)
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen)
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen
        -- Insert code here to make the scene come alive
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen)
        -- Insert code here to "pause" the scene
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view
    -- Insert code here to clean up the scene
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene