--Todo: Add left slopes by starting at the opposite side of the selection. DONE
--Todo: Remove bottom half of the tile will be filled in with paint bucket. DONE
--Todo: Create new selection. Select Top Tile. Set. Select Mid Tile. Set. Copy both to new layer. DONE
--TODO: If both tiles are already in position then don't move them when getting ready for copying. DONE
--TODO: We need to be pasting our copyed set up near the bottom.. we need to get where bottom of canvas is. DONE
--Todo: Add in layer support where the grass layer is septate from ground layer
--Todo: Add vertical slopes (bottom to top instead of left to right)
--Todo: Add Auto tile Generator where it you select the top and middle tiles and it will create the basic 2  slopes from it.
--		 	-This would create a new layer then copy the tiles down below for use of making a tile slope. Then finally put
--			 them back next to the basic tile set much like mort mort's video.
--Added 1.1.1
--- Reworked version to more actively reflect the scripts current state.
--- Error checking if you try and open the script with out an active project open first.
--- BIG Error check on tile selection when about to slope that would cause big issues if user selected a width smaller then
---- then multiples of tile widths
---------------------------------------------------------------------------------------------------
--[CC] Slope Generator Toolbar Version 1.2.0
--Helpful tool bar that will speed up creation of slopes in a tile set.
--(c)2019 CarbsCode perhaps Please don't Claim this script as your own work <3
--Pixel art technique inspired by MortMort
--
--Features:
--Quick setup button that will copy a bunch of your tiles quickly to a separate layer. 
--    Ready to be worked on. Should be non-destructible.
--Creates a slope from a single layer (top and bottom of tile on the same layer)
--Generation will adjust the steepness of the slope based on your selection.
--Left and right downward slopes can easily be created.
--Help & Info panel built in to the toolbar to give reminders of how to use.
--Added 1.1.1
--- Reworked version to more actively reflect the scripts current state.
--- Error checking if you try and open the script with out an active project open first.
--- BIG Error check on tile selection when about to slope that would cause big issues if user selected a width smaller then
---- then multiples of tile widths
---------------------------------------------------------------------------------------------------
if app.version >= Version("1.2.16.3") then
  --SET GLOBAL VARS
  if app.activeSprite == nil then
    app.alert("An open project is required before opening this toolbar.")
  else
  app.command.DeselectMask()
  app.activeTool = "rectangular_marquee"
    canvasSize = app.activeSprite.bounds
    tileSize = app.activeSprite.gridBounds
    topTile = Rectangle(0,0,0,0)
    botTile = Rectangle(0,0,0,0)

function shGSSup()
      infoGS:close()
      app.refresh()
      thankyouDLGGS:show{wait=false}
      thankyouDLGGS.bounds = Rectangle(main.bounds.x+(main.bounds.width+5), main.bounds.y, 465, 295)--Rectangle(282, 55, 235, 210)
  end


