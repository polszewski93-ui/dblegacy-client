dungeonButton = nil
dungeonWindow = nil

function init()
  dungeonButton = modules.client_topmenu.addRightGameToggleButton('dungeonButton', tr('Dungeons'), '/images/topbuttons/dungeon', closing)
  dungeonButton:setOn(false)

  dungeonWindow = g_ui.displayUI('dungeon')
  dungeonWindow:setVisible(false)
	
  allTabs = dungeonWindow:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(dungeonWindow:getChildById('optionsTabContent'))

  connect(g_game, {
    onGameEnd = onMiniWindowClose
  })
end

function terminate()
  dungeonButton:destroy()
  dungeonWindow:destroy()
end

function closing()
  if dungeonButton:isOn() then
    dungeonWindow:setVisible(false)
    dungeonButton:setOn(false)
  else
    dungeonWindow:setVisible(true)
    dungeonButton:setOn(true)
  end
end

function onMiniWindowClose()
  dungeonButton:setOn(false)
end

function showListButtonClicked(buttonId)
  local listFrame = dungeonWindow:getChildById('listFrame' .. buttonId)
  local scrollBar = dungeonWindow:getChildById('ScrollBar' .. buttonId)
  local isOpen = listFrame:isVisible()

  closeAllListFrames()

  listFrame:setVisible(not isOpen)
  scrollBar:setVisible(not isOpen)
end

function closeAllListFrames()
  for i = 1, 4 do
    local listFrame = dungeonWindow:getChildById('listFrame' .. i)
    local scrollBar = dungeonWindow:getChildById('ScrollBar' .. i)
    listFrame:setVisible(false)
    scrollBar:setVisible(false)
  end
end

function showListButton1Clicked()
  showListButtonClicked(1)
end

function showListButton2Clicked()
  showListButtonClicked(2)
end

function showListButton3Clicked()
  showListButtonClicked(3)
end

function showListButton4Clicked()
  showListButtonClicked(4)
end


--Dungeon 50 - 100
function lvl50()
local protocolGame = g_game.getProtocolGame()
  if dungeonButton:isOn() then
  if protocolGame then
      protocolGame:sendExtendedOpcode(50)
    end
  else
    dungeonWindow:setVisible(true)
    dungeonButton:setOn(true)
  end
end
