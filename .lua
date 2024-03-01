local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - The best script in 2024 :V")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Relics draw")
local T4 = wndw:Tab("Character & Hero")
local T5 = wndw:Tab("Slots")
local T6 = wndw:Tab("Potions")
local T7 = wndw:Tab("Boss Server")
local T3 = wndw:Tab("Redeem codes")
local T8 = wndw:Tab("Teleport")
local T9 = wndw:Tab("Golden & Rainbow")
local T10 = wndw:Tab("Config")

local relic = {}
local role = {}
local codes = {"1klike","StarRail","Release"}
local workspace = game:GetService("Workspace")
local potion = {"Gacha001","Gacha002","Gacha003","Gacha004","Gacha005"}
local quest = {"BossQuest001","BossQuest002","BossQuest003","BossQuest004","BossQuest005"}
local entID = {}
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

T2:Dropdown("Select hatch",{"X1","X3"},function(value)
    _G.htcid = value
end)

T2:Toggle("Auto draw relic",false,function(value)
    _G.drawrel = value
    while wait() do
      if _G.drawrel == false then break end
            if _G.htcid == "X1" then
                  game:GetService("ReplicatedStorage")["Events"]["Pets"]["Re_Draw"]:FireServer("Hatch",_G.relid,{})
            elseif _G.htcid == "X3" then
                  game:GetService("ReplicatedStorage")["Events"]["Pets"]["Re_Draw"]:FireServer("TripleHatch",_G.relid,{})
            end
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

T4:Dropdown("Select skills to enchane",{"1","2","3"},function(value)
    _G.slid = value
end)

T4:Button("Transform",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["ChangeCharacter"]:FireServer(_G.roleid)
end)

T4:Button("Level up hero",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["LevelHero"]:InvokeServer(_G.roleid)
end)

T4:Button("Enchane hero",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["EnhanceHero"]:InvokeServer(_G.roleid,_G.slid)
end)

T4:Button("Buy hero",function()
      game:GetService("ReplicatedStorage")["Events"]["Hero"]["ClaimHero"]:FireServer(_G.roleid)
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

T8:Dropdown("Select world ID",{"World001","World002","World003","World004","World005"},function(value)
    _G.wid = value
end)

T8:Button("Teleport",function()
      game:GetService("ReplicatedStorage")["Events"]["World"]["Rf_Teleport"]:InvokeServer(_G.wid)
end)

T9:Toggle("Instant Gold [ BETA ]",false,function(value)
      _G.insGold = value
end)

T9:Toggle("Instant Rainbow [ BETA ]",false,function(value)
      _G.insRb = value
end)

T10:Slider("Radius [ MAX = 500 ]",user.Radius.Value,500,16,function(value)
      _G.rad = value
end)

T1:Toggle("TP to enemies [ Nearest ]",false,function(value)
    _G.tpchina = value
    while wait() do
      if _G.tpchina == false then break end
      user.Character.HumanoidRootPart.CFrame = workspace["Enemies"][user.ServerTarget].Position * CFrame.new(0,0,1.5)
    end
end)

lib:HookCalled(function(self,args)
     if args[1] == "Golden" and _G.insGold == true then
            args[2][2] = args[2][1]
            args[2][3] = args[2][1]
            args[2][4] = args[2][1]
            return self.FireServer(self,unpack(args))
      elseif args[1] == "Rainbow" and _G.insRb == true then
            args[2][2] = args[2][1]
            args[2][3] = args[2][1]
            args[2][4] = args[2][1]
            return self.FireServer(self,unpack(args))
      end
end)