--DIALOG HELP AND INFO
infoGS = Dialog("Help & Info")
  infoGS
  :separator{text=""}
  :newrow()
  :button{
    text="Click Here To View Carbs Thank You And View Extra Information / Links",
    onclick=function() shGSSup() end}
  :separator{text="------- Single Layer Operation -------"}
  :newrow()
  :label{text="1.If your grid size differs from your single tile size, select your tile and press the button labeled [Set Grid From Selection]."}
  :newrow()
  :label{text=""}
  :newrow()
  :label{text="2.If you don't have enough free tiles on your sheet press [Expand Sheet]"}
  :newrow()
  :label{text=""}
  :newrow()
  :label{text="3.Select your top tile and press [Select Top Tile]"}
  :newrow()
  :label{text=""}
  :newrow()
  :label{text="4.Select your fill tile and press [Select Fill Tile]"}
  :newrow()
  :label{text=""}
  :newrow()
  :label{text="5.Click [Gen Setup]. This will create a copy of your tiles on a new workable layer."}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="6.Select ONLY the top (grass part) of your tile or tiles that you would like to slope. (Press M for rectangle selection tool)"}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="7.De-select any fill (dirt) pixels (Alt+Shift to remove from your current selection)"}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="8.Click [Gen Slope [Left]] or [Gen Slope [Right]] to create the slope."}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="9.(Optional)You can repeat this with the other side of the copied tiles."}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="10.Select all tiles you would like to keep and press [Move To Tileset]. (Shift+Double click to add each tile to your selection)"}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="11.Select and move your new tiles to an empty space on your original tile set."}
  :newrow()
  :label{text=""}  
  :newrow()
  :label{text="12.Click [Reset Canvas Size] to reset your canvas size back to what it was before."}    
  :separator{text="------- Credits -------"}
  :newrow()
  :label{text="Scripting by CarbsCode | Made by Carbs | Inspired Pixel Art Technique from MortMort <3 Version 1.2.0"}

  function handleInfoBox()
  	if infoGS.bounds.x and infoGS.bounds.y == 0 then
  		infoGS:show{wait=false}
  		infoGS.bounds = Rectangle(main.bounds.x+(main.bounds.width+5), main.bounds.y, 540, (main.bounds.height + dlg.bounds.height) +5)--Rectangle(282, 55, 235, 210)
  	else
  		infoGS:close()
  		infoGS.bounds = Rectangle(0, 0, 540, (main.bounds.height + dlg.bounds.height) +5)
  		app.refresh()
      end
    end

  function handleDLGBox()
  	if dlg.bounds.x and dlg.bounds.y == 0 then
  		dlg:show{wait=false}
  		dlg.bounds = Rectangle(main.bounds.x, main.bounds.y+(main.bounds.height+5), main.bounds.width, 320)
  	else
  		dlg:close()
  		dlg.bounds = Rectangle(0, 0, 250, 250)
  		app.refresh()
  end
end

main = Dialog("[CC] Slope Generator")
	:button{
  	id="showMain",
  	text="Show / Hide Toolbar",
  	onclick = function() handleDLGBox() end
  	}
  -- :newrow()
  -- :button{
  --   id="mergeButton",
  --   text="Test",
  --   onclick = function() setupAdvancedWorkspace() end
  --   }
  	:show{wait=false}
  	main.bounds = Rectangle(153, 55, 124, 40)

--DIALOG SLOPE GENERATOR
dlg = Dialog(" ")
  :button{
  	id="infoButton",
  	text="Help && Info",
  	onclick = function() handleInfoBox() end
  }
  :newrow()
  :separator{
  		id="separator1",
  		label="Split This",
  		text="Pre-Setup"}
  :newrow()
  :button{
  	id="gridsizeSetup",
  	text="Set Grid From Selection",
  	onclick = function() setupGridSize() end
  }
  :newrow()
  :button{
  	id="gridsizeSetup",
  	text="Undo Grid Resize",
  	onclick = function() undoGridSize() end
  }
  :newrow()
    :button{
    id="gridsizeSetup",
    text="Expand Sheet",
    onclick = function() expandSheet() end
  }
  :newrow()
  :separator{
      id="separator1",
      label="Split This",
      text="Setup Slope Generator"}
  :button{
    id="setTopTile",
    text="Select Top Tile",
    onclick = function() setTopTile() end
  }
  :newrow()
  :button{
    id="setBotTile",
    text="Select Fill Tile",
    onclick = function() setBotTile() end
  }
  :newrow()
  :button{
  	id="slopeGenerationSetup",
  	text="Gen Setup",
  	onclick = function() setup() end
  }
  :newrow()
  --:slider{
  	--id="flatTilesNum",
  	--min=1,max=4,value=3}
  --:newrow()
  :separator{
  		id="separator2",
  		label="Split That",
  		text="Generate Slopes"}
  :button{
  	id="slopeGeneration",
  	text="Gen Slope [Left]",
  	onclick = function() createEZSlope("left") end}
   :newrow()
   :button{
  	id="slopeGeneration2",
  	text="Gen Slope [Right]",
  	onclick = function() createEZSlope("right") end}
  :newrow()
  :separator{
  		id="separator3",
  		label="Split These",
  		text="Move Tiles"}
  :button{
  	id="mergeButton",
  	text="Move To Tileset",
  	onclick = function() mergeLayersMain() end
  	}
  :newrow()
  :button{
    id="resetCanvas",
    text="Reset Canvas Size",
    onclick = function() resetCanvas() end
    }
  --:show{wait=false}
  dlg.bounds = Rectangle(0, 0, 124, 320)

