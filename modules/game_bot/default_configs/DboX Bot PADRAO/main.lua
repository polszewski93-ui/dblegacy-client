-- main tab
VERSION = "1.0"

UI.Label("Config version: " .. VERSION)

UI.Separator()
cpvp = macro(200, "Combo",  function()
if g_game.isAttacking() then
say(storage.ComboText)
say(storage.Combo1Text)
say(storage.Combo2Text)
say(storage.Combo3Text)
say(storage.Combo4Text)
say(storage.Combo5Text)
end

end)
addTextEdit("ComboText", storage.ComboText or "magia 1", function(widget, text) 
storage.ComboText = text
end)
addTextEdit("Combo1Text", storage.Combo1Text or "magia 1", function(widget, text) storage.Combo1Text = text
end)
addTextEdit("Combo2Text", storage.Combo2Text or "magia 2", function(widget, text) storage.Combo2Text = text
end)
addTextEdit("Combo3Text", storage.Combo3Text or "magia 3", function(widget, text) storage.Combo3Text = text
end)
addTextEdit("Combo4Text", storage.Combo4Text or "magia 4", function(widget, text) storage.Combo4Text = text
end)
addTextEdit("Combo5Text", storage.Combo5Text or "magia 5", function(widget, text) storage.Combo5Text = text
end)
test1 = addIcon("2", {item =2137, text = "C.UP", hotkey = ""}, cpvp)
test1:breakAnchors()
test1:move(200, 75)


UI.Separator()

UI.Button("Discord", function()
  g_platform.openUrl("https://discord.gg/dkTpNyhX9a")
end)

UI.Button("Site", function()
  g_platform.openUrl("https://dragonballx.online/")
end)

