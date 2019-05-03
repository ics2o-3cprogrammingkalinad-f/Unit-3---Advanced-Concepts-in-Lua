-----------------------------------------------------------------------------------------
-- splash_screen.lua
-- Created by: Kalina Dunne Farrell
-- Date: April 12, 2019
-- Description: This is the splash screen of the game. It displays the company logo that 
-- drives "towards" the screen and leaves behind the words "RM Games", the company name
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- background variable
local bkg

-- company logo variables
local companyLogo
local companyLogoScrollSpeedX = 6.5
local companyLogoScrollSpeedY = 4.5

-- smoke variables
local smoke
local smokeScrollSpeedX = 5.5
local smokeScrollSpeedY = 3.5

-- company name varables
local companyNameScrollSpeedX = 6.5
local companyNameScrollSpeedY = 4.5
local companyName

-- sound variables
local carRacing

-- blimp variables
local blimp
local blimpScrollSpeed = 1.5

-- spectator variables
local spectatorDown1
local spectatorUp1

local spectatorDown2
local spectatorUp2

local spectatorDown3
local spectatorUp3

local spectatorDown4
local spectatorUp4

local spectatorDown5
local spectatorUp5

local spectatorDown6
local spectatorUp6

local spectatorDown7
local spectatorUp7

local spectatorDown8
local spectatorUp8

local spectatorDown9
local spectatorUp9

local spectatorDown10
local spectatorUp10

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
soundOn = true

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- moves the car to the right and down, and makes it fade in and grow
local function MoveLogo(event)
    -- add the the x and y values of companyLogo
    companyLogo.x = companyLogo.x + companyLogoScrollSpeedX
    companyLogo.y = companyLogo.y + companyLogoScrollSpeedY

    -- make the companyLogo grow bigger as its x and y values increase
    companyLogo.width = companyLogo.width + 2
    companyLogo.height = companyLogo.height + 1

    -- make the companyLogo more visible as its x and y values increase
    companyLogo.alpha = companyLogo.alpha + .05

end

-- moves the smoke to the right and down, and makes it fade in and grow
local function MoveSmoke(event)
    -- make the smoke follow the car
    smoke.x = smoke.x + smokeScrollSpeedX
    smoke.y = smoke.y + smokeScrollSpeedY

    -- make the smoke grow bigger as its x and y values increase
    smoke.width = smoke.width + 2
    smoke.height = smoke.height + 1

    -- make the smoke more visible as its x and y values increase
    smoke.alpha = smoke.alpha + 0.5

end

-- moves the company name to the right and down, and makes it fade in and grow
local function MoveName(event)
    companyName.x = companyName.x + companyNameScrollSpeedX
    companyName.y = companyName.y + companyNameScrollSpeedY

    -- make the companyName grow bigger as its x and y values increase
    companyName.width = companyName.width + 2
    companyName.height = companyName.height + 1

    -- make the companyName more visible as its x and y values increase
    companyName.alpha = companyName.alpha + 0.5

end

-- this function plays the sound
local function PlaySound()
    audio.play(carRacing)

end

-- this function goes to the main_menu
local function gotoMainMenu(  )
    composer.gotoScene("main_menu")
end
-----------------------------------------------------------------------------------------
-- extra animations

-- this function moves the blimp, very slowly, across the top of the screen
local function MoveBlimp(event)
    blimp.x = blimp.x + blimpScrollSpeed

end
-----------------------------------------
-- spectators

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator1()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump1)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator2()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump2)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator3()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump3)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator4()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump4)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator5()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump5)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator6()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump6)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator7()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump7)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator8()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump8)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator9()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump9)

end

-- this function calls the function to make a spectator jump into the air
local function MoveSpectator10()
    -- call the first function to move the spectator
    timer.performWithDelay(0, SpectatorJump10)

end
--------------------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
--------------------------------------------------------------------------------------------

--------------------------------------------
--spectator 1

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump1()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown1.isVisible = false
    spectatorUp1.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand1)

end

--this function makes the spectator land and put his arms down
function SpectatorLand1()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp1.isVisible = false
    spectatorDown1.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump1)

end
--------------------------------------------
-- spectator 2

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump2()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown2.isVisible = false
    spectatorUp2.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand2)

end

--this function makes the spectator land and put his arms down
function SpectatorLand2()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp2.isVisible = false
    spectatorDown2.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump2)

end
--------------------------------------------
-- spectator 3

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump3()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown3.isVisible = false
    spectatorUp3.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand3)

end

--this function makes the spectator land and put his arms down
function SpectatorLand3()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp3.isVisible = false
    spectatorDown3.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump3)

end
--------------------------------------------
-- spectator 4

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump4()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown4.isVisible = false
    spectatorUp4.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand4)

end