--SET TOP TILE POSITION 
function setTopTile()
  topTile = app.activeSprite.selection.bounds
end

--SET BOT TILE POSITION 
function setBotTile()
  botTile = app.activeSprite.selection.bounds
end

function setupAdvancedWorkspace()
--EXPAND CANVAS FOR WORKSPACE AREA
  local advSpr = app.activeSprite
  local advCS = advSpr.bounds
  --Advanced toggle that will select tiles separate
  --Set canvas height to current height plus tileSize * 3 (2 for tiles and 1 for spacing)
  app.command.DeselectMask()
  advCS.height = advCS.height + (tileSize.height*3)
  --Check canvas width to see if it will support set up if not expand
  if advCS.width < (tileSize.width * 7) then
      advCS.width = (tileSize.width *7)
  end
    app.activeSprite.height = advCS.height
    app.activeSprite.width = advCS.width
    app.refresh()
  --Get Top Tile Location and size
  advSpr.selection:select(topTile)
  --Copy top tile
  app.command.FitScreen()
  app.command.Copy()
  --Create new layer (OG workable layer)
  app.command.NewLayer()
  app.activeLayer.name = "Non-Destructive AdvSlopes Layer"
  app.command.DeselectMask()
  --Paste top tile in 2nd top tile
  app.command.Paste()
  app.activeSprite.selection:select(topTile)
    app.command.MoveMask{
    target="content",
    direction="left",
    units="pixel",
    quantity=topTile.x,
      }
    app.command.MoveMask{
    target="content",
    direction="right",
    units="pixel",
    quantity=topTile.width,
      }
    if topTile.y < topTile.height then
      --Do nothing
    else
    app.command.MoveMask{
    target="content",
    direction="up",
    units="pixel",
    quantity=topTile.y,
      }
    end
  --Return to tileset layer
    app.command.GotoPreviousLayer()
    app.command.refresh()
  --Get Bottom Tile
    advSpr.selection:select(botTile) 
    --Copy bottom tile
    app.command.FitScreen()
    app.command.Copy()  
    --Return to new layer
    app.command.GotoNextLayer()
    --Paste just below top tile.
    app.command.Paste()
    app.activeSprite.selection:select(botTile)
    app.command.MoveMask{
    target="content",
    direction="left",
    units="pixel",
    quantity=botTile.x,
      }
    app.command.MoveMask{
    target="content",
    direction="right",
    units="pixel",
    quantity=botTile.width,
      }
    if botTile.y < botTile.height then
        app.command.MoveMask{
        target="content",
        direction="down",
        units="pixel",
        quantity=(botTile.height),
        }
    else
        if botTile.y == botTile.height then
        --Don't Move
        else
        app.command.MoveMask{
        target="content",
        direction="up",
        units="pixel",
        quantity=(botTile.y - botTile.height),
        }
        end
    end
    advSpr.selection:select(Rectangle(tileSize.width,0,tileSize.width,tileSize.height*2))
  app.transaction(function()setupGeneration(3,false) end)
end

--SETUP GRID SIZE
  function setupGridSize()
  	local selection = app.activeSprite.selection.bounds
  	if selection.width == selection.height then
  		oldGridSize = app.activeSprite.gridBounds
  		app.command.SelectionAsGrid()
      tileSize = app.activeSprite.gridBounds
  		app.refresh()
  	else
  		app.alert("Width and hight should be the same when setting a grid size.")
  	end
  end
