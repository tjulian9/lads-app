local widget = require( "widget" )
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called
-- -----------------------------------------------------------------------------------------------------------------

-- Local forward references should go here

-- -------------------------------------------------------------------------------

-- Function to handle button events
local function handleButtonEvent( event )
    if ( "ended" == event.phase ) then
        composer.gotoScene("mainPage")
    end
end

-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
    
    local text = display.newText("conventionPage", display.contentCenterX, display.contentCenterY, native.systemFont)
    sceneGroup:insert(text)
    
    local buttonWidth = display.contentWidth * 5/6
	local buttonHeight = display.contentHeight / 8
	local buttonColor = { default={0,0,1}, over = {0,0.1,0.25} }
	local buttonLabelColor = { default={1,1,1}, over={0.9,0.9,0.9} }
	local buttonFontSize = display.contentWidth / 12
	
    local backBtn = widget.newButton(
	    {
	    	x = display.contentCenterX,
	    	y = display.contentHeight * 25/32,
	        width = buttonWidth,
	        height = buttonHeight,
	        shape = "roundedRect",
	        fillColor = buttonColor,
	        labelColor = buttonLabelColor,
	        fontSize = buttonFontSize,
	        label = "Back",
	        onEvent = handleButtonEvent,
	    }
	)
	sceneGroup:insert(backBtn)

    -- Initialize the scene here
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
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