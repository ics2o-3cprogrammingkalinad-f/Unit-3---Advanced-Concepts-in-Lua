-----------------------------------------------------------------------------------------
-- main_menu.lua
-- Created by: Kalina Dunne Farrell
-- Date: April 11, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"
-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local bkgSound = audio.loadSound("Sounds/bkgSound.mp3")
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
-- Creating Transition Function to Credits Page
local function CreditsTransition( )  
    composer.gotoScene( "credits_screen", {effect = "slideLeft", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "fade", time = 1000})
    audio.stop(bkgSoundChannel)
end    

-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function InstructionsTransition( )
    composer.gotoScene( "instructions_screen", {effect = "fromTop", time = 500})
end
-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuKalinaD@2x.png")
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

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*3.8/8,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressed.png",
            overFile = "Images/PlayButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    -- set the play button height and width
    playButton.width = 200
    playButton.height = 200
    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*7/8,
            y = display.contentHeight*7/8,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed.png",
            overFile = "Images/CreditsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

    -- set the credits button height and width
    creditsButton.width = 150 + 50
    creditsButton.height = 80 + 50
    
    -----------------------------------------------------------------------------------------

    -- Creating Instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1.1/8,
            y = display.contentHeight*7/8,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 

    -- set the instructions button height and width
    instructionsButton.width = 190 + 50
    instructionsButton.height = 80 + 50
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

    muteButton.width = 150
    muteButton.height = 80

    -- make the mute and nmute buttons visible or not depending on "soundOn's" status
    if (soundOn == true) then
        -- make the mute button visible and the unmute button invisible
        muteButton.isVisible = true
        unmuteButton.isVisible = false
    elseif (soundOn == false) then
        -- make the unmute button visible and the mute button invisible
        unmuteButton.isVisible = true
        muteButton.isVisible = false
    end
    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( muteButton )

    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view


    -----------------------------------------------------------------------------------------

    -- start the background music if the mure button has not been clicked
    if (soundOn == true) then
    bkgSoundChannel = audio.play(bkgSound, {loops= -1})
    end

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then

        muteButton:addEventListener("touch", Mute)
        unmuteButton:addEventListener("touch", Unmute)
        

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
        audio.stop()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute)
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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