--UNDO GRID SIZE 
  function undoGridSize()
  	app.activeSprite.gridBounds = oldGridSize
  	app.refresh()
  end

--MAIN SETUP
   function setup()
   	local sliderData = dlg.data
   	--print(sliderData.flatTilesNum)
    app.transaction(function() setupAdvancedWorkspace() end)
   	--app.transaction(function() setupGeneration(3) end)
   end

--SETUP GENERATION
   function setupGeneration(flatTiles,createNewLayer)
   	local setupSelection = app.activeSprite.selection.bounds
    app.command.DeselectMask()
    local setupSpr = app.activeSprite
    local setupSprCS = setupSpr.bounds
  --Make sure we have room to make workable space
  if createNewLayer == true then
    if setupSprCS.width < (tileSize.width *7) then
      setupSprCS.width = (tileSize.width *7)
    end
    if setupSprCS.height < (tileSize.height*7) then
      setupSprCS.height = tileSize.height*7
    end
    app.command.DeselectMask()
    app.activeSprite.height = setupSprCS.height
    app.activeSprite.width = setupSprCS.height
   --RESUME
  end
    app.activeSprite.selection:select(setupSelection)

	if setupSelection.width ~= setupSelection.height/2 then
   		app.alert("Selection should include both your top tile (grass) and middle tile (dirt). (Select only the full tiles.)")
   	else
   	app.command.FitScreen()
   	app.command.Copy()--Might not need?
    if createNewLayer == true then
        app.command.NewLayer()
        app.activeLayer.name = "Non-Destructive Slopes Layer"
    end
   	app.command.DeselectMask()
   	-------local setupSpr = app.activeSprite
   	--Generate right side
   	setupSpr.selection:select(Rectangle(setupSelection))
   	app.command.Copy()
    app.command.Clear()
   	app.command.Paste()
   	--print(tSize.width)
   	--print(flatTiles)
   	--print(tSize.width * flatTiles)
   	--print(tSize.width *(flatTiles*2)/tSize.width)
   	--Moves both top and middle tiles to a work area.
   	app.command.MoveMask{
 		target="content",
 		direction="down",
 		units="pixel",
 		quantity=(setupSprCS.height - tileSize.height *2),
 			}
 	for i=0,flatTiles do
 	app.command.Copy()
 	app.command.Paste()
 	app.command.MoveMask{
 		target="content",
 		direction="right",
 		units="pixel",
 		quantity=tileSize.width,
 			}
 	end
 	--Getting ready to copy another top bit.
 	app.command.MoveMask{
 		target="boundaries",
 		direction="up",
 		units="pixel",
 		quantity=tileSize.height,
 			}
 	app.command.Copy()
 	app.command.Paste()
 	--Move top tile to side of our top and middle setup tiles.
 	app.command.MoveMask{
 		target="content",
 		direction="right",
 		units="pixel",
 		quantity=tileSize.height,
 			}
 	app.command.MoveMask{
 		target="content",
 		direction="down",
 		units="pixel",
 		quantity=tileSize.height,
 			}
 	app.command.Copy()
 	app.command.Paste()
 	app.command.MoveMask{
 		target="content",
 		direction="left",
 		units="pixel",
 		quantity=tileSize.width*(flatTiles*2),
 			}
 	app.command.DeselectMask()
   end
end

--MAIN GENERATE FUNCTION
   function createEZSlope(createDirection)
   --ShiftSlope(createDirection,mLayer)
   app.transaction(function() ShiftSlope(createDirection) end)
  end

