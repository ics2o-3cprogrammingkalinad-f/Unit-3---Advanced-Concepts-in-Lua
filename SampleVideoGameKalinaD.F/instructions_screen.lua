-----------------------------------------------------------------------------------------
-- instructions_screen.lua
-- Created by: Kalina Dunne Farrell
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: April 11, 2019
-- Description: This is the instructions page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "instructions_screen"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
local bkgSound = audio.loadStream("Sounds/BkgSound.mp3")
local bkgSoundChannel

local muteButton
local unmuteButton
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- This function is called when the user clicks the mute button
local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the sound
        audio.pause(bkgSound)
        -- set the boolean variables to be false (sound is now muted)
        soundOn = false
        -- hide the mute button
        muteButton.isVisible = false
        -- make the unmute button visible
        unmuteButton.isVisible = true

    end
end

-- this function is called when the player clicks the unmute button
local function Unmute(touch)
    if (touch.phase == "ended") then
        -- play the sound
        audio.play(bkgSound)
        -- set the boolean variables to be true (sound is now ununmuted)
        soundOn = true
        -- hide the unmute button
        unmuteButton.isVisible = false
        -- make the mute button visible
        muteButton.isVisible = true

    end
end
-----------------------------------------------------------------------------------------
-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "fromBottom", time = 500})
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImageRect("Images/CreditsScreen.jpg", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*1/8,
        y = display.contentHeight*14.5/16,

        -- Setting Dimensions
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtonUnpressed.png",
        overFile = "Images/BackButtonPressed.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )
    -----------------------------------------------------------------------------------------
    -- Creating Unmute Button
    unmuteButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 900,--display.contentWidth*2/8,
            y = 50,--display.contentHeight*7/8,

            -- Insert the image here
            defaultFile = "Images/UnmuteButtonUnpressed.png",
            overFile = "Images/UnmuteButtonPressed.png",

            -- When the button is released, call the unmute function
            onRelease = Unmute
        } ) 

    -- set the Unmute button to be invisible
    unmuteButton.isVisible = false

    unmuteButton.width = 150
    unmuteButton.height = 80
    -----------------------------------------------------------------------------------------
    -- Creating Mute Button
    muteButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = 900,--display.contentWidth*2/8,
            y = 50,--display.contentHeight*7/8,

            -- Insert the images here
            defaultFile = "Images/MuteButtonUnpressed.png",
            overFile = "Images/MuteButtonPressed.png",

            -- When the button is released, call the mute function
            onRelease = Mute
        } ) 

    -- set the mute button to be visible
    muteButton.isVisible = true

    muteButton.width = 150
    muteButton.height = 80
    -----------------------------------------------------------------------------------------
    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( muteButton )
    
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    if (soundOn == true) then
    bkgSoundChannel = audio.play(bkgSound, {loops= -1})
    end

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene