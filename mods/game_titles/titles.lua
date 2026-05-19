local playerTitles = {
  ["Isac"] = {title = "DEV", color = "#FFFFFF"},
}

local titleFont = "verdana-11px-rounded"

function init()
  connect(Creature, {
      onAppear = updateTitle,
  })  
end

function terminate()
  disconnect(Creature, {
      onAppear = updateTitle,
  })  
end

function setMonsterTitle(creature, prefix, title, titleColor)
  local name = creature:getName()
  if creature:isMonster() and string.sub(name, 1, #prefix) == prefix then
      local restOfName = string.sub(name, #prefix + 1)
      creature:setTitle(title, titleFont, titleColor)
      creature:setName(restOfName)
  end
end

function updateTitle(creature)
  local name = creature:getName()
  if creature:isPlayer() and playerTitles[name] then
      creature:setTitle(playerTitles[name].title, titleFont, playerTitles[name].color)
  end

  setMonsterTitle(creature, "Quest", "Quest", "#5b2987")
  setMonsterTitle(creature, "BOSS", "BOSS", "#FF0000")
end