--SHIFT SLOPE
  function ShiftSlope(slopeDirection)
  	local dir = slopeDirection
  	local multiLayer = multiLayer
  	--MOVING local tileSize = app.activeSprite.gridBounds
 	--Toss an error if the tile is taller then it is wide as this is only meant to be a HSlope Add VSlopes later
 	--Copy location of the copied area and store it's bounds for later use.
	local savedSelection = app.activeSprite.selection.bounds
	if savedSelection.width <= savedSelection.height then
		app.alert("The selection width needs to be bigger then selections height. Select pixel area containing your edge (grass pixels) within the top tile (grass tile)")
	elseif savedSelection.width % tileSize.width == 0 then
	       local selectedTile = app.activeSprite
	       local tileRect = Rectangle(savedSelection.x,savedSelection.y,savedSelection.width,tileSize.height)
	       selectedTile.selection:select(tileRect)
	       --Move original selection to new layer so it's none destructive.
 	       --Copy content in selection rectangle.
	       app.command.Copy()
 	       app.command.Clear()
 	       app.command.NewLayer()
 	       app.command.Paste()
 	       app.command.DeselectMask()
 	       --Start setting up new selection and getting ready for shifting down and in direction.
 	       local spr = app.activeSprite
 	       spr.selection:select(savedSelection)
 	       local rectangle = savedSelection
 	       --local selX = rectangle.x
 	       --local selY = rectangle.y
 	       --local selW = rectangle.width
 	       --local selH = rectangle.height
 	       local wHDif = rectangle.width // tileSize.height
 	       local tileDif = tileSize.height - rectangle.height
 	       --Delete all content below the selected area (keep the grass)
 	       spr.selection:select(Rectangle(rectangle.x,rectangle.y+rectangle.height,rectangle.width,tileDif))
 	       app.command.clear()
 	       if dir == "right" then
  	 	       spr.selection:select(Rectangle(rectangle.x+wHDif,rectangle.y,wHDif,tileSize.height))
  	     else
  		       spr.selection:select(Rectangle((rectangle.x+rectangle.width)-(wHDif*2),rectangle.y,wHDif,tileSize.height))
  	     end
 	
 		      for i=1,(rectangle.width/wHDif)-1 do
 			        app.command.MoveMask{
 				       target="content",
 				       direction="down",
 				       units="pixel",
 				       quantity=i,
 			          }

			        app.command.MoveMask{
	 			       target="boundaries",
	 			       direction="up",
	 			       units="pixel",
	 			       quantity=i,
	 		        }

	 		        app.command.MoveMask{
	 			       target="boundaries",
	 			       direction=dir,
	 			       units="pixel",
	 			       quantity=wHDif,
	 		        }
	 	      end
	 	      spr.selection:deselect()
	 	      app.refresh()
	 	--End Shifting
	 	--Back to original layer
	 	      app.command.GotoPreviousLayer()
	 	      app.command.refresh()
	 	--Select content from saved selection and create a new brush
	 	      spr.selection:select(tileRect)
	 	      app.command.MoveMask{
	 		        target="boundaries",
	 		        direction="down",
	 		        units="pixel",
	 		        quantity=tileSize.height,
	 		        }
	 	      app.command.NewBrush()
	 	      app.command.GotoNextLayer()
	 	--move mask backup to slope area
	 	      spr.selection:select(tileRect)
	 	--Use fill tool on bottom left or right pixel
	 	      if dir == "right" then
	 		        app.useTool{
	 		        tool="paint_bucket",
	 		        points={Point(savedSelection.x+1,(savedSelection.y+tileSize.height) - 2)}
	 		        }
	 	      else
	 		        app.useTool{
	 		        tool="paint_bucket",
	 		        points={Point((savedSelection.x+savedSelection.width) -1,(savedSelection.y+tileSize.height) -2)}
	 		        }
	 	      end
	 	      app.command.DiscardBrush()
	 	      app.command.MergeDownLayer()
          app.activeTool = "rectangular_marquee"
	        app.refresh()
      else
      app.alert("Selection WIDTH needs in multiples of tile width (1 full tile 2 full tiles etc.) regardless of selection height.")
      end
  end

function mergeLayersMain()
  app.transaction(function() mergeLayers()end)
   end

