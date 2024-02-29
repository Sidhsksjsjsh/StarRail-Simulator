local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - The best script in 2024 :V")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Relics draw")
local T4 = wndw:Tab("Character & Hero")
local T5 = wndw:Tab("Slots")
local T6 = wndw:Tab("Potions")
local T7 = wndw:Tab("Boss Server")
local T3 = wndw:Tab("Redeem codes")

local relic = {}
local role = {}
local codes = {"1klike","StarRail","Release"}
local workspace = game:GetService("Workspace")
local potion = {"Gacha001","Gacha002","Gacha003","Gacha004","Gacha005"}
local quest = {"BossQuest001","BossQuest002","BossQuest003","BossQuest004","BossQuest005"}
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
lib:AddTable(workspace["Roles"],role)

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

T1:Button("Finish obby",function()
    for array = 1,58 do
      game:GetService("ReplicatedStorage")["Events"]["Obby"]["UptoPass"]:FireServer(workspace["Obby"]["Spawn"][array])
    end
end)

T1:Toggle("Ride vehicle",false,function(value)
      game:GetService("ReplicatedStorage")["Events"]["Cars"]["RideCar"]:InvokeServer("Car001",value)
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

T4:Dropdown("Select character ID",role,function(value)
    _G.roleid = value
end)

T4:Button("Transform",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["ChangeCharacter"]:FireServer(_G.roleid)
end)

T4:Button("Level up",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["LevelHero"]:InvokeServer(_G.roleid)
end)

T4:Button("Enhance hero",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["EnhanceHero"]:InvokeServer(_G.roleid,"1")
end)

T5:Dropdown("Select slots ID",{"Slot001","Slot002","Slot003","Slot004","Slot005"},function(value)
    _G.slotid = value
end)

T5:Toggle("Auto claim slots [ GACOR 🔥 ]",false,function(value)
    _G.slotking = value
    while wait() do
      if _G.slotking == false then break end
      game:GetService("ReplicatedStorage")["Events"]["Stats"]["ClaimSlot"]:InvokeServer(_G.slotid)
    end
end)

T6:Button("Claim all potions",function()
      for array = 1,#potion do
            game:GetService("ReplicatedStorage")["Events"]["Stats"]["ClaimGacha"]:FireServer(potion[array])
      end
end)

T7:Toggle("Auto heal",false,function(value)
    _G.bossq = value
    while wait() do
      if _G.bossq == false then break end
      game:GetService("ReplicatedStorage")["Events"]["ServerBoss"]["HealthUp"]:FireServer()
    end
end)

T7:Button("Claim all boss quests",function()
      for array = 1,#quest do
            game:GetService("ReplicatedStorage")["Events"]["ServerBoss"]["ClaimReward"]:FireServer(quest[array])
      end
end)
