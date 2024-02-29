local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - The best script in 2024 :V")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Relics draw")
local T3 = wndw:Tab("Redeem codes")

local relic = {}
local codes = {"1klike","StarRail","Release"}
local workspace = game:GetService("Workspace")
local user = {
      uid = game.Players.LocalPlayer.UserId,
      self = game:GetService("Players").LocalPlayer
}

local function child(str,funct)
for i,v in pairs(str:GetChildren()) do
  funct(v)
end
end

lib:AddTable(game:GetService("ReplicatedStorage")["Models"]["Eggs"],relic)

T1:Toggle("Auto click & damage",false,function(value)
    _G.dmg = value
    while wait() do
      if _G.dmg == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Fight"]["ClickDamage"]:FireServer()
    end
end)

T1:Toggle("Fast pet attacks",false,function(value)
    _G.pa = value
    while wait() do
      if _G.pa == false then break end
      child(workspace["UserPets"][user.uid],function(v)
          game:GetService("ReplicatedStorage")["Events"]["Hero"]["HeroAttack"]:FireServer(workspace["UserPets"][user.uid][v.Name])
      end)
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
    _G.reb = value
    while wait() do
      if _G.reb == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Stats"]["RebirthUp"]:FireServer()
    end
end)

T2:Dropdown("Select relic ID",relic,function(value)
    _G.relid = value
end)

T2:Toggle("Auto draw relic",false,function(value)
    _G.drawrel = value
    while wait() do
      if _G.drawrel == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Pets"]["Re_Draw"]:FireServer("Hatch",_G.relid,{})
    end
end)

T2:Toggle("Auto equip best relics",false,function(value)
    _G.ebrel = value
    while wait() do
      if _G.ebrel == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Pets"]["Re_EquipBest"]:FireServer()
    end
end)

T3:Button("Redeem all codes",function()
    for array = 1,#codes do
      game:GetService("ReplicatedStorage")["Events"]["Stats"]["RedeemCode"]:FireServer(codes[array])
    end
end)