--this function makes the spectator land and put his arms down
function SpectatorLand4()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp4.isVisible = false
    spectatorDown4.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump4)

end
--------------------------------------------
-- spectator 5

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump5()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown5.isVisible = false
    spectatorUp5.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand5)

end

--this function makes the spectator land and put his arms down
function SpectatorLand5()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp5.isVisible = false
    spectatorDown5.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump5)

end
--------------------------------------------
-- spectator 6

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump6()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown6.isVisible = false
    spectatorUp6.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand6)

end

--this function makes the spectator land and put his arms down
function SpectatorLand6()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp6.isVisible = false
    spectatorDown6.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump6)

end
--------------------------------------------
-- spectator 7

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump7()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown7.isVisible = false
    spectatorUp7.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand7)

end

--this function makes the spectator land and put his arms down
function SpectatorLand7()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp7.isVisible = false
    spectatorDown7.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump7)

end
--------------------------------------------
-- spectator 8

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump8()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown8.isVisible = false
    spectatorUp8.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand8)

end

--this function makes the spectator land and put his arms down
function SpectatorLand8()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp8.isVisible = false
    spectatorDown8.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump8)

end
--------------------------------------------
-- spectator 9

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump9()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown9.isVisible = false
    spectatorUp9.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand9)

end

--this function makes the spectator land and put his arms down
function SpectatorLand9()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp9.isVisible = false
    spectatorDown9.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump9)

end
--------------------------------------------
-- spectator 10

-- this function makes the spectator jump into the air with their arms raised
function SpectatorJump10()
    -- make spectatorDown invisible and spectatorUp visible
    spectatorDown10.isVisible = false
    spectatorUp10.isVisible = true

    -- wait half a second then call the SpectatorLand function
    timer.performWithDelay(500, SpectatorLand10)

end

--this function makes the spectator land and put his arms down
function SpectatorLand10()
    -- make spectatorUp invisible and spectatorDown visible
    spectatorUp10.isVisible = false
    spectatorDown10.isVisible = true

    -- wait half a second then call the SpectatorJump function
    timer.performWithDelay(500, SpectatorJump10)

end
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- set the background to be black
    display.setDefault("background", 0, 0, 0)

    -----------------------------------------------------------------------------------------
-- OBJECT CREATION
-----------------------------------------------------------------------------------------
-- set the background image then make it cover the whole screen
    bkg = display.newImageRect("Images/bkgImage.jpg", display.contentWidth, display.contentHeight)
    bkg.anchorX = 0
    bkg.anchorY = 0
    bkg.x = 0
    bkg.y = 0

-- create the car
    companyLogo = display.newImageRect("Images/companyLogo.png", 200, 100)
    
    -- anchor the car
    companyLogo.anchorX = 0

    -- set its x and y values
    companyLogo.x = 260
    companyLogo.y = 400

    -- make the company logo start off as invisible/transparent
    companyLogo.alpha = 0

    -- make the car rotate to face down a little bit
    companyLogo:rotate(20)

-- create the smoke that will be coming out the back of the car
    smoke = display.newImageRect("Images/smoke.png", 150, 100)

-- set the smokes initial x and y values
    smoke.x = 200
    smoke.y = 350

    -- flip the smoke
    smoke:scale(-1, 1)
    
    -- make the smoke start off as invisible/transparent
    smoke.alpha = 0

    -- make the smoke face down a little bit
    smoke:rotate(20)

-- create the companyName (company name) that will be following the smoke
    companyName = display.newImageRect("Images/RMGames.png", 400, 400)

    -- set its x and y values
    companyName.x = 200
    companyName.y = 300

    -- make companyName start off as invisible/transparent
    --companyName.alpha = 0

    -- make it rotate face down a little bit
    companyName:rotate(20)

-- create the sound
    carRacing = audio.loadStream("Sounds/carRacing.mp3") -- lasts 4 seconds

-- create the blimp
    blimp = display.newImageRect("Images/blimp.png", 200, 200)

    -- set its x and y values
    blimp.x = 900
    blimp.y = 70
-----------------------------------------------------------------------------------------
-- spectators
--------------------------------------------
-- spectator 1

-- create the spectatorDown
    spectatorDown1 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown1.x = 890
    spectatorDown1.y = 435

-- create the spectatorUp
    spectatorUp1 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp1.x = 890
    spectatorUp1.y = 430

    -- make it invisible to start with
    spectatorUp1.isVisible = false
--------------------------------------------
-- spectator 2

-- create the spectatorDown
    spectatorDown2 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown2.x = 870
    spectatorDown2.y = 434

-- create the spectatorUp
    spectatorUp2 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp2.x = 870
    spectatorUp2.y = 429

    -- make it invisible to start with
    spectatorUp2.isVisible = false
--------------------------------------------
-- spectator 3