function mergeLayers()
    app.command.InvertMask()
    app.command.Clear()
    --- Determine any white space in between and get rid of it.
    --- Move selected tiles together
    -- Get and store size of new selection with keep tiles in it.
    local bigSelection = app.activeSprite.bounds
    -- Make sure tileset has space for new tileSize
    -- Move to safe location

    app.command.MergeDownLayer()

    app.command.DeselectMask()
end


function resetCanvas()
  app.command.DeselectMask()
  app.activeSprite.height = app.activeSprite.height - tileSize.height*3
  app.refresh()
end

  function scanTilesForBackground(x,y,selectionSize)
  --Select tile at x,y
  local scanSpr = app.activeSprite
  --set selection width height based on tile size.
  scanSpr.selection:select(Rectangle(x,y,tileSize.width,tileSize.height))
  --Does this tile have background color?
  local tileClear = app.activeSprite.backgroundLayer
  print(tileClear)
  --If so this tile cord is clear. Check around it by selection size.
  --Return true or false if area is good.
  end
  function expandSheet()
    app.command.DeselectMask()
    app.activeSprite.height = app.activeSprite.height + tileSize.height
    app.refresh()
  end
end
thankyouDLGGS= Dialog{title="Thank You For Your Interest In My Toolbars :D"}

thankyouDLGGS
  :separator{text=""}
    :newrow()
    :label{text="Dear Awesome Person,"}
    :newrow()
    :label{text="Thank you for checking out my toolbar! I hope you are getting great use from it!"}
    :newrow()
    :label{text=""}
    :newrow()
    :label{text="I would love to see what you have created with this tool!"}
    :newrow()
    :label{text="Below I have added a button that will link to my twitter page if you would like to share your work :D"}
    :newrow()
    :label{text="Tweet at me bro :P"}
    :newrow()
    :label{text=""}
    :newrow()
    :label{text="If you are really enjoying this tool and finding it very useful,"}
    :newrow()
    :label{text="and would like to support the creation of it I have included a link where you can do so below :D"}
    :newrow()
    :label{text="By no means is it required! However I am extremely grateful for the extra support as this is all"}
    :newrow()
    :label{text="done in my free time and takes many upon many of hours to complete as I want to make sure"}
    :newrow()
    :label{text="every feature is polished and easy to use."}
    :newrow()
    :label{text=""}
    :newrow()
    :label{text="Again THANK YOU <3 and enjoy!"}
    :newrow()
    :label{text="                                 -Carbs"}
    :newrow()
    :label{text=""}
    :newrow()
    :label{text="PS. Shoutout to everyone that has shared this tool and spread the word much love guys!"}
    :newrow()
    :label{text="PPS. Shoutout to David & Gaspar Capello and all Aseprite Devs. Without you none of this would be possible!"}
    :newrow()
    :separator{text=""}
    :newrow()
    :button{
      text="Tweet Your Artwork At Me",
      onclick=function() openWebsite("https://twitter.com/CarbsCode")end}
    :button{
      text="View All CarbsCode Projects",
      onclick=function() openWebsite("https://carbscode.itch.io")end}
    :button{
      text="Donate To CarbsCode",
      onclick=function() openWebsite("https://carbscode.itch.io/carbscode-donation") end}
    :newrow()
    :separator{text=""}
function openWebsite(website)
  local system = "Linux"
  --app.alert{text={"Opening Carbs Itch.io Website","","Because this opens a web browser Aseprite will ask you","to allow this action in the next dialog."}}
  --Windows
  if system == "Windows" then
    os.execute("start " ..website.. "")
  --Mac
  elseif system == "MacOS" then
    os.execute("open " ..website.. "")
  --Linux
  elseif system == "Linux" then
    os.execute("xdg-open " ..website.. "")
  else
    app.alert("Unsure what operating system your using so we can't launch the website.")
  end
end
else
  app.alert("This toolbar requires Aseprite version 1.2.16.3 or newer (You should update! You're missing out on some great features!)")
end