-- create the spectatorDown
    spectatorDown3 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown3.x = 850
    spectatorDown3.y = 433

-- create the spectatorUp
    spectatorUp3 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp3.x = 850
    spectatorUp3.y = 428

    -- make it invisible to start with
    spectatorUp3.isVisible = false
--------------------------------------------
-- spectator 4

-- create the spectatorDown
    spectatorDown4 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown4.x = 830
    spectatorDown4.y = 432

-- create the spectatorUp
    spectatorUp4 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp4.x = 830
    spectatorUp4.y = 427

    -- make it invisible to start with
    spectatorUp4.isVisible = false
--------------------------------------------
-- spectator 5

-- create the spectatorDown
    spectatorDown5 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown5.x = 810
    spectatorDown5.y = 431

-- create the spectatorUp
    spectatorUp5 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp5.x = 810
    spectatorUp5.y = 426

    -- make it invisible to start with
    spectatorUp5.isVisible = false
--------------------------------------------
-- spectator 6

-- create the spectatorDown
    spectatorDown6 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown6.x = 790
    spectatorDown6.y = 430

-- create the spectatorUp
    spectatorUp6 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp6.x = 790
    spectatorUp6.y = 425

    -- make it invisible to start with
    spectatorUp6.isVisible = false
--------------------------------------------
-- start going 'down' from the first spectator
--------------------------------------------
-- spectator 7

-- create the spectatorDown
    spectatorDown7 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown7.x = 910
    spectatorDown7.y = 436

-- create the spectatorUp
    spectatorUp7 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp7.x = 910
    spectatorUp7.y = 431

    -- make it invisible to start with
    spectatorUp7.isVisible = false
--------------------------------------------
-- spectator 8

-- create the spectatorDown
    spectatorDown8 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown8.x = 930
    spectatorDown8.y = 437

-- create the spectatorUp
    spectatorUp8 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp8.x = 930
    spectatorUp8.y = 432

    -- make it invisible to start with
    spectatorUp8.isVisible = false
--------------------------------------------
-- spectator 9

-- create the spectatorDown
    spectatorDown9 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown9.x = 950
    spectatorDown9.y = 438

-- create the spectatorUp
    spectatorUp9 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp9.x = 950
    spectatorUp9.y = 433

    -- make it invisible to start with
    spectatorUp9.isVisible = false
--------------------------------------------
-- spectator 10

-- create the spectatorDown
    spectatorDown10 = display.newImageRect("Images/spectatorDown.png", 50, 50)

    -- set its x and y values
    spectatorDown10.x = 970
    spectatorDown10.y = 439

-- create the spectatorUp
    spectatorUp10 = display.newImageRect("Images/spectatorUp.png", 50, 50)

    -- set its x and y values
    spectatorUp10.x = 970
    spectatorUp10.y = 434

    -- make it invisible to start with
    spectatorUp10.isVisible = false
--------------------------------------------

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( bkg )
    sceneGroup:insert( companyLogo )
    sceneGroup:insert( smoke )
    sceneGroup:insert( companyName )

    sceneGroup:insert( blimp )

    sceneGroup:insert( spectatorDown1 )
    sceneGroup:insert( spectatorUp1 )

    sceneGroup:insert( spectatorDown2 )
    sceneGroup:insert( spectatorUp2 )

    sceneGroup:insert( spectatorDown3 )
    sceneGroup:insert( spectatorUp3 )

    sceneGroup:insert( spectatorDown4 )
    sceneGroup:insert( spectatorUp4 )

    sceneGroup:insert( spectatorDown5 )
    sceneGroup:insert( spectatorUp5 )

    sceneGroup:insert( spectatorDown6 )
    sceneGroup:insert( spectatorUp6 )

    sceneGroup:insert( spectatorDown7 )
    sceneGroup:insert( spectatorUp7 )

    sceneGroup:insert( spectatorDown8 )
    sceneGroup:insert( spectatorUp8 )

    sceneGroup:insert( spectatorDown9 )
    sceneGroup:insert( spectatorUp9 )

    sceneGroup:insert( spectatorDown10 )
    sceneGroup:insert( spectatorUp10 )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music
        audio.play(carRacing)

        -- Call the functions to move the images as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", MoveLogo)
        Runtime:addEventListener("enterFrame", MoveSmoke)
        Runtime:addEventListener("enterFrame", MoveName)

        -- extra function calls/event listeners
        Runtime:addEventListener("enterFrame", MoveBlimp)
        MoveSpectator1()
        MoveSpectator2()
        MoveSpectator3()
        MoveSpectator4()
        MoveSpectator5()
        MoveSpectator6()
        MoveSpectator7()
        MoveSpectator8()
        MoveSpectator9()
        MoveSpectator10()

        -- Go to the main menu screen after the given time.
        print ("***Calling main_menu")
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  
    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the sounds for this screen
        --audio.stop(carRacing)
   
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