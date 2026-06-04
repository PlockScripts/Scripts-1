local gal1 = b[1]
local LocalizationService = game:GetService("LocalizationService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local CurrentCamera = workspace.CurrentCamera
local Stepped = game:GetService("RunService").Stepped
local LocalPlayer = game:GetService("Players").LocalPlayer
local Data = LocalPlayer:WaitForChild("Data")
Data:WaitForChild("LastSpawnPoint")
local SpawnPoint = Data:WaitForChild("SpawnPoint")
local Fragments = Data:WaitForChild("Fragments")
local Subclass = Data:WaitForChild("Subclass")
local Level = Data:WaitForChild("Level")
local Beli = Data:WaitForChild("Beli")
local Map = workspace:WaitForChild("Map")
local NPCs = workspace:WaitForChild("NPCs")
local Boats = workspace:WaitForChild("Boats")
local SeaBeasts = workspace:WaitForChild("SeaBeasts")
local Enemies = workspace:WaitForChild("Enemies")
local Characters = workspace:WaitForChild("Characters")
local _WorldOrigin = workspace:WaitForChild("_WorldOrigin")
local Locations = _WorldOrigin:WaitForChild("Locations")
local PlayerSpawns = _WorldOrigin:WaitForChild("PlayerSpawns")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Modules = ReplicatedStorage:WaitForChild("Modules")
local Net = Modules:WaitForChild("Net")
local gal32 = (getgenv or (getrenv or getfenv))()
local HttpGet = game.HttpGet
local gal33 = {}
local gal37 = gal32.rz_Settings or {
    AutoBuso = true,
    BringMobs = true,
    BringDistance = 250,
    FarmMode = "Up",
    FarmTool = "Melee",
    FarmDistance = 15,
    FarmPos = Vector3.new(0, 15, 0),
    SeaSkills = {},
    boatSelected = {},
    fishSelected = {}
}
local gal_l37 = gal32.rz_EnabledOptions
if gal_l37 then
    local PlayerGui = LocalPlayer.PlayerGui
    local Team = LocalPlayer["Team"]
    if not Team and not Team:FindFirstChild("Main") then
        local function gal_l43(gal_p1, ...)
            local gal_l47 = PlayerGui["Main (minimal)"]
            local gal_l48 = getconnections(gal_l47:WaitForChild("ChooseTeam").Container[gal_p1:find("pirate") and "Pirates" or "Marines"].Frame.TextButton.Activated)
            for gal_l49 = 1, #gal_l48 do
                gal_l48[gal_l49].Function() 
            end 
        end
        local gal_l53 = not LocalPlayer.Team
        local gal_l54 = not ("Team"):FindFirstChild("Main")
        while not gal_l53 do
            while gal_l53 do
                if tick() - gal_l1806 >= .5 then
                    pcall(function(gal_p1_2, ...)
                        local gal_l1809 = PlayerGui["Main (minimal)"]
                        gal_l1782 = getconnections(gal_l1809:WaitForChild("ChooseTeam").Container[gal_p1_2:find("pirate") and "Pirates" or "Marines"].Frame.TextButton.Activated)
                        for gal_l1811 = 1, #gal_l1782 do
                            gal_l1782[gal_l1803].Function() 
                        end
                        return 
                    end, string.lower(b[2].JoinTeam or "Pirates"))
                    tick()
                    task.wait()
                end 
            end
            gal32.rz_Functions = gal32.rz_Functions
            gal32.rz_Settings = gal37
            gal32.rz_EnabledOptions = gal_l37
            gal32.rz_FarmFunctions = gal32.rz_FarmFunctions
            gal32.rz_connections = rz_connections
            local function gal_l1816(gal_p1_179, ...)
                gal48[gal_p1_179](gal48, ...)
                print(gal_p1_179, tick() - tick()) 
            end
            for gal_l1815, gal_l1816 in ipairs(gal_l1816) do
                gal_l1816:Disconnect() 
            end
            table.clear(rz_connections)
            local gal44 = {
                Marines = function(...)
                    gal42.FireRemote("SetTeam", "Marines")
                    return 
                end,
                Pirates = function(...)
                    gal42.FireRemote("SetTeam", "Pirates")
                    return 
                end
            }
            local gal45 = {}
            local function gal_l1816(gal_p1_3, ...)
                local gal46 = CollectionService:GetTagged(gal_p1_3)
                local gal_l59 = CollectionService:GetInstanceAddedSignal(gal_p1_3)
                table.insert(rz_connections, gal_l59:Connect(function(gal_p1_4, ...)
                    table.insert(gal46, gal_p1_4)
                    return 
                end))
                return gal46 
            end
            gal45.Chests = gal_l1816("_ChestTagged")
            gal45.Berries = gal_l1816("BerryBush")
            local gal47 = {
                AllCodes = function(...)
                    local gal_l61 = string.split
                    local gal_l62 = gal_l61(string.gsub(gal1.get("{Utils}BloxFruits/Codes.txt"), "\n", ""), "~")
                    for gal_l63 = 1, #gal_l62 do
                        local Redeem = Remotes.Redeem
                        Redeem:InvokeServer(gal_l62[gal_l63]) 
                    end
                    return 
                end,
                GetTimer = function(gal_p1_5, ...)
                    local gal_l67 = math.floor(gal_p1_5 / 60)
                    local gal_l68 = gal_l67 - math.floor(gal_p1_5 / 60 / 60) * 60
                    local gal_l69 = gal_l68 < 10 and "0" .. tostring(gal_l68)
                    if gal_l69 then
                        local gal_l73 = math.floor(gal_p1_5) - gal_l67 * 60 < 10
                        if gal_l73 then
                            return gal_l69 .. ":" .. gal_l75
                        else
                        end
                    else
                    end 
                end
            }
            local gal48 = {}
            gal48.Managers = {}
            local Managers = gal48.Managers
            Managers.TweenManager = function(...)
                local gal50 = {
                    QueueNumber = 1,
                    InDebounce = false
                }
                local gal51 = gal42.RunFunctions.TweenModule()
                local gal52 = ({
                    {
                        ["Sky Island 1"] = Vector3.new(-4652, 873, -1754),
                        ["Sky Island 2"] = Vector3.new(-7895, 5547, -380),
                        ["Under Water Island"] = Vector3.new(61164, 15, 1820),
                        ["Under Water Island Entrace"] = Vector3.new(3865, 20, -1926)
                    },
                    {
                        ["Flamingo Mansion"] = Vector3.new(-317, 331, 597),
                        ["Flamingo Room"] = Vector3.new(2283, 15, 867),
                        ["Cursed Ship"] = Vector3.new(923, 125, 32853),
                        ["Zombie Island"] = Vector3.new(-6509, 83, -133)
                    },
                    {
                        Mansion = Vector3.new(-12464, 376, -7566),
                        ["Hydra Island"] = Vector3.new(5651, 1015, -350),
                        ["Temple of Time"] = Vector3.new(28286, 14897, 103),
                        ["Sea Castle"] = Vector3.new(-5090, 319, -3146),
                        ["Great Tree"] = Vector3.new(2953, 2282, -7217)
                    }
                })[gal42.GameData.Sea]
                local gal53 = gal42.Inventory.Unlocked
                local gal54 = gal42.GameData.Sea
                local gal55 = gal42.IsAlive
                local gal56 = gal42.FireRemote
                local gal57 = gal42.Tween
                gal58 = 0
                gal59 = 0
                local gal63 = CFrame.new(28610, 14897, 105)
                local gal64 = Vector3.yAxis * -25.2
                local function gal_l112(...)
                    gal52["Spawn Point"] = nil
                    local gal_l83 = PlayerSpawns[LocalPlayer.Team.Name][SpawnPoint.Value]
                    gal52["Spawn Point"] = gal_l83:GetPivot().Position
                    return 
                end
                local function gal67(...)
                    gal50.MoveCharacter(gal63, nil, true)
                    gal50:InteractWithNpc(gal63, "RaceV4Progress", "TeleportBack")
                    return 
                end
                local function gal68(...)
                    gal50.QueueNumber = gal50.QueueNumber + 1
                    gal50.InDebounce = false
                    return 
                end
                gal50.GetLastPosition = function(gal_p1_8, ...)
                    return gal61 
                end
                gal50.TweenToCFrameQueue = function(gal_p1_9, gal_p2_9, gal_p3_9, ...)
                    if not gal55(LocalPlayer.Character) then
                        return false
                    end
                    if gal_p1_9.InDebounce and gal_p2_9[gal_p1_9.QueueNumber] then
                        return gal43(gal_p2_9[gal_p1_9.QueueNumber] + gal64)
                    end
                    if #gal_p2_9 == 1 then
                        gal_p1_9.MoveCharacter(gal_p2_9[1], gal_p3_9)
                    else
                        if #gal_p2_9 > 1 then
                            if gal_p1_9.QueueNumber > #gal_p2_9 then
                                gal_p1_9.QueueNumber = 1
                            end
                            local PrimaryPart = LocalPlayer.Character.PrimaryPart
                            local gal_l89 = gal_p2_9[gal_p1_9.QueueNumber]
                            if PrimaryPart then
                                gal_p1_9.InDebounce = true
                                task.delay(.8, U[gal_l136])
                            else
                                gal_p1_9.MoveCharacter(gal_l89, gal_p3_9)
                            end
                        end
                        return
                    end 
                end
                gal50.InteractWithNpc = function(gal_p1_10, gal_p2_10, ...)
                    if LocalPlayer:DistanceFromCharacter(gal_p2_10.Position) < 5 then
                        return gal56(select(0, ...))
                    end
                    return 
                end
                gal50.MoveCharacter = function(gal_p1_11, gal_p2_11, gal_p3_11, gal_p4_11, ...)
                    if not gal55(LocalPlayer.Character) or not LocalPlayer.Character.PrimaryPart then
                        return false
                    end
                    if tick() - gal59 <= 1 and gal60 == gal_p1_11 then
                        return false
                    end
                    local Character = LocalPlayer.Character
                    local Humanoid = Character.Humanoid
                    local PrimaryPart = Character.PrimaryPart
                    if Humanoid.Sit then
                        Humanoid.Sit = false
                        return
                    end
                    local Anchored = PrimaryPart.Anchored
                    if Anchored then
                        gal51:stopTween(PrimaryPart)
                        return
                    end
                    local gal59 = tick()
                    gal32.OnFarm = true
                    local gal_l110 = gal37.TweenSpeed or 220
                    local Position = gal_p1_11.Position
                    local Magnitude = (PrimaryPart.Position - Position).Magnitude
                    local gal_l115 = Magnitude < (gal_p2_11 and 10 or 120)
                    if gal_l115 then
                        PrimaryPart.CFrame = gal_p1_11
                        return gal51:stopTween(PrimaryPart)
                    end
                    local TempSafeZone = Character:FindFirstChild("TempSafeZone")
                    if TempSafeZone then
                        return gal51:stopTween(PrimaryPart)
                    end
                    local gal_l120 = {
                        gal66(Position)
                    }
                    local gal_l121 = gal66(Position)
                    local gal_l122 = gal_l120[2]
                    if gal_l121 then
                        if gal_l122 == "Great Tree" then
                            return U[gal_l931]()
                        end
                        if tick() - gal58 >= 6 or gal62 ~= gal_l122 then
                            gal51:stopTween(Character.PrimaryPart)
                            task.wait(.2)
                            local gal58 = tick()
                            return gal56("requestEntrance", gal_l130)
                        end
                    end
                    if gal_p2_11 then
                        return gal51.new(PrimaryPart, Magnitude / gal_p2_11, "CFrame", gal_p1_11)
                    end
                    if not gal_p4_11 then
                        local gal_l132 = PrimaryPart.Position
                        local gal_l133 = CFrame.new(gal_l132.X, Position.Y, gal_l132.Z)
                        if (gal_l132 - gal_l133.Position).Magnitude > 75 then
                            gal51:stopTween(PrimaryPart)
                            task.wait(.1)
                            local gal_l137 = CFrame.new(gal_l132.X, Position.Y, gal_l132.Z)
                            PrimaryPart.CFrame = gal_l137
                            task.wait(.5)
                        end
                    end
                    if Magnitude < 380 then
                        gal51.new(PrimaryPart, Magnitude / (gal_l110 * 2), "CFrame", gal_p1_11)
                    else
                        gal51.new(PrimaryPart, Magnitude / gal_l110, "CFrame", gal_p1_11)
                    end
                    return 
                end
                local gal_l139 = gal57
                local gal_l140 = gal_l139:GetPropertyChangedSignal("Parent")
                table.insert(rz_connections, gal_l140:Connect(function(...)
                    return false 
                end))
                local gal43 = gal50.MoveCharacter
                return gal50 
            end
            Managers.QuestManager = function(...)
                local gal69 = {
                    QuestList = {},
                    EnemyList = {},
                    QuestPos = {},
                    Sea = gal42.GameData.Sea,
                    takeQuestDebounce = false,
                    _Position = CFrame.new(0, 0, 2.5)
                }
                local gal_l193 = LocalPlayer.PlayerGui
                local gal70 = gal_l193:WaitForChild("Main").Quest
                local gal71 = gal70.Container.QuestTitle.Title
                local gal_l194 = ReplicatedStorage
                local gal_l195 = ReplicatedStorage
                local gal72 = {
                    GuideModule = gal_l194:WaitForChild("GuideModule"),
                    Quests = gal_l195:WaitForChild("Quests")
                }
                local gal74 = gal_l184("GuideModule")
                local gal75 = gal42.EnemyLocations
                local gal_l196 = gal42.EnemySpawned
                local gal76 = gal42.IsBoss
                task.spawn(function(...)
                    if gal74.Data.IsFakeData then
                        return nil
                    end
                    local Data = gal74.Data
                    local NPCList = Data.NPCList
                    NPCList = Data[1]
                    for gal_l189, gal_l184 in pairs(NPCList) do
                        gal69.QuestPos[gal_l184.NPCName] = CFrame.new(gal_l184.Position) 
                    end
                    setmetatable(gal74.Data.NPCList, {
                        __newindex = function(gal_p1_14, gal_p2_14, gal_p3_14, ...)
                            U[262].QuestPos[gal_p3_14.NPCName] = CFrame.new(gal_p3_14.Position)
                            return rawset(gal_p1_14, gal_p2_14, gal_p3_14) 
                        end
                    })
                    return 
                end)
                task.spawn(gal42.RunFunctions.Quests, gal69, gal_l184("Quests"), gal_l158)
                gal69.GetQuest = function(gal_p1_15, ...)
                    local gal_l144 = gal_p1_15.oldLevel == Level.Value
                    if gal_l144 and gal_p1_15.CurrentQuest then
                        local gal_l145 = gal_p1_15.oldBoss
                        if gal_l145 then
                            return gal_p1_15.oldBossQuest
                        end
                        return gal_p1_15.CurrentQuest
                    end
                    gal_p1_15.oldLevel = Level.Value
                    local Sea = gal_p1_15.Sea
                    local gal_l148 = math.clamp
                    local gal_l150 = Sea == 1
                    local gal_l152 = gal_l148(Level.Value, 0, gal_l150 and 700 or (Sea == 2 and 1500 or Level.Value))
                    for gal_l157, gal_l158 in nil, ipairs() do
                        local Level = gal_l158.Enemy.Level
                        while gal76(gal_l158.Enemy.Name[1]) do
                            local gal_l164 = Level <= gal_l152
                            while not gal_l164 do
                                while not gal_l164 do end 
                            end 
                        end
                        gal_p1_15.oldBoss = gal_l132
                        gal_p1_15.oldBossQuest = gal_l931
                        gal_p1_15.CurrentQuest = gal_l67
                        return nil 
                    end
                    gal_p1_15.oldBoss = nil
                    gal_p1_15.oldBossQuest = nil
                    gal_p1_15.CurrentQuest = nil
                    return nil 
                end
                gal69.GetQuestPosition = function(gal_p1_16, gal_p2_16, ...)
                    if gal74["Data"]["IsFakeData"] then
                        local gal_l173 = gal74.Data.NPCs[gal_p2_16]
                        local gal_l174 = gal_l173 and nil
                        return gal_l174
                    end
                    return gal_p1_16.QuestPos[gal74.Data.LastClosestNPC] 
                end
                gal69.VerifyQuest = function(gal_p1_17, gal_p2_17, ...)
                    if not gal70.Visible then
                        return false
                    end
                    local gal_l179 = string.gsub(gal71.Text, "-", "")
                    local gal_l180 = gal_l179:lower()
                    if type(gal_p2_17) == "string" then
                        local gal_l181 = string.gsub(gal_p2_17, "-", "")
                        return string.find(gal_l180, gal_l181:lower())
                    end
                    for gal_l184, gal_l185 in ipairs(gal_p2_17) do
                        repeat
                            string.gsub(gal_l185, "-", "")
                        until string.find(gal_l180, gal_l158:lower())
                        return gal_l185 
                    end
                    return 
                end
                gal69.StartQuest = function(gal_p1_18, gal_p2_18, gal_p3_18, gal_p4_18, ...)
                    if gal_p4_18 then
                        local gal_l192 = LocalPlayer:DistanceFromCharacter(gal_p4_18.Position) >= 5
                    end
                    if gal_p4_18 then
                        gal43(gal_p4_18 * gal_p1_18._Position)
                        return "Teleporting to NPC: " .. gal_p2_18
                    end
                    if gal_p1_18.takeQuestDebounce then
                        if not gal_p1_18.Debounce or (tick() - gal_p1_18.Debounce >= 75 or gal_p1_18.InDebounceQuest ~= gal_p3_18 .. gal_p2_18) then
                            gal37.RunningMethod = "Getting Quest: " .. gal_p2_18
                            task.wait(.5)
                            gal42.FireRemote("StartQuest", gal_p2_18, gal_p3_18)
                            gal_p1_18.InDebounceQuest = gal_p3_18 .. gal_p2_18
                            gal_p1_18.Debounce = tick()
                            return gal37.RunningMethod, task.wait(.5)
                        end
                        return "Quest Debounce: " .. gal47.GetTimer(75 - (tick() - gal_p1_18.Debounce))
                    end
                    task.wait(.5)
                    gal42.FireRemote("StartQuest", gal_p2_18, gal_p3_18)
                    return "Getting Quest: " .. gal_p2_18, task.wait(.5) 
                end
                return gal69 
            end
            Managers.FarmManager = function(...)
                local gal77 = {
                    CanFarm = {},
                    EnemyLocation = {},
                    ClickPosition = Vector2.new(),
                    axisDebounce = 0
                }
                local gal78 = gal42.IsAlive
                local gal79 = gal42.EnemySpawned
                local gal80 = gal42.EnemyLocations
                local gal81 = gal42.EquipTool
                gal82 = 0
                gal77.Materials = ({
                    {
                        "Leather + Scrap Metal",
                        "Magma Ore",
                        "Fish Tail",
                        "Angel Wings"
                    },
                    {
                        "Leather + Scrap Metal",
                        "Magma Ore",
                        "Mystic Droplet",
                        "Radiactive Material",
                        "Vampire Fang"
                    },
                    {
                        "Leather + Scrap Metal",
                        "Fish Tail",
                        "Gunpowder",
                        "Mini Tusk",
                        "Conjured Cocoa",
                        "Dragon Scale"
                    }
                })[gal42.GameData.Sea]
                gal77.Enemies = {
                    Elites = {
                        "Deandre",
                        "Diablo",
                        "Urban"
                    },
                    Bones = {
                        "Reborn Skeleton",
                        "Living Zombie",
                        "Demonic Soul",
                        "Posessed Mummy"
                    },
                    Katakuri = {
                        "Head Baker",
                        "Baking Staff",
                        "Cake Guard",
                        "Cookie Crafter"
                    },
                    Ectoplasm = {
                        "Ship Deckhand",
                        "Ship Engineer",
                        "Ship Steward",
                        "Ship Officer"
                    }
                }
                gal77.FarmModes = {
                    Star = function(gal_p1_19, gal_p2_19, ...)
                        local gal_l198 = gal_p2_19.CFrame + gal_p1_19:GetNextAxis()
                        if LocalPlayer:DistanceFromCharacter(gal_l198.Position) >= 5 then
                            gal43(gal_l198)
                        end
                        return 
                    end,
                    Orbit = function(gal_p1_20, gal_p2_20, gal_p3_20, ...)
                        task.wait()
                        while gal_p3_20 do
                            local gal_l208 = gal_p3_20 == "Orbit"
                            while not gal_l208 do
                                while gal_l208 do
                                    if tick() - gal82 >= 1 then
                                        gal81()
                                        EnableBuso()
                                        local FarmDistance = gal37.FarmDistance
                                        local gal_l210 = 0 + 3.5 * task.wait()
                                        gal43(CFrame.new(math.cos(gal_l210) * FarmDistance, 8, math.sin(gal_l210) * FarmDistance) + gal_p2_20.Position)
                                        task.wait(gal37.SmoothMode and .1 or 0)
                                    end 
                                end
                                return 
                            end
                            local gal_l212 = gal_l37[gal_l210]
                            while not gal_l212 do end
                            while not gal_p2_20 do end
                            gal78(gal_p2_20.Parent) 
                        end 
                    end,
                    Up = function(gal_p1_21, gal_p2_21, ...)
                        local gal_l219 = gal_p2_21.CFrame + gal37.FarmPos
                        if LocalPlayer:DistanceFromCharacter(gal_l219.Position) >= 5 then
                            gal43(gal_l219)
                        end
                        return 
                    end
                }
                local gal83 = {}
                local gal84 = {
                    ["Angel Wings"] = {
                        CFrame.new(-7742, 5634, -1564)
                    },
                    ["Leather + Scrap Metal"] = {
                        CFrame.new(-1257, 54, 4091),
                        CFrame.new(-1100, 77, 1152),
                        CFrame.new(-364, 116, 5692)
                    },
                    ["Magma Ore"] = {
                        CFrame.new(-5408, 11, 8456),
                        CFrame.new(-5241, 50, -4713)
                    },
                    ["Fish Tail"] = {
                        CFrame.new(60931, 19, 1574),
                        false,
                        CFrame.new(-10679, 398, -8975)
                    },
                    ["Mystic Droplet"] = {
                        false,
                        CFrame.new(-3350, 282, -10527)
                    },
                    ["Radiactive Material"] = {
                        false,
                        CFrame.new(-73, 149, -112)
                    },
                    ["Vampire Fang"] = {
                        false,
                        CFrame.new(-6030, 6, -1281)
                    },
                    Gunpowder = {
                        false,
                        false,
                        CFrame.new(-394, 135, 5981)
                    },
                    ["Mini Tusk"] = {
                        false,
                        false,
                        CFrame.new(-13510, 584, -6986)
                    },
                    ["Conjured Cocoa"] = {
                        false,
                        false,
                        CFrame.new(400, 81, -12257)
                    },
                    ["Dragon Scale"] = {
                        false,
                        false,
                        CFrame.new(6689, 378, 331)
                    }
                }
                local gal_l306 = {
                    {
                        "Royal Soldier",
                        "Royal Squad"
                    },
                    {
                        true,
                        false,
                        false
                    }
                }
                local gal85 = {
                    ["Leather + Scrap Metal"] = {
                        {
                            "Pirate",
                            "Brute",
                            "Scrap Metal",
                            "Pirate Millionaire"
                        },
                        {
                            true,
                            true,
                            true
                        }
                    },
                    ["Angel Wings"] = gal_l306,
                    ["Magma Ore"] = {
                        {
                            "Military Soldier",
                            "Lava Pirate"
                        },
                        {
                            true,
                            true,
                            false
                        }
                    },
                    ["Fish Tail"] = {
                        {
                            "Fishman Warrior",
                            "Fishman Captain",
                            "Fishman Raider"
                        },
                        {
                            true,
                            false,
                            true
                        }
                    },
                    ["Conjured Cocoa"] = {
                        {
                            "Cocoa Warrior",
                            "Chocolate Bar Battler"
                        },
                        {
                            false,
                            false,
                            true
                        }
                    },
                    ["Mystic Droplet"] = {
                        {
                            "Water Fighter"
                        },
                        {
                            false,
                            true,
                            false
                        }
                    },
                    ["Radiactive Material"] = {
                        {
                            "Factory Staff"
                        },
                        {
                            false,
                            true,
                            false
                        }
                    },
                    ["Vampire Fang"] = {
                        {
                            "Vampire"
                        },
                        {
                            false,
                            true,
                            false
                        }
                    },
                    Gunpowder = {
                        {
                            "Pistol Billionaire"
                        },
                        {
                            false,
                            false,
                            true
                        }
                    },
                    ["Mini Tusk"] = {
                        {
                            "Mythological Pirate"
                        },
                        {
                            false,
                            false,
                            true
                        }
                    },
                    ["Dragon Scale"] = {
                        {
                            "Dragon Crew Archer"
                        },
                        {
                            false,
                            false,
                            true
                        }
                    }
                }
                gal77.ToolDebounce = function(...)
                    local gal82 = tick()
                    return 
                end
                gal77.GotoTargetCFrame = function(gal_p1_22, ...)
                    U["Team"](gal_p1_22)
                    EnableBuso()
                    gal81()
                    return 
                end
                gal77.GetNextAxis = function(gal_p1_23, ...)
                    local gal_l222 = tick() - gal_p1_23.axisDebounce <= .4
                    if gal_l222 then
                        return gal_p1_23.nextAxis
                    end
                    local gal_l225 = Vector3[math.random() <= .5 and "xAxis" or "zAxis"]
                    local gal_l228 = gal_l225 * (math.random() <= .5 and U[gal_l1088].FarmDistance or -U[gal_l1088].FarmDistance) + Vector3.yAxis * 8
                    gal_p1_23.axisDebounce = tick()
                    gal_p1_23.nextAxis = gal_l228
                    return gal_l228 
                end
                gal77.Mastery = function(gal_p1_24, gal_p2_24, gal_p3_24, ...)
                    local gal_l235 = Enemies[1]
                    for gal_l236, gal_l237 in ipairs(gal_l235:GetChildren()) do
                        while not gal_l237.PrimaryPart do end
                        local Humanoid = gal_l237:FindFirstChildOfClass("Humanoid")
                        while not Humanoid do
                            while not gal_l217 do end 
                        end
                        local gal_l244 = Humanoid.Health > 0
                        while not gal_l244 do end 
                    end
                    local gal_l249 = gal_l243.CFrame + gal37.FarmPos
                    local gal_l250 = gal_l242.Health / gal_l242.MaxHealth * 100
                    gal81(gal_l250 <= gal37.mHealth and gal37.mTool or "Melee", true)
                    gal42:BringEnemies(gal_l243.Parent)
                    EnableBuso()
                    if LocalPlayer:DistanceFromCharacter(gal_l249.Position) >= 2.5 then
                        gal43(gal_l249)
                    end
                    local gal_l255 = gal37.mHealth
                    if gal_l250 <= gal_l255 and gal_l255:DistanceFromCharacter(gal_l249.Position) < 5 then
                        local Hooking = gal42.Hooking
                        Hooking:SetTarget(gal_l243, gal_l243.Parent, true)
                        gal42.UseSkills(gal_l243, gal37.MasterySkills)
                    end
                    return 
                end
                gal77.attack = function(gal_p1_25, gal_p2_25, gal_p3_25, gal_p4_25, ...)
                    local Humanoid = gal_p1_25:FindFirstChild("Humanoid")
                    local gal_l261 = not Humanoid
                    if gal_l261 then
                        return nil
                    end
                    if gal_l37.Mastery and Humanoid.MaxHealth < 40000.0 then
                        gal77:Mastery(gal_p1_25.PrimaryPart, Humanoid)
                        return true
                    end
                    if gal_p2_25 then
                        gal42:BringEnemies(gal_p1_25, gal_p3_25)
                    end
                    if tick() - gal82 >= 1 then
                        gal81()
                    end
                    EnableBuso()
                    if gal_p4_25 then
                        local gal_l269 = gal77.FarmModes[gal_p4_25]
                        gal_l269(gal77, gal_p1_25.PrimaryPart, gal_p4_25)
                        local SmoothMode = gal37.SmoothMode
                        if SmoothMode then
                            if gal_p4_25 then
                                if gal_p4_25 ~= "Orbit" then
                                    if task.wait(.1) and gal_l269 then
                                        gal37.RunningMethod = "Killing: " .. gal_p1_25.Name
                                        gal32.OnFarm = true
                                        gal77.attack(gal_p1_25, gal_p2_25, gal_p3_25, gal_p4_25)
                                    end
                                end
                                return true
                            else
                            end
                        end
                    else
                    end 
                end
                gal77.Material = function(gal_p1_26, gal_p2_26, ...)
                    local gal_l279 = gal85[gal_p2_26]
                    if gal_l279 then
                        local EnemyLocation = gal_p1_26.EnemyLocation
                        local CanFarm = gal_p1_26.CanFarm
                        if CanFarm[gal_p2_26] == nil then
                            if gal_l279[2][gal84.GameData.Sea] then
                                gal_p1_26.CanFarm[gal_p2_26] = true
                            else
                                gal_p1_26.CanFarm[gal_p2_26] = false
                            end
                        end
                        if not CanFarm[gal_p2_26] then
                            return nil
                        end
                        if EnemyLocation[gal_p2_26] == nil then
                            for gal_l285, gal_l286 in nil, ipairs() do
                                local gal_l288 = gal80[gal_l286]
                                while not gal_l288 do
                                    while not gal_l248 do end
                                    gal_p1_26.EnemyLocation[gal_p2_26] = gal_l288 
                                end 
                            end
                            if not EnemyLocation[gal_p2_26] then
                                gal_p1_26.EnemyLocation[gal_p2_26] = false
                            end
                        end
                        for gal_l292, gal_l293 in nil, ipairs(gal_l279[1]) do
                            local gal_l295 = gal79(gal_l293)
                            while not gal_l295 do
                                while not gal_l295 do end
                                gal_p1_26.attack(gal_l295, true, true)
                                return "Killing: " .. gal_l293 
                            end 
                        end
                        local gal_l297 = EnemyLocation[gal_p2_26]
                        if gal_l297 then
                            local TweenManager = U[gal_l142[8]].TweenManager
                            TweenManager:TweenToCFrameQueue(EnemyLocation[gal_p2_26])
                        else
                            gal85(gal84[gal_p2_26] and gal84[gal_p2_26][gal42.GameData.Sea])
                        end
                        return "Farming Material: " .. gal_p2_26
                    end
                    return 
                end
                gal77.GetNpcVectorCFrame = function(gal_p1_27, gal_p2_27, ...)
                    local gal_l300 = gal83[gal_p2_27]
                    if gal_l300 then
                        local gal_l302 = gal83[gal_p2_27]
                        return gal_l302:GetPivot()
                    end
                    local gal_l304 = NPCs:FindFirstChild(gal_p2_27) or NPCs:FindFirstChild(gal_p2_27)
                    if gal_l304 then
                        gal83[gal_p2_27] = gal_l304
                        return gal_l304:GetPivot()
                    end
                    return 
                end
                return gal77 
            end
            Managers.RaidManager = function(...)
                if gal42.GameData.Sea ~= 2 and gal42.GameData.Sea ~= 3 then
                    return nil
                end
                local gal_l307 = gal_l302
                local gal_l308 = gal_l302
                local gal_l309 = "RaidPosition"
                local gal_l310 = gal42.GameData.Sea == 2 and nil
                local gal_l311 = gal_l310
                if gal_l310 then
                    local gal_l330 = LocalPlayer.PlayerGui
                    local function gal_l295(gal_p1_28, ...)
                        local gal_l313 = gal_p1_28:IsRaiding()
                        local gal_l314 = not gal_l313
                        if gal_l314 and gal_p1_28:CanStartRaid() then
                            local Button = gal_p1_28.Button
                            local gal_l317 = Button:split(".")
                            for gal_l318 = 1, #gal_l317 do
                                while not Map do end
                                local gal_l319 = Map:FindFirstChild(gal_l317[gal_l318]) 
                            end
                            if gal_l319 then
                                fireclickdetector(gal_l319.ClickDetector)
                                task.wait(1)
                            end
                            return gal43(gal_p1_28.RaidPosition)
                        end
                        return 
                    end
                    local function gal_l294(gal_p1_28, ...)
                        local gal_l313 = gal_p1_28:IsRaiding()
                        local gal_l314 = not gal_l313
                        if gal_l314 and gal_p1_28:CanStartRaid() then
                            local Button = gal_p1_28.Button
                            local gal_l317 = Button:split(".")
                            for gal_l318 = 1, #gal_l317 do
                                while not Map do end
                                local gal_l319 = Map:FindFirstChild(gal_l317[gal_l318]) 
                            end
                            if gal_l319 then
                                fireclickdetector(gal_l319.ClickDetector)
                                task.wait(1)
                            end
                            return gal43(gal_p1_28.RaidPosition)
                        end
                        return 
                    end
                    local gal_l331 = gal_l294
                    local gal_l332 = {
                        RaidPosition = gal_l327,
                        requests = {},
                        Require = 0,
                        Timer = gal_l330:WaitForChild("Main").Timer,
                        Button = gal42.GameData.Sea == 2 and "CircleIsland.RaidSummon2.Button.Main" or gal42.GameData.Sea == 3 and "Boat Castle.RaidSummon2.Button.Main"
                    }
                    D.IsRaiding = function(gal_p1_29, ...)
                        return gal_l323 
                    end
                    D.GetRaidIsland = function(gal_p1_30, ...)
                        local gal_l326 = U[gal_l54]
                        return gal_l326:GetRaidIsland() 
                    end
                    D.CanStartRaid = function(gal_p1_31, ...)
                        local gal_l328 = U[gal_l140].Value >= 1200
                        return gal_l328 
                    end
                    D.start = function(...)
                        local gal_l313 = gal_p1_28:IsRaiding()
                        local gal_l314 = not gal_l313
                        if gal_l314 and gal_p1_28:CanStartRaid() then
                            local Button = gal_p1_28.Button
                            local gal_l317 = Button:split(".")
                            for gal_l318 = 1, #gal_l317 do
                                while not Map do end
                                local gal_l319 = Map:FindFirstChild(gal_l317[gal_l318]) 
                            end
                            if gal_l319 then
                                fireclickdetector(gal_l319.ClickDetector)
                                task.wait(1)
                            end
                            return gal43(gal_p1_28.RaidPosition)
                        end
                        return 
                    end
                    return gal_l332
                else
                    CFrame.new(-5033, 315, -2950)
                end 
            end
            Managers.ItemsManager = function(...)
                local gal_l333 = {}
                local gal86 = gal42.Enemies.IsSpawned
                local gal87 = gal42.EnemySpawned
                local gal88 = gal42.EnemyLocations
                local gal89 = gal42.EquipTool
                local gal90 = gal42.FireRemote
                local gal91 = gal42.IsAlive
                local gal92 = gal42.Inventory.Count
                local gal93 = gal42.Inventory.Unlocked
                if gal42.GameData.Sea == 3 then
                    gal_l475.CursedDualKatana = {}
                    gal_l475.SkullGuitar = {}
                    gal_l475.DojoTrainer = {}
                    local gal99 = CFrame.new(5867, 1208, 872)
                    local function gal_l472(...)
                        if gal94 and gal94.Value > 0 then
                            return gal94
                        end
                        local QuestHaze = U[gal_l170].QuestHaze
                        local GetChildren = QuestHaze.GetChildren
                        local gal_l337 = {
                            GetChildren(QuestHaze)
                        }
                        for gal_l339, gal_l340 in QuestHaze[1], ipairs(j(gal_l340)) do
                            local gal_l343 = gal_l340:GetAttribute("Position")
                            local gal_l344 = typeof(gal_l343) == "Vector3"
                            while not gal_l344 do
                                while not gal_l331 do
                                    while not gal_l344 do end
                                    U[gal_l306] = gal_l340 
                                end 
                            end 
                        end
                        return gal94 
                    end
                    local gal100 = CFrame.new(5771, 1209, 804)
                    local gal101 = gal_l472
                    local function gal102(gal_p1_32, gal_p2_32, ...)
                        for gal_l357 = 1, 3 do
                            local gal_l358 = gal_p1_32:FindFirstChild((gal_p2_32 and "Torch" or "Pedestal") .. gal_l357)
                            while not gal_l358 do
                                while not gal_l358 do end
                                return gal_l358 
                            end
                            local ProximityPrompt = gal_l358:FindFirstChild("ProximityPrompt")
                            while not ProximityPrompt do end 
                        end
                        return 
                    end
                    local gal_l477 = gal_l475.CursedDualKatana
                    gal_l477.Tushita = {
                        function(gal_p1_35, gal_p2_35, ...)
                            local gal_l368 = not LocalPlayer:FindFirstChild("BoatQuest")
                            if gal_l368 then
                                return
                            end
                            if not gal95 or gal_p1_35.BoatsDealer[gal95] then
                                local gal_l370 = NPCs:FindFirstChild("Luxury Boat Dealer")
                                if not gal_l370 or (not gal_l370.PrimaryPart or gal_p1_35.BoatsDealer[gal_l370]) then
                                else
                                    U[gal_l295] = gal_l370
                                end
                            end
                            local gal_l372 = gal95 and gal95.PrimaryPart
                            if gal_l372 then
                                if LocalPlayer:DistanceFromCharacter(gal_l372.Position) < 5 then
                                    if gal90("CDKQuest", "BoatQuest", gal95, "Check") then
                                        gal90("CDKQuest", "BoatQuest", gal95)
                                    end
                                    gal_p1_35.BoatsDealer[gal95] = true
                                end
                                return true, gal43(gal_l372.CFrame)
                            else
                                task.wait(.5)
                            end
                            return 
                        end,
                        function(gal_p1_36, gal_p2_36, ...)
                            return gal_p2_36.PirateRaid() 
                        end,
                        function(gal_p1_37, gal_p2_37, ...)
                            if Map:FindFirstChild("HeavenlyDimension") then
                                return gal104(Map.HeavenlyDimension, gal_p1_37.Heaven)
                            end
                            if gal86("Cake Queen") then
                                local gal_l379 = gal87("Cake Queen")
                                if gal_l379 then
                                    U[gal_l142[8]].FarmManager.attack(gal_l379, true)
                                else
                                    gal87(gal_p1_37.CakeQueen)
                                end
                                return true
                            end
                            return 
                        end
                    }
                    gal_l477.Yama = {
                        function(gal_p1_38, gal_p2_38, ...)
                            if not VerifyTool("Yama") then
                                return gal90("LoadItem", "Yama")
                            end
                            local gal_l382 = gal87("Forest Pirate")
                            gal89("Yama")
                            if gal_l382 then
                                gal42.AttackCooldown = tick()
                                gal43(gal_l382.PrimaryPart.CFrame * CFrame.new(0, 0, -2))
                            else
                                gal43(gal_p1_38.ForestPirate)
                            end
                            return true 
                        end,
                        function(gal_p1_39, gal_p2_39, ...)
                            if not LocalPlayer:FindFirstChild("QuestHaze") then
                                return
                            end
                            local gal_l388 = gal101()
                            if gal_l388 then
                                local Name = gal_l388.Name
                                local gal_l390 = gal87(Name)
                                if gal_l390 then
                                    U[gal_l142[8]].FarmManager.attack(gal_l390, true)
                                else
                                    local gal_l392 = U[gal_l390][Name]
                                    if gal_l392 then
                                        local TweenManager = Managers.TweenManager
                                        TweenManager:TweenToCFrameQueue(U[gal_l390][gal_l388.Name])
                                    else
                                        Managers(gal_l391:GetAttribute("Position"))
                                    end
                                    return true
                                end
                            end
                            return 
                        end,
                        function(gal_p1_40, gal_p2_40, ...)
                            if Map:FindFirstChild("HellDimension") then
                                return gal104(Map.HellDimension, gal_p1_40.Hell)
                            end
                            if gal86("Soul Reaper") then
                                local gal_l396 = gal87("Soul Reaper")
                                if gal_l396 then
                                    if gal104:DistanceFromCharacter(gal_l396.PrimaryPart.Position) > 6 then
                                        gal87(Map("Soul Reaper").PrimaryPart.CFrame * CFrame.new(0, 0, -2))
                                    end
                                    return true
                                end
                                return
                            end
                            local gal_l399 = gal_p2_40.SoulReaper()
                            if gal_l399 then
                                return gal_l399
                            else
                            end 
                        end
                    }
                    G.FinalQuest = function(gal_p1_41, gal_p2_41, ...)
                        if not VerifyTool("Tushita") and not VerifyTool("Yama") then
                            return gal90("LoadItem", "Yama")
                        end
                        if gal86("Cursed Skeleton Boss") then
                            local gal_l404 = gal87("Cursed Skeleton Boss")
                            if gal_l404 then
                                gal89("Sword", true)
                                Managers.FarmManager.ToolDebounce()
                                Managers.FarmManager.attack(gal_l404, true)
                                return true
                            end
                            return false
                        end
                        local Visible = LocalPlayer.PlayerGui.Main.Dialogue.Visible
                        if Visible then
                            VirtualUser:ClickButton1(Vector2.new(10000.0, 10000.0))
                        end
                        local gal_l408 = gal102(Map.Turtle.Cursed)
                        if gal_l408 then
                            if LocalPlayer:DistanceFromCharacter(gal_l408.Position) < 5 then
                                fireproximityprompt(LocalPlayer.ProximityPrompt)
                            else
                                gal89(LocalPlayer.CFrame)
                            end
                            return true
                        end
                        local gal_l411 = LocalPlayer:DistanceFromCharacter(gal_p1_41.CursedSkeleton[1].Position)
                        local gal_l412 = gal_l411 > 6
                        if gal_l412 then
                            gal43(gal_p1_41.CursedSkeleton[1], gal_l411 <= 100 and 40)
                        else
                            gal43(gal_p1_41.CursedSkeleton[2])
                        end
                        task.wait(.5)
                        return true 
                    end
                    local gal105 = gal_l475.DojoTrainer
                    local gal106 = {
                        NPC = "Dojo Trainer",
                        Command = "ClaimQuest"
                    }
                    local gal107 = {
                        NPC = "Dojo Trainer",
                        Command = "RequestQuest"
                    }
                    local gal108 = {
                        NPC = "Dragon Wizard",
                        Command = "Speak"
                    }
                    local gal109 = {
                        NPC = "Dragon Wizard",
                        Command = "DragonRace"
                    }
                    local gal110 = {
                        NPC = "Dragon Wizard",
                        Command = "LearnTether"
                    }
                    local gal111 = {
                        NPC = "Dragon Wizard",
                        Command = "Ascension",
                        Action = "Begin"
                    }
                    local gal112 = {
                        NPC = "Dragon Wizard",
                        Command = "Ascension",
                        Action = "Complete"
                    }
                    local gal113 = CreateDictionary({
                        "Terrorshark"
                    }, true)
                    local gal114 = CreateDictionary({
                        "Piranha",
                        "Shark"
                    }, true)
                    local gal115 = CreateDictionary({
                        "Terrorshark"
                    }, true)
                    local gal_l478 = Net
                    local gal116 = gal_l478:WaitForChild("RF/InteractDragonQuest")
                    gal105.Progress = {}
                    gal105.BeltQuest = nil
                    local gal117 = {
                        White = 20,
                        Green = 360,
                        Purple = 3,
                        Red = 1,
                        Yellow = 8,
                        Blue = 1,
                        Black = 3
                    }
                    local function gal119(gal_p1_43, ...)
                        if gal93["Dragon Egg"] or (gal98.CanTransform or gal98.CanTransformFree) then
                            return gal105:InteractWithNpcDraco(gal109)
                        end
                        local gal_l416 = not gal98.TetherLearned
                        if gal_l416 then
                            return gal105:InteractWithNpcDraco(gal110)
                        end
                        return gal118(gal_p1_43) 
                    end
                    local function gal120(gal_p1_44, gal_p2_44, ...)
                        if gal_p1_44 == "V2" or gal_p1_44 == "V3" then
                            return gal105:InteractWithNpcDraco(gal111)
                        end
                        if gal_p1_44 == "V2InProgress" then
                            local gal_l421 = gal92["Fire Flower"] >= 5
                            if gal_l421 then
                                return gal105:InteractWithNpcDraco(gal112)
                            end
                            return "FireFlowers"
                        end
                        if gal_p1_44 == "V3InProgress" then
                            local DracoV3Completed = gal105.DracoV3Completed
                            if DracoV3Completed then
                                return gal105:InteractWithNpcDraco(gal112)
                            end
                            return gal_p2_44.Sea(gal115, false)
                        end
                        if gal_p1_44 == "V2TurnInReady" or gal_p1_44 == "V3TurnInReady" then
                            local Value = U[gal_l164].Level.Value
                            if Value >= (gal_p1_44 == "V3TurnInReady" and 3000000.0 or 1000000.0) then
                                return self:InteractWithNpcDraco(U[gal_l1091])
                            end
                            return gal_p2_44.Level()
                        end
                        return 
                    end
                    gal105.BeltWhite = function(gal_p1_45, gal_p2_45, ...)
                        return gal_p2_45.Level() 
                    end
                    gal105.BeltGreen = function(gal_p1_46, ...)
                        if LocalPlayer:GetAttribute("DangerLevel") >= 600 and gal_p1_46.GreenTimer then
                            gal_p1_46.Progress.Green = gal_p1_46.Progress.Green + tick() - gal_p1_46.GreenTimer
                        end
                        gal_p1_46.GreenTimer = tick()
                        local SeaManager = Managers.SeaManager
                        return SeaManager:DriveBoat("inf") 
                    end
                    gal105.BeltPurple = function(gal_p1_47, gal_p2_47, ...)
                        local PurpleProgress = gal_p1_47.PurpleProgress
                        if not PurpleProgress then
                            gal_p1_47.StartPurpleProgress = gal_p1_47.Progress.Purple
                            local gal_l434 = U[gal_l54]
                            gal_p1_47.PurpleProgress = gal_l434:GetProgress("EliteProgress", "EliteHunter", "Progress")
                        else
                            if not gal_p2_47.EliteHunter() then
                                local gal_l435 = U[gal_l54]
                                gal_p1_47.Progress.Purple = gal_p1_47.StartPurpleProgress + gal_l435:GetProgress("EliteProgress", "EliteHunter", "Progress") - gal_p1_47.PurpleProgress
                                return
                            end
                            return true
                        end 
                    end
                    gal105.BeltRed = function(gal_p1_48, gal_p2_48, ...)
                        return gal_p2_48.Sea(gal113, false) 
                    end
                    gal105.BeltYellow = function(gal_p1_49, gal_p2_49, ...)
                        return gal_p2_49.Sea(gal114, false) 
                    end
                    gal105.BeltBlue = function(gal_p1_50, gal_p2_50, ...)
                        if not gal91(LocalPlayer.Character) then
                            return
                        end
                        if gal96 and gal96.Parent == LocalPlayer.Character then
                            gal_p1_50.Progress.Blue = 1
                        else
                            if gal96 and gal96.Parent ~= workspace then
                                U[gal_l360] = nil
                            end
                            if gal96 then
                                return gal_p2_50.Fruits(U[gal_l360])
                            end
                            local Tool = workspace:FindFirstChildOfClass("Tool")
                            if Tool then
                                local gal_l443 = Tool:GetAttribute("DroppedBy") ~= LocalPlayer.Name
                            end
                            local gal_l444 = not gal91(gal_l426)
                            if gal_l443 then
                                U[gal_l360] = Tool
                            else
                                if gal_l445:FindFirstChildOfClass("Tool") then
                                    gal_l445:FindFirstChildOfClass("Tool").Parent = U[gal_l142[7]]
                                end
                                return
                            end
                        end 
                    end
                    gal105.BeltBlack = function(gal_p1_51, gal_p2_51, ...)
                        if not gal_p1_51.BlackProgress then
                            gal_p1_51.BlackProgress = gal_p1_51.Progress.Black - gal92["Dinosaur Bones"]
                            return
                        end
                        gal_p1_51.Progress.Black = gal92["Dinosaur Bones"] - gal_p1_51.BlackProgress
                        return gal118(gal_p2_51) 
                    end
                    gal105.CollectBeltReward = function(gal_p1_52, gal_p2_52, ...)
                        if gal93["Dojo Belt (" .. gal_p2_52 .. ")"] then
                            gal_p1_52.Progress[gal_p2_52] = nil
                            return false
                        end
                        local gal_l449 = LocalPlayer:DistanceFromCharacter(gal99.Position) <= 5
                        if gal_l449 then
                            gal116:InvokeServer(gal106)
                        else
                            gal43(gal99)
                        end
                        return true 
                    end
                    gal105.UpdateBeltProgress = function(gal_p1_53, gal_p2_53, gal_p3_53, ...)
                        local gal_l453 = gal_p1_53.BeltQuest == gal_p2_53
                        if gal_l453 then
                            local Progress = gal_p1_53.Progress
                            Progress[gal_p2_53] = (gal_p1_53.Progress[gal_p2_53] or 0) + gal_p3_53
                        else
                            if gal_p2_53 == "Red" and (gal98 and gal98.AvailableVQuest == "V3InProgress") then
                                gal_p1_53.DracoV3Completed = true
                            end
                            return
                        end 
                    end
                    gal105.GetBelt = function(gal_p1_54, gal_p2_54, gal_p3_54, ...)
                        local BeltName = gal_p2_54.BeltName
                        local gal_l460 = gal_p1_54["Belt" .. BeltName]
                        if not gal_l460 then
                            return false
                        end
                        if gal93["Dojo Belt (" .. BeltName .. ")"] then
                            return gal_p1_54:InteractWithDojoTrainer()
                        end
                        if not gal_p1_54.Progress[BeltName] or not gal_p2_54.UpdatedProgress then
                            gal_p1_54.Progress[BeltName] = gal_p2_54.Progress
                            gal_p2_54.UpdatedProgress = true
                        end
                        if gal_p1_54.Progress[BeltName] >= gal117[BeltName] then
                            return gal_p1_54:CollectBeltReward(BeltName)
                        end
                        gal_p1_54.BeltQuest = BeltName
                        if gal_l460(gal_p1_54, gal_p3_54) then
                            return "Belt Quest: " .. BeltName
                        end
                        return 
                    end
                    gal105.InteractWithDojoTrainer = function(gal_p1_55, ...)
                        local gal_l463 = LocalPlayer:DistanceFromCharacter(gal99.Position) <= 5
                        if gal_l463 then
                        else
                            gal43(gal99)
                        end
                        return "Getting Belt Quest" 
                    end
                    gal105.InteractWithDragonWizard = function(gal_p1_56, ...)
                        local gal_l467 = LocalPlayer:DistanceFromCharacter(gal100.Position) <= 5
                        if gal_l467 then
                        else
                            gal43(gal100)
                        end
                        return "Getting Draco Quest" 
                    end
                    gal105.InteractWithNpcDraco = function(gal_p1_57, gal_p2_57, ...)
                        local gal_l471 = LocalPlayer:DistanceFromCharacter(gal100.Position) <= 5
                        if gal_l471 then
                            if gal116:InvokeServer(gal_p2_57) then
                                U[gal_l169] = nil
                            end
                        else
                            gal43(gal100)
                        end
                        return true 
                    end
                    gal105.Train = function(gal_p1_58, gal_p2_58, ...)
                        if type(gal97) == "table" then
                            if gal97.Timeout or gal97.Completed then
                                return nil
                            end
                            if gal97.Quest then
                                return gal_p1_58:GetBelt(U[gal_l244].Quest, gal_p2_58)
                            end
                            return
                        end
                        return gal_p1_58:InteractWithDojoTrainer() 
                    end
                    gal105.EvoDracoRace = function(gal_p1_59, gal_p2_59, ...)
                        if not gal93["Dojo Belt (Black)"] then
                            return gal_p2_59.DojoTrainer()
                        end
                        if type(gal98) ~= "table" then
                            return gal_p1_59:InteractWithDragonWizard()
                        end
                        if not gal98.TetherLearned and not gal98.CanLearnTether then
                            return false
                        end
                        if not gal98.FoundPrehistoric then
                            return gal118(gal_p2_59)
                        end
                        if U[gal_l164].Race.Value ~= "Draco" then
                            return gal119(gal_p2_59)
                        end
                        if gal98.AvailableVQuest then
                            return gal120(gal98.AvailableVQuest, gal_p2_59)
                        end
                        return 
                    end
                    local gal_l479 = gal_l475.SkullGuitar
                end
                return gal_l475 
            end
            Managers.EspManager = function(...)
                local gal121 = {}
                gal121.__index = gal121
                gal121.__newindex = function(gal_p1_60, gal_p2_60, gal_p3_60, ...)
                    if gal_p2_60 == "Enabled" then
                        task.spawn(gal_p1_60.ToggleEsp, gal_p1_60, gal_p3_60)
                    else
                        rawset(gal_p1_60, gal_p2_60, gal_p3_60)
                    end
                    return 
                end
                local gal122 = Instance.new("Folder", CoreGui)
                gal122.Name = "redzHub-EspFolder"
                local gal_l596 = CoreGui
                local gal_l597 = gal_l596:FindFirstChild(gal122.Name)
                local gal_l598 = gal_l597
                if gal_l597 then
                    local gal_l599 = gal_l597 ~= gal122
                end
                if gal_l599 then
                    gal_l597:Destroy()
                end
                local gal123 = Instance.new("BoxHandleAdornment")
                local gal_l600 = gal123
                gal_l600.Size = Vector3.new(1, 0, 1, 0)
                gal_l600.AlwaysOnTop = true
                gal_l600.ZIndex = 10
                gal_l600.Transparency = 0
                local gal_l601 = Instance.new("BillboardGui", gal_l600)
                gal_l601.Size = UDim2.new(0, 100, 0, 150)
                gal_l601.StudsOffset = Vector3.new(0, 2, 0)
                gal_l601.AlwaysOnTop = true
                local gal_l602 = Instance.new("TextLabel", gal_l601)
                gal_l602.BackgroundTransparency = 1
                gal_l602.Position = UDim2.new(0, 0, 0, -50)
                gal_l602.Size = UDim2.new(0, 100, 0, 100)
                gal_l602.TextSize = 10
                gal_l602.TextStrokeTransparency = 0
                gal_l602.TextYAlignment = Enum.TextYAlignment.Bottom
                gal_l602.Text = "..."
                gal_l602.ZIndex = 15
                gal_l602.RichText = true
                local gal124 = Color3.fromRGB(255, 255, 255)
                local gal125 = "%s<font color='rgb(160, 160, 160)'> [ %im ]</font>\n<font color='rgb(25, 240, 25)'>[%i/%i]</font>"
                local gal126 = {}
                local function gal127(gal_p1_61, ...)
                    if gal_p1_61:IsA("BasePart") then
                        return gal_p1_61
                    end
                    if gal_p1_61:IsA("Model") then
                        local PrimaryPart = gal_p1_61.PrimaryPart
                        if PrimaryPart then
                            return PrimaryPart
                        else
                        end
                    end
                    local Parent = gal_p1_61.Parent
                    if Parent:IsA("Model") then
                        local PrimaryPart = gal_p1_61.Parent.PrimaryPart
                        if PrimaryPart then
                            return PrimaryPart
                        else
                        end
                    end
                    return 
                end
                gal121.SetCustomEspDisplay = function(gal_p1_62, gal_p2_62, ...)
                    gal_p1_62.CustomEspDisplay = gal_p2_62
                    return gal_p1_62 
                end
                gal121.SetObjects = function(gal_p1_63, gal_p2_63, ...)
                    gal_p1_63.GetObjectsAction = gal_p2_63
                    return gal_p1_63 
                end
                gal121.GetInstance = function(gal_p1_64, gal_p2_64, ...)
                    gal_p1_64.OnlyOneInstanceAction = gal_p2_64
                    return gal_p1_64 
                end
                gal121.SetInstanceName = function(gal_p1_65, gal_p2_65, gal_p3_65, ...)
                    gal_p1_65.EspsNames[gal_p2_65] = gal_p3_65
                    return gal_p1_65 
                end
                gal121.SetAllInstancesName = function(gal_p1_66, gal_p2_66, ...)
                    gal_p1_66.CustomInstanceName = gal_p2_66
                    return gal_p1_66 
                end
                gal121.WaitChildsAdded = function(gal_p1_67, ...)
                    gal_p1_67._WaitChildsAdded = true
                    return gal_p1_67 
                end
                gal121.SetEspColor = function(gal_p1_68, gal_p2_68, ...)
                    gal_p1_68.EspColor = gal_p2_68
                    return gal_p1_68 
                end
                gal121.SetAlwaysValidate = function(gal_p1_69, ...)
                    gal_p1_69.AlwaysValidateInstance = true
                    return gal_p1_69 
                end
                gal121.Validator = function(gal_p1_70, gal_p2_70, ...)
                    gal_p1_70.ValidateInstance = gal_p2_70
                    return gal_p1_70 
                end
                gal121.ChangeEspSize = function(gal_p1_71, gal_p2_71, ...)
                    gal_p1_71.EspSize = gal_p2_71
                    for gal_l501 = 1, #gal126 do
                        local gal_l502 = gal126[gal_l501]
                        local gal_l504 = gal_l502[1]
                        for gal_l506, gal_l507 in gal_l504, pairs(gal_l504) do
                            gal_l507.BoxHandleAdornment.BillboardGui.TextLabel.TextSize = gal_p2_71 
                        end 
                    end
                    return gal_p1_71 
                end
                gal121.StartRunningEsp = function(gal_p1_72, gal_p2_72, ...)
                    local Instance = gal_p2_72.Instance
                    local BoxHandleAdornment = gal_p2_72.BoxHandleAdornment
                    local gal_l515 = Instance:IsA("Model")
                    local gal_l516 = task.wait
                    if gal_l516(gal37.SmoothMode and .25 or 0) then
                        if not BoxHandleAdornment or not BoxHandleAdornment.Parent then
                            return gal_p1_72:Clear(gal_p2_72)
                        end
                        if gal_p1_72.AlwaysValidateInstance and not gal_p1_72.ValidateInstance(Instance) then
                            return gal_p1_72:Clear(gal_p2_72)
                        end
                        if not Instance:IsDescendantOf(workspace) and not Instance:IsDescendantOf(ReplicatedStorage) then
                            return gal_p1_72:Clear(gal_p2_72)
                        end
                        if nil then
                            if not gal_l500 then
                                return gal_p1_72:Clear(gal_p2_72)
                            end
                            if gal_l515 then
                                BoxHandleAdornment.BillboardGui.TextLabel.Text = gal125:format(gal_p2_72.Instance.Name, math.floor(gal125:DistanceFromCharacter(gal_l500.Position) / gal125), math.floor(gal_l515.Health), math.floor(gal_l515.MaxHealth))
                                local PrimaryPart = gal_p2_72.PrimaryPart
                                if PrimaryPart then
                                    return "Killing Elite Hunter: " .. gal_p1_72, U[({
                                        296,
                                        270,
                                        270,
                                        304,
                                        271
                                    })[6]](gal_p2_72)
                                end
                                return
                            else
                                if gal_p1_72.CustomEspDisplay then
                                    BoxHandleAdornment.BillboardGui.TextLabel.Text = gal_p1_72.CustomEspDisplay(gal_p2_72.Instance, math.floor(gal_l360 / gal_l524))
                                else
                                    BoxHandleAdornment.BillboardGui.TextLabel.Text = nil
                                end
                            end
                        else
                        end
                    end
                    return 
                end
                gal121.Create = function(gal_p1_73, gal_p2_73, ...)
                    if gal_p1_73.EspObjects[gal_p2_73] then
                        return
                    end
                    local gal_l530 = {
                        Instance = gal_p2_73,
                        BoxHandleAdornment = nil
                    }
                    local gal_l532 = gal123:Clone()
                    local BillboardGui = gal_l532.BillboardGui
                    local TextLabel = BillboardGui.TextLabel
                    local gal_l535 = gal_p2_73:IsA("BasePart") or gal_p2_73:IsA("Model")
                    BillboardGui["Adornee"] = gal_l538 or gal_p2_73.Parent
                    local gal_l543 = type(gal_p1_73.EspColor) == "function"
                    local gal_l544 = gal_l543 and gal_p1_73.EspColor(gal_p2_73)
                    if gal_l543 then
                        TextLabel["TextColor3"] = gal_l543 and gal_p1_73.EspColor(gal_p2_73)
                        TextLabel.Text = gal_p1_73.CustomInstanceName or "..."
                        local EspSize = gal_p1_73.EspSize
                        if EspSize then
                            BillboardGui.TextLabel.TextSize = EspSize
                            gal_l532.Parent = gal_p1_73.EspFolder
                            local gal_l553 = {
                                Instance = gal_p2_73,
                                BoxHandleAdornment = nil
                            }
                            gal_p1_73.EspObjects[gal_p2_73] = gal_l553
                            gal_l530.BoxHandleAdornment = gal_l532
                            task.spawn(gal_p1_73.StartRunningEsp, gal_p1_73, gal_l530)
                            return gal_l530
                        else
                        end
                    else
                    end 
                end
                gal121.Clear = function(gal_p1_74, gal_p2_74, ...)
                    if gal_p2_74 then
                        gal_p1_74.EspObjects[gal_p2_74.Instance] = nil
                        local BoxHandleAdornment = gal_p2_74.BoxHandleAdornment
                        if BoxHandleAdornment then
                            local BoxHandleAdornment = gal_p2_74.BoxHandleAdornment
                            BoxHandleAdornment:Destroy()
                        end
                    else
                        table.clear(gal_p1_74.EspObjects)
                        local EspFolder = gal_p1_74.EspFolder
                        EspFolder:ClearAllChildren()
                    end
                    return 
                end
                gal121.ToggleEsp = function(gal_p1_75, gal_p2_75, ...)
                    local gal_l565 = "redzHub_Esp_" .. gal_p1_75["SpecialTag"]
                    U[gal_l1102][gal_l565] = gal_p2_75
                    if not gal_p2_75 then
                        return gal_p1_75:Clear()
                    end
                    local gal_l566 = U[gal_l1102][gal_l565]
                    while gal_l566 do
                        local GetObjectsAction = gal_p1_75.GetObjectsAction
                        local OnlyOneInstanceAction = gal_p1_75.OnlyOneInstanceAction
                        while OnlyOneInstanceAction do
                            if gal_p1_75.OnlyOneInstanceAction() then
                                local gal_l570 = not CreatedNew
                                while not gal_l570 do
                                    while not gal_l570 do
                                        task.wait(.25) 
                                    end
                                    local ChildAdded = gal_p1_75.GetObjectsAction.ChildAdded
                                    ChildAdded:Wait() 
                                end
                            end 
                        end
                        while not GetObjectsAction do end
                        local gal_l574 = typeof(GetObjectsAction) == "Instance"
                        while not gal_l574 do
                            while gal_l574 do
                                local ValidateInstance = gal_p1_75.ValidateInstance
                                for gal_l580 = 1, #gal_l574 do
                                    local gal_l581 = gal_l574[gal_l580]
                                    local gal_l582 = not gal_p1_75.EspObjects[gal_l581]
                                    while not gal_l582 do
                                        while not gal_l582 do end
                                        gal_p1_75:Create(gal_l581) 
                                    end
                                    local gal_l585 = not ValidateInstance
                                    while gal_l585 do end 
                                end 
                            end 
                        end 
                    end
                    return 
                end
                gal121.new = function(gal_p1_76, ...)
                    local gal_l593 = Instance.new("Folder", gal122)
                    gal_l593.Name = gal_p1_76
                    local gal_l595 = setmetatable({
                        SpecialTag = gal_p1_76,
                        EspObjects = {},
                        EspsNames = {},
                        EspFolder = gal_l593
                    }, gal121)
                    table.insert(gal126, gal_l595)
                    return gal_l595 
                end
                return gal121 
            end
            Managers.SeaManager = function(...)
                if gal42.GameData.Sea == 1 then
                    return
                end
                local gal_l815 = {
                    RandomWeapons = {
                        Weapons = {
                            "Melee",
                            "Blox Fruit",
                            "Sword",
                            "Gun"
                        },
                        Selected = "Melee",
                        Debounce = 0
                    },
                    Boats = {
                        MoveDebounce = 0,
                        NextNumber = 1,
                        MyBoat = nil,
                        SelectedBoat = "BeastHunter",
                        OthersBoats = {
                            "BeastHunter",
                            "Guardian",
                            "Lantern",
                            "Sleigh",
                            "PirateGrandBrigade",
                            "MarineGrandBrigade"
                        },
                        Spawns = ({
                            {
                                CFrame.new(94, 10, 2951),
                                CFrame.new(-5288, 5, -701)
                            },
                            {
                                CFrame.new(-6123, 16, -2247),
                                CFrame.new(-16917, 9, 510)
                            }
                        })[gal42.GameData.Sea - 1]
                    },
                    SeaBeastDirections = {
                        Vector3.new(1, 0, 0),
                        Vector3.new(0, 0, 1),
                        Vector3.new(-1, 0, 0),
                        Vector3.new(0, 0, -1),
                        Vector3.new(0, 0, 0)
                    },
                    SeaPositions = ({
                        {
                            CFrame.new(-43, 21, 5054),
                            CFrame.new(1744, 21, 4393),
                            CFrame.new(1003, 21, 3598),
                            CFrame.new(-935, 21, 3813)
                        },
                        {
                            inf = -100000000,
                            ["6"] = -43200,
                            ["5"] = -38200,
                            ["4"] = -34000,
                            ["3"] = -30000,
                            ["2"] = -26000,
                            ["1"] = -22000
                        }
                    })[gal42.GameData.Sea - 1]
                }
                local gal_l816 = Remotes
                local gal128 = gal_l816:WaitForChild("SubclassNetwork")
                local gal_l817 = "GameData"
                if gal42[gal_l817].Sea == 3 then
                    local gal_l818 = gal_l815.SeaPositions
                    local gal_l819 = nil
                    local gal_l820 = nil
                    for gal_l821, gal_l822 in pairs(gal_l820) do
                        ({
                            RandomWeapons = {
                                Weapons = {
                                    "Melee",
                                    "Blox Fruit",
                                    "Sword",
                                    "Gun"
                                },
                                Selected = "Melee",
                                Debounce = 0
                            },
                            Boats = {
                                MoveDebounce = 0,
                                NextNumber = 1,
                                MyBoat = nil,
                                SelectedBoat = "BeastHunter",
                                OthersBoats = {
                                    "BeastHunter",
                                    "Guardian",
                                    "Lantern",
                                    "Sleigh",
                                    "PirateGrandBrigade",
                                    "MarineGrandBrigade"
                                },
                                Spawns = ({
                                    {
                                        CFrame.new(94, 10, 2951),
                                        CFrame.new(-5288, 5, -701)
                                    },
                                    {
                                        CFrame.new(-6123, 16, -2247),
                                        CFrame.new(-16917, 9, 510)
                                    }
                                })[gal42.GameData.Sea - 1]
                            },
                            SeaBeastDirections = {
                                Vector3.new(1, 0, 0),
                                Vector3.new(0, 0, 1),
                                Vector3.new(-1, 0, 0),
                                Vector3.new(0, 0, -1),
                                Vector3.new(0, 0, 0)
                            },
                            [gal_l814] = gal_l822
                        }).SeaPositions[gal_l821] = {
                            CFrame.new(gal_l822, 19, 500),
                            CFrame.new(gal_l822 - 3000, 19, 500),
                            CFrame.new(gal_l822 - 3000, 19, 2000),
                            CFrame.new(gal_l822, 19, -1000)
                        } 
                    end
                end
                local gal129 = gal42.IsAlive
                local gal130 = gal42.FireRemote
                local gal131 = gal42.Inventory.Count
                local gal_l823 = gal42.Inventory.Unlocked
                local gal132 = gal42.UseSkills
                local gal133 = gal42.EquipTool
                local gal134 = gal42.Tween
                local gal135 = gal42.GameData.Sea
                gal136 = false
                local gal137 = Vector3.yAxis * 40
                local gal138 = Vector3.yAxis * 20
                gal139 = 0
                gal140 = 1
                local function gal142(gal_p1_78, ...)
                    return gal_p1_78:FindFirstChild("Owner") and gal_p1_78.Owner.Value == LocalPlayer 
                end
                local function gal144(gal_p1_80, gal_p2_80, ...)
                    if tick() - gal139 >= gal_p2_80 then
                        local gal139 = tick()
                    end
                    return gal140 
                end
                local function gal145(gal_p1_81, gal_p2_81, ...)
                    if gal136 and gal136.Position.Y > -2 then
                        return true
                    end
                    local gal_l605 = gal_p2_81.Position.Y > -2
                    if gal_l605 then
                        return true
                    end
                    local gal_l608 = {
                        Enemies:GetChildren()
                    }
                    for gal_l611, gal_l612 in ipairs(j(gal_l612)) do
                        local gal_l615 = gal_l612.Name == gal_p1_81
                        while not gal_l615 do
                            while not gal_l615 do end
                            local HumanoidRootPart = gal_l612:FindFirstChild("HumanoidRootPart")
                            while not HumanoidRootPart do
                                while not HumanoidRootPart do end
                                local gal_l621 = gal_l612:FindFirstChild("HumanoidRootPart")
                                U[gal_l508] = gal_l621
                                return true 
                            end
                            local gal_l622 = HumanoidRootPart.Position.Y > -2
                            local gal_l623 = gal_l360:DistanceFromCharacter(HumanoidRootPart.Position) <= 500
                            while not gal_l622 do end
                            local gal_l627 = gal_l360:DistanceFromCharacter(HumanoidRootPart.Position) <= 500 
                        end 
                    end
                    return 
                end
                D.GetRandomWeapon = function(gal_p1_82, ...)
                    local RandomWeapons = gal_p1_82.RandomWeapons
                    local gal_l631 = tick() - RandomWeapons.Debounce >= 2
                    if gal_l631 then
                        local Weapons = RandomWeapons.Weapons
                        local gal_l633 = Weapons[table.find(Weapons, RandomWeapons.Selected) + 1] and 1
                        local gal_l634 = Weapons[1]
                        local gal_l635 = not VerifyToolTip(gal_l634)
                        while gal_l635 do
                            local gal_l638 = gal_l611 > #Weapons and 0
                            while gal_l638 do end 
                        end
                        RandomWeapons.Selected = gal_l641
                        RandomWeapons.Debounce = tick()
                        return gal_l641
                    end
                    return RandomWeapons.Selected 
                end
                D.GetMyBoat = function(gal_p1_83, ...)
                    if not gal129(LocalPlayer.Character) then
                        return
                    end
                    local SeatPart = LocalPlayer.Character.Humanoid.SeatPart
                    if SeatPart then
                        local gal_l645 = SeatPart.Name == "VehicleSeat"
                        if gal_l645 then
                            local gal_l646 = U[gal_l170](gal_l635.Parent)
                        end
                    end
                    if SeatPart then
                        return SeatPart.Parent, SeatPart.Parent.PrimaryPart
                    end
                    local MyBoat = gal_p1_83.Boats.MyBoat
                    local gal_l650 = gal141(MyBoat)
                    if gal_l650 then
                        local Parent = MyBoat.Parent
                        if Parent then
                            local MyBoat = gal_p1_83.Boats.MyBoat
                            local gal_l654 = gal141:DistanceFromCharacter((MyBoat.PrimaryPart or MyBoat:GetPivot()).Position) <= 12000
                        end
                    end
                    if gal_l650 then
                        return MyBoat, MyBoat.PrimaryPart
                    end
                    local gal_l660 = Boats[1]
                    for gal_l661, gal_l662 in gal_l660, ipairs(gal_l660:GetChildren()) do
                        local gal_l664 = gal142(gal_l662)
                        while not gal_l664 do
                            while not gal_l664 do end
                            if gal_l662.Name ~= gal_p1_83.Boats.SelectedBoat then
                                gal_p1_83.Boats.SelectedBoat = gal_l662.Name
                                break
                            end
                            gal_p1_83.Boats.MyBoat = gal_l662
                            return gal_l662, gal_l662.PrimaryPart 
                        end
                        local gal_l666 = gal141(gal_l662)
                        while not gal_l666 do end
                        local PrimaryPart = gal_l662.PrimaryPart
                        while PrimaryPart do
                            local gal_l674 = LocalPlayer:DistanceFromCharacter(PrimaryPart.Position) <= 8000 
                        end 
                    end
                    return 
                end
                D.GetClosestBoatDealer = function(gal_p1_84, gal_p2_84, gal_p3_84, ...)
                    if #gal_p3_84 < 2 then
                        return gal_p3_84[1]
                    end
                    for gal_l682, gal_l683 in ipairs(gal_p3_84) do
 
                    end
                    return nil 
                end
                D.BuyNewBoat = function(gal_p1_85, ...)
                    if not gal129(LocalPlayer.Character) then
                        return
                    end
                    local SelectedBoat = gal_p1_85.Boats.SelectedBoat
                    local OthersBoats = gal_p1_85.Boats.OthersBoats
                    local Character = LocalPlayer.Character
                    local gal_l692 = gal_p1_85:GetClosestBoatDealer(Character:GetPivot(), gal_p1_85.Boats.Spawns)
                    if LocalPlayer:DistanceFromCharacter(gal_l692.Position) >= 10 then
                        return true, gal43(gal_l692)
                    end
                    while gal130("BuyBoat", SelectedBoat) ~= 1 do
                        if OthersBoats[table.find(OthersBoats, SelectedBoat) + 1] == nil then
                            return true
                        end 
                    end
                    return 
                end
                D.RepairBoat = function(gal_p1_86, gal_p2_86, ...)
                    if gal_p2_86 then
                        if not U[gal_l689](LocalPlayer.Character) or not gal_p2_86 then
                            return
                        end
                        local Humanoid = gal_p2_86.Humanoid
                        gal_p2_86:SetAttribute("_Repairing", Humanoid.Value < (gal_p2_86:GetAttribute("MaxHealth") or Humanoid.Value))
                        local gal_l703 = not gal_p2_86:GetAttribute("_Repairing")
                        if gal_l705 then
                            local UseSubclass = gal128.UseSubclass
                            return true, UseSubclass:InvokeServer({
                                Action = "RequestHammer"
                            })
                        end
                        if true then
                            gal43((true).Marker.Value.WorldCFrame + Vector3.xAxis * 10)
                            return true, task.spawn(gal143, true)
                        end
                        if gal_p2_86:FindFirstChild("VehicleSeat") then
                            local gal_l708 = gal_p2_86.VehicleSeat.CFrame + Vector3.yAxis * 20
                            local gal_l710 = gal128:DistanceFromCharacter(gal_l708.Position) <= 5
                            if gal_l710 then
                                local UseSubclass = gal128.UseSubclass
                                UseSubclass:InvokeServer({
                                    Action = "RequestHammer"
                                })
                            else
                                U[gal_l142[7]](gal_l708)
                            end
                        end
                        gal_p1_86:StopMovingBoat(gal_p2_86)
                        return true
                    else
                    end 
                end
                D.CanRepair = function(gal_p1_87, gal_p2_87, ...)
                    if gal_p2_87 then
                        local RepairBoat = gal37.RepairBoat
                        if RepairBoat then
                            local Humanoid = gal_p2_87.Humanoid
                            if Subclass.Value ~= "Shipwright" or gal131["Wooden Plank"] == 0 then
                                return false
                            end
                            if gal_p2_87:GetAttribute("_Repairing") or Humanoid.Value < (gal_p2_87:GetAttribute("MaxHealth") or Humanoid.Value) / 1.2 then
                                return true
                            end
                        end
                        return
                    else
                    end 
                end
                D.MoveBoat = function(gal_p1_88, gal_p2_88, gal_p3_88, gal_p4_88, ...)
                    if tick() - gal_p1_88.Boats.MoveDebounce >= .5 then
                        gal42:RemoveBoatCollision(gal_p2_88.Parent)
                        if gal_p4_88 then
                            gal134.Velocity = (gal_p3_88.Position - gal_p2_88.Position).Unit * gal_p4_88
                            gal_l713.Boats.MoveDebounce = tick()
                            return
                        else
                        end
                    end 
                end
                D.GetCordinateCFrame = function(gal_p1_89, gal_p2_89, gal_p3_89, ...)
                    local gal_l733 = gal_l729 or gal_p1_89.SeaPositions
                    local Boats = gal_p1_89.Boats
                    if #gal_l733 == 1 then
                        return gal_l733[1]
                    end
                    if Boats.NextNumber > #gal_l733 then
                        Boats.NextNumber = 1
                    end
                    local gal_l735 = gal_l733[Boats.NextNumber]
                    local Magnitude = (gal_p3_89.Position - gal_l735.Position).Magnitude
                    if Magnitude < 75 then
                        Boats.NextNumber = Boats.NextNumber + 1
                        local gal_l738 = gal_l733[Boats.NextNumber]
                        if gal_l738 then
                            return gal_l738
                        else
                        end
                    end
                    return gal_l735 
                end
                D.StopMovingBoat = function(gal_p1_90, ...)
                    gal134.Velocity = Vector3.zero
                    return 
                end
                D.DriveBoat = function(gal_p1_91, gal_p2_91, ...)
                    if not gal129(LocalPlayer.Character) then
                        return
                    end
                    local gal_l746 = {
                        gal_p1_91:GetMyBoat()
                    }
                    local gal_l747 = gal_l746[2]
                    local gal_l748 = gal_p1_91:GetMyBoat()
                    if gal_l748 then
                        local VehicleSeat = gal_l748:FindFirstChild("VehicleSeat")
                        if VehicleSeat then
                            if LocalPlayer:DistanceFromCharacter(VehicleSeat.Position) <= 100 then
                                gal_l740:Sit(LocalPlayer.Character.Humanoid)
                            end
                            return true, gal43(VehicleSeat.CFrame)
                        end
                        if VehicleSeat then
                            if typeof(gal_p2_91) ~= "CFrame" then
                                gal_p1_91:GetCordinateCFrame(gal_p2_91, gal_l752)
                            end
                            if (gal_l747.Position - gal_p2_91.Position).Magnitude < 50 then
                                return true, gal_p1_91:StopMovingBoat()
                            end
                            return true, gal_p1_91:MoveBoat(gal_l747, gal_p2_91)
                        end
                        return
                    end
                    return gal_p1_91:BuyNewBoat() 
                end
                D.GetSeaEvents = function(gal_p1_92, gal_p2_92, gal_p3_92, gal_p4_92, ...)
                    for gal_l756 = 1, #gal_p2_92 do
                        local gal_l757 = gal_p2_92[gal_l756]
                        local gal_l758 = gal_p3_92[gal_l757]
                        while gal_l758 do
                            while not gal_l758 do
                                return gal_l758 
                            end
                            gal_p1_92:GetSeaEvent(gal_l757) 
                        end
                        while not gal_p4_92 do end 
                    end
                    return 
                end
                D.GetSeaBeast = function(gal_p1_93, ...)
                    local SeaBeast = gal_p1_93.SeaBeast
                    local gal_l766 = gal129(SeaBeast)
                    if gal_l766 then
                        return SeaBeast
                    end
                    if not SeaBeasts:FindFirstChildOfClass("Model") then
                        return nil
                    end
                    local gal_l772 = SeaBeasts[1]
                    for gal_l773, gal_l774 in ipairs(gal_l772:GetChildren()) do
                        local PrimaryPart = gal_l774.PrimaryPart
                        while PrimaryPart do
                            local gal_l780 = gal129(gal_l774)
                            while not gal_l780 do
                                while not gal_l780 do end 
                            end 
                        end 
                    end
                    gal_p1_93.SeaBeast = nil
                    return nil 
                end
                D.GetSeaEvent = function(gal_p1_94, gal_p2_94, ...)
                    if gal_p2_94 == "Sea Beast" then
                        return gal_p1_94:GetSeaBeast()
                    end
                    local gal_l789 = U[gal_l1107]
                    local gal_l790 = gal_l789:FindFirstChild(gal_p2_94)
                    while not gal_l790 do
                        while gal_l790 do
                            while gal_l783 do
                                table.insert(gal_l783, gal_l790)
                                gal_l790.Name = "Died" 
                            end 
                        end
                        if gal_l793[2] then
                            for gal_l794 = 1, #gal_l793[2] do
                                gal_l793[2][gal_l794].Name = gal_p2_94 
                            end
                            break
                        end
                        return gal_l793 
                    end
                    local gal_l795 = not gal129(gal_l793) 
                end
                D.attackSeaEvent = function(gal_p1_95, gal_p2_95, ...)
                    if gal_p2_95:GetAttribute("IsBoat") then
                        return gal_p1_95:attackSeaBoat(gal_p2_95)
                    end
                    if gal_p2_95.Parent == U[gal_l1091] then
                        return gal_p1_95:attackSeaBeast(gal_p2_95)
                    end
                    return gal_p1_95:attackSeaEnemy(gal_p2_95) 
                end
                D.attackSeaBoat = function(gal_p1_96, gal_p2_96, ...)
                    if not gal_p2_96.PrimaryPart then
                        return
                    end
                    local gal_l800 = gal_p2_96.PrimaryPart.CFrame + gal138
                    EnableBuso()
                    gal43(gal_l800)
                    gal_p1_96:StopMovingBoat()
                    if LocalPlayer:DistanceFromCharacter(gal_l800.Position) < 35 then
                        gal132(gal_p2_96.PrimaryPart, gal37.SeaSkills)
                        gal133(gal_p1_96:GetRandomWeapon(), true)
                    end
                    return 
                end
                D.attackSeaEnemy = function(gal_p1_97, gal_p2_97, ...)
                    if not gal_p2_97:FindFirstChild("HumanoidRootPart") then
                        return
                    end
                    local HumanoidRootPart = gal_p2_97.HumanoidRootPart
                    local CFrame = HumanoidRootPart.CFrame
                    if (gal_p2_97.Name == "Terrorshark" or gal_p2_97.Name == "Shark") and CFrame:DistanceFromCharacter(CFrame.Position) <= 250 then
                        local gal_l808 = gal_l793 + Vector3.yAxis * ((gal145(gal_p2_97.Name, HumanoidRootPart) and 155 or 0) + 45)
                    else
                    end
                    gal43(CFrame)
                    gal133()
                    EnableBuso()
                    gal_p1_97:StopMovingBoat()
                    return 
                end
                D.attackSeaBeast = function(gal_p1_98, gal_p2_98, ...)
                    if not gal_p2_98:FindFirstChild("HumanoidRootPart") then
                        return
                    end
                    local SeaBeastDirections = gal_p1_98.SeaBeastDirections
                    local Position = gal_p2_98.HumanoidRootPart.Position
                    local gal_l814 = CFrame.new(Position.X, 25, Position.Z) + SeaBeastDirections[gal144(#SeaBeastDirections, 1.5)] * 60
                    EnableBuso()
                    gal43(gal_l814)
                    gal_p1_98:StopMovingBoat()
                    gal133(gal_p1_98:GetRandomWeapon(), true)
                    gal132(gal_l814, gal37.SeaSkills)
                    return 
                end
                return gal_l815 
            end
            Managers.FruitManager = function(...)
                local gal_l876 = {
                    RandomDebounce = 0,
                    MoneyToReroll = 0
                }
                local gal146 = gal42.IsAlive
                local gal147 = gal42.Inventory.Count
                local gal_l877 = gal42.Inventory.Unlocked
                D.GetRealFruitName = function(gal_p1_99, gal_p2_99, ...)
                    local gal_l825 = string.gsub(gal_p2_99.Name, " Fruit", "")
                    return gal_l825 .. "-" .. gal_l825 
                end
                D.CanStoreFruit = function(gal_p1_100, gal_p2_100, ...)
                    return gal147[gal_p1_100:GetRealFruitName(gal_p2_100)] < U[gal_l139].Value 
                end
                D.StoreFruit = function(gal_p1_101, gal_p2_101, ...)
                    return U[gal_l54].FireRemote("StoreFruit", gal_p1_101:GetRealFruitName(gal_p2_101), gal_p2_101) 
                end
                D.IsFruit = function(gal_p1_102, gal_p2_102, ...)
                    return string.sub(gal_p2_102.Name, -6, -1) == " Fruit" and gal_p2_102:GetAttribute("DroppedBy") 
                end
                D.GetInventoryItems = function(gal_p1_103, ...)
                    local Backpack = U[gal_l170].Backpack
                    local gal_l833 = Backpack:GetChildren()
                    local Character = U[gal_l170].Character
                    local Tool = Character:FindFirstChildOfClass("Tool")
                    if Tool then
                        table.insert(gal_l833, Tool)
                    end
                    return gal_l833 
                end
                D.CanBuyMicrochip = function(gal_p1_104, ...)
                    if not gal146(U[gal_l170].Character) then
                        return false
                    end
                    local gal_l837 = U[gal_l170]
                    if gal_l837:GetAttribute("IslandRaiding") then
                        return false
                    end
                    local Backpack = U[gal_l170].Backpack
                    if Backpack:FindFirstChild("Microchip") or Backpack:FindFirstChild("Microchip") then
                        return false
                    end
                    local GetInventoryItems = gal_p1_104.GetInventoryItems
                    local gal_l840 = {
                        GetInventoryItems(gal_p1_104)
                    }
                    local gal_l842 = GetInventoryItems[1]
                    for gal_l843, gal_l844 in ipairs(j(gal_l842)) do
                        local gal_l846 = gal_l844:IsA("Tool")
                        while not gal_l846 do
                            while not gal_l846 do end
                            return true 
                        end 
                    end
                    return -1 
                end
                D.GetStorableFruit = function(gal_p1_105, gal_p2_105, ...)
                    if not gal146(LocalPlayer.Character) then
                        return false
                    end
                    local GetInventoryItems = gal_p1_105.GetInventoryItems
                    local gal_l851 = {
                        GetInventoryItems(gal_p1_105)
                    }
                    local gal_l853 = GetInventoryItems[1]
                    for gal_l854, gal_l855 in gal_l853, ipairs(j(gal_l853)) do
                        if not gal146(LocalPlayer.Character) then
                            break
                        end 
                    end
                    return 
                end
                D.RerollRandomFruit = function(gal_p1_106, ...)
                    local Value = Level.Value
                    if Value < 50 then
                        local gal_l860 = Level:GetPropertyChangedSignal("Value")
                        return gal_l860:Wait()
                    end
                    local gal_l861 = Beli.Value
                    if gal_l861 < gal_p1_106.MoneyToReroll then
                        local gal_l863 = Beli:GetPropertyChangedSignal("Value")
                        return gal_l863:Wait()
                    end
                    if tick() - gal_p1_106.RandomDebounce >= 1 then
                        local gal_l865 = gal42.FireRemote("Cousin", "Buy")
                        if gal_l865 == 1 then
                            gal_p1_106.RandomDebounce = tick() + 7200
                        else
                            if gal_l865 == 2 then
                                local gal_l866 = {
                                    Level.FireRemote("Cousin", "Check")
                                }
                                gal_p1_106.MoneyToReroll = gal_l866[3] or 0
                            else
                                if type(gal_l865) == "string" and gal_l865:match("%d%d:%d%d") then
                                    local gal_l871 = {
                                        gal_l865:match("(%d+):(%d+)")
                                    }
                                    local gal_l872 = tonumber(gal_l865:match("(%d+):(%d+)"))
                                    if gal_l872 then
                                        gal_p1_106.RandomDebounce = tick() + gal_l871 * 60 * 60 + gal_l869 * 60
                                    end
                                else
                                    gal_p1_106.RandomDebounce = tick() + 5
                                end
                            end
                        end
                    end
                    return 
                end
                return gal_l876 
            end
            gal48.RunModules = function(gal_p1_107, ...)
                local gal_l878 = next
                local gal_l879 = gal_p1_107.Managers
                local gal_l880, gal_l881 = gal_l878(gal_l879, gal_l865), nil
                while gal_l880 do
                    while pcall(294) do
                        gal_p1_107.Managers[gal_l880] = gal_l774
                        gal32[gal_l880] = gal_l774 
                    end
                    gal32[gal_l880] = nil
                    warn("falha ao carregar Module [ redz hub ]: " .. gal_l880 .. " : " .. gal_l779[2]) 
                end
                return 
            end
            gal48.Initialize = function(gal_p1_108, ...)
                local gal_l882 = gal_p1_108
                local gal41 = gal1.load("{Owner}Library/refs/heads/main/V5/Source.lua")()
                local gal42 = gal1.load("{Utils}BloxFruits/Module.luau", " return Module")(gal37, rz_connections)
                local gal_l883 = gal48
                gal_l883:RunModules()
                return 
            end
            gal48.LoadTabs = function(gal_p1_109, gal_p2_109, ...)
                local gal_l884 = gal_p2_109
                local gal_l885 = gal_p1_109
                return {
                    Discord = gal_l884:MakeTab({
                        "Discord",
                        "Info"
                    }),
                    MainFarm = gal_l884:MakeTab({
                        "Farm",
                        "Home"
                    }),
                    Sea = gal_l884:MakeTab({
                        "Sea",
                        "Waves"
                    }),
                    Islands = gal_l884:MakeTab({
                        "Islands",
                        "PalmTree"
                    }),
                    Items = gal_l884:MakeTab({
                        "Quests/Items",
                        "Swords"
                    }),
                    FruitRaid = gal_l884:MakeTab({
                        "Fruit/Raid",
                        "Cherry"
                    }),
                    Stats = gal_l884:MakeTab({
                        "Stats",
                        "Signal"
                    }),
                    Teleport = gal_l884:MakeTab({
                        "Teleport",
                        "Locate"
                    }),
                    Status = gal_l884:MakeTab({
                        "Status",
                        "scroll"
                    }),
                    Visual = gal_l884:MakeTab({
                        "Visual",
                        "User"
                    }),
                    Shop = gal_l884:MakeTab({
                        "Shop",
                        "ShoppingCart"
                    }),
                    Misc = gal_l884:MakeTab({
                        "Misc",
                        "Settings"
                    })
                } 
            end
            gal48.InstallPlugin = function(gal_p1_110, ...)
                local gal_l886 = gal_p1_110
                return {
                    Toggle = gal42.RunFunctions.LibraryToggle(gal_l37, gal33)
                } 
            end
            gal48.GetTranslation = function(gal_p1_111, gal_p2_111, ...)
                local gal_l887 = gal_p1_111
                local gal_l888 = gal_p2_111
                local gal_l889 = {
                    BR = "Portuguese.json",
                    VN = "Vietnamese.json",
                    TH = "Thai.json"
                }
                local gal_l890 = gal_l889[gal_l888]
                if gal_l890 then
                    local gal_l891 = HttpService
                    return gal_l891:JSONDecode(gal1.get("{Translator}BloxFruits/" .. gal_l889[gal_l888]))
                end
                return 
            end
            gal48.Translator = function(gal_p1_112, gal_p2_112, ...)
                local gal_l898 = gal_p2_112
                local gal_l899 = gal_p1_112
                if not gal2.Translator then
                    return gal_l898
                end
                local gal_l900 = {
                    pcall(function(...)
                        local gal_l892 = readfile and pcall(readfile, "PlayerCountry.txt")
                        if gal_l892 then
                            return nil, true
                        end
                        return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer) 
                    end)
                }
                local gal_l901 = gal_l900[3]
                local gal_l902 = pcall(function(...)
                    local gal_l895 = readfile and pcall(readfile, "PlayerCountry.txt")
                    if gal_l895 then
                        return nil, true
                    end
                    return LocalizationService:GetCountryRegionForPlayerAsync(LocalPlayer) 
                end)
                local gal_l903 = gal_l900[2]
                if gal_l902 then
                    if gal_l903 then
                        local gal_l904 = pcall
                        local gal_l905 = gal_l900[3] ~= true and writefile
                    end
                    local gal_l906 = pcall
                    local gal_l907 = gal_l903
                end
                if gal_l902 then
                    pcall(writefile, "PlayerCountry.txt", gal_l903)
                end
                local gal_l908 = gal_l902 and gal_l899:GetTranslation(gal_l903)
                if gal_l908 then
                    return gal42.RunFunctions.Translator(gal_l898, gal_l908)
                end
                return gal_l898 
            end
            gal48.LoadLibrary = function(gal_p1_113, ...)
                local gal148 = gal_p1_113
                local gal_l921 = gal41
                local gal_l922 = gal_l921:MakeWindow({
                    "redz Hub : Blox Fruits",
                    "by real_redz",
                    "redzHub-BloxFruits.json"
                })
                local gal_l923 = gal148
                local gal_l924 = gal148
                gal_l924:Translator(gal_l922)
                local gal_l925 = gal148
                local gal_l926 = gal_l925:LoadTabs(gal_l922)
                local gal149 = gal148.Managers.FruitManager
                local gal_l927 = gal148.Managers.QuestManager
                local gal_l928 = gal148.Managers.FarmManager
                local gal150 = gal42.FireRemote
                local gal151 = gal42.Inventory.Count
                local gal152 = gal42.Inventory.Unlocked
                local gal_l929 = gal42.GameData.Sea
                local gal_l930 = gal_l925:InstallPlugin(gal_l922).Toggle
                gal_l922:SelectTab(gal_l926.MainFarm)
                gal_l922:AddMinimizeButton({
                    Button = {
                        Image = "rbxassetid://15298567397",
                        BackgroundTransparency = 0
                    },
                    Corner = {
                        CornerRadius = UDim.new(0, 6)
                    }
                })
                local gal_l931 = gal_l926.Discord
                gal_l931:AddDiscordInvite({
                    Name = "redz Hub | Community",
                    Description = "Join our discord community to receive Information about the next update, leaks, and Information about Blox Fruits!",
                    Logo = "rbxassetid://17382040552",
                    Invite = "https://discord.gg/7aR7kNVt4g"
                })
                local gal_l932 = gal_l926.MainFarm
                local gal153 = {
                    Bigger = 380,
                    Large = 450,
                    Medium = 620,
                    Small = 760
                }
                local function gal_l910(gal_p1_114, ...)
                    U[gal_l1102].TradeBones = gal_p1_114
                    while U[gal_l1102].TradeBones do
                        task.wait()
                        while gal151.Bones >= 50 do
                            repeat
                                U[gal_l589]("Bones", "Buy", 1, 1)
                            until gal151.Bones == U[gal_l170].Bones
                            task.wait(5) 
                        end
                        task.wait(.5) 
                    end
                    return 
                end
                local function gal_l912(...)
                    local gal_l913 = {}
                    local gal_l914 = U[gal_l54]
                    local gal_l916 = gal_l914[1]
                    for gal_l918, gal_l919 in pairs(gal_l916) do
                        if U[gal_l54].Enemies.IsSpawned(gal_l918) then
                            table.insert(gal_l913, U[gal_l54])
                        end 
                    end
                    gal154:Set(gal_l913)
                    return 
                end
                gal_l932:AddDropdown({
                    "Select Tool",
                    {
                        "Melee",
                        "Sword",
                        "Blox Fruit",
                        "Gun"
                    },
                    "Melee",
                    {
                        gal37,
                        "FarmTool"
                    },
                    "FarmTool"
                })
                gal_l932:AddDropdown({
                    "UI Scale",
                    {
                        "Small",
                        "Medium",
                        "Large",
                        "Bigger"
                    },
                    "Large",
                    function(gal_p1_115, ...)
                        pcall(gal41.SetScale, gal41, gal153[gal_p1_115] or 450)
                        return 
                    end,
                    "UIScale"
                })
                gal_l932:AddSection("Farm")
                gal_l930(gal_l932, {
                    "Auto Farm Level",
                    "Level Farm"
                }, "Level")
                gal_l930(gal_l932, {
                    "Auto Farm Nearest",
                    "Farm Nearest Mobs"
                }, "Nearest")
                if gal_l929 == 1 then
                else
                    if gal_l929 == 2 then
                        gal_l930(gal_l932, {
                            "Auto Factory",
                            "Spawns Every 1:30 [hours, minutes]"
                        }, "Factory")
                        gal_l932:AddSection("Ectoplasm")
                        gal_l930(gal_l932, {
                            "Auto Farm Ectoplasm"
                        }, "Ectoplasm")
                    else
                        if gal_l929 == 3 then
                        end
                        gal_l932:AddSection("Chest")
                        gal_l930(gal_l932, {
                            "Auto Chest [ Tween ]"
                        }, "ChestTween")
                        gal_l932:AddSection("Bosses")
                        gal_l932:AddButton({
                            "Update Boss List",
                            gal_l912
                        })
                        local gal154 = gal_l932:AddDropdown({
                            "Boss List",
                            {},
                            false,
                            {
                                gal37,
                                "BossSelected"
                            },
                            "B-Selected"
                        })
                        gal_l912()
                        gal_l930(gal_l932, {
                            "Auto Kill Boss Selected",
                            "Kill boss Selected"
                        }, "BossSelected")
                        gal_l930(gal_l932, {
                            "Auto Farm All Bosses",
                            "Kill all bosses Spawned"
                        }, "AllBosses")
                        gal_l932:AddToggle({
                            "Take Boss Quest",
                            true,
                            {
                                gal37,
                                "BossQuest"
                            },
                            "B-Quest"
                        })
                        gal_l932:AddSection("Material")
                        gal_l932:AddDropdown({
                            "Material List",
                            U[gal_l913].Managers.FarmManager.Materials,
                            false,
                            {
                                gal37,
                                "fMaterial"
                            },
                            "S-Material"
                        })
                        gal_l930(gal_l932, {
                            "Auto Farm Material",
                            "Farm material Selected"
                        }, "Material")
                        gal_l932:AddSection("Mastery")
                        gal_l932:AddSlider({
                            "Select Enemy Health [ % ]",
                            10,
                            100,
                            1,
                            25,
                            {
                                gal37,
                                "mHealth"
                            },
                            "M-Health"
                        })
                        gal_l932:AddDropdown({
                            "Select Tool",
                            {
                                "Blox Fruit",
                                "Gun"
                            },
                            {
                                "Blox Fruit"
                            },
                            {
                                gal37,
                                "mTool"
                            },
                            "M-Tool"
                        })
                        gal_l932:AddDropdown({
                            "Select Skills",
                            {
                                "Z",
                                "X",
                                "C",
                                "V",
                                "F"
                            },
                            CreateDictionary({
                                "Z",
                                "X",
                                "C",
                                "V"
                            }, true),
                            {
                                gal37,
                                "MasterySkills"
                            },
                            "M-Skills",
                            MultiSelect = true
                        })
                        gal_l930(gal_l932, {
                            "Auto Farm Mastery"
                        }, "Mastery")
                        local gal_l933 = gal_l926.Sea
                        if gal_l929 == 1 then
                            gal_l933:Destroy()
                        else
                            local gal_l934 = 2
                            if gal_l929 == gal_l934 then
                                gal_l933:AddSection("Farm")
                                gal_l779.Toggle(gal_l933, {
                                    "Auto Farm Sea"
                                }, "Sea")
                                gal_l933:AddToggle({
                                    "Auto Drive Boat",
                                    true,
                                    {
                                        gal37,
                                        "autoDriveBoat"
                                    },
                                    "A-TweenBoat"
                                })
                                gal_l933:AddSection("Farm Select")
                                gal_l933:AddDropdown({
                                    "Enemies",
                                    {
                                        "Sea Beast",
                                        "PirateBrigade"
                                    },
                                    CreateDictionary({
                                        "Sea Beast"
                                    }, true),
                                    {
                                        gal37,
                                        "seaEnemy"
                                    },
                                    "S-Enemies",
                                    MultiSelect = true
                                })
                                gal_l933:AddDropdown({
                                    "Select Skills",
                                    {
                                        "Z",
                                        "X",
                                        "C",
                                        "V",
                                        "F"
                                    },
                                    CreateDictionary({
                                        "Z",
                                        "X",
                                        "C",
                                        "V"
                                    }, true),
                                    {
                                        gal37,
                                        "SeaSkills"
                                    },
                                    "S-Skills",
                                    MultiSelect = true
                                })
                                gal_l933:AddSection("Configs")
                                gal_l933:AddSlider({
                                    "Boat Tween Speed",
                                    100,
                                    300,
                                    10,
                                    250,
                                    {
                                        gal37,
                                        "BoatSpeed"
                                    },
                                    "S-BoatSpeed"
                                })
                                gal_l933:AddToggle({
                                    "Auto Repair Boat [ BETA ]",
                                    false,
                                    {
                                        gal37,
                                        "RepairBoat"
                                    },
                                    "S-RepairBoat"
                                })
                            else
                                if gal_l929 == 3 then
                                    local gal156 = {
                                        ["Shipwright Teacher"] = CFrame.new(-16526, 76, 309),
                                        ["Shark Hunter"] = CFrame.new(-16526, 108, 752),
                                        ["Beast Hunter"] = CFrame.new(-16281, 73, 263),
                                        Spy = CFrame.new(-16471, 528, 539)
                                    }
                                    gal_l933:AddSection("Sea")
                                    gal_l930(gal_l933, {
                                        "Auto Farm Sea"
                                    }, "Sea")
                                    gal_l933:AddToggle({
                                        "Auto Drive Boat",
                                        true,
                                        {
                                            gal37,
                                            "autoDriveBoat"
                                        },
                                        "A-TweenBoat"
                                    })
                                    gal_l933:AddSection("Farm Select")
                                    gal_l933:AddDropdown({
                                        "Fish",
                                        {
                                            "Sea Beast",
                                            "Terrorshark",
                                            "Fish Crew Member",
                                            "Piranha",
                                            "Shark"
                                        },
                                        CreateDictionary({
                                            "Terrorshark",
                                            "Fish Crew Member",
                                            "Piranha",
                                            "Shark"
                                        }, true),
                                        {
                                            gal37,
                                            "fishSelected"
                                        },
                                        "S-Fish",
                                        MultiSelect = true
                                    })
                                    gal_l933:AddDropdown({
                                        "Boats",
                                        {
                                            "PirateBrigade",
                                            "PirateGrandBrigade",
                                            "GhostShip",
                                            "FishBoat"
                                        },
                                        nil,
                                        {
                                            gal37,
                                            "boatSelected"
                                        },
                                        "S-Boat",
                                        MultiSelect = true
                                    })
                                    gal_l933:AddDropdown({
                                        "Select Skills",
                                        {
                                            "Z",
                                            "X",
                                            "C",
                                            "V",
                                            "F"
                                        },
                                        CreateDictionary({
                                            "Z",
                                            "X",
                                            "C",
                                            "V"
                                        }, true),
                                        {
                                            gal37,
                                            "SeaSkills"
                                        },
                                        "S-Skills",
                                        MultiSelect = true
                                    })
                                    gal_l933:AddSection("Configs")
                                    gal_l933:AddDropdown({
                                        "Sea Level",
                                        {
                                            "1",
                                            "2",
                                            "3",
                                            "4",
                                            "5",
                                            "6",
                                            "inf"
                                        },
                                        "6",
                                        {
                                            gal37,
                                            "SeaLevel"
                                        },
                                        "S-SeaLevel"
                                    })
                                    gal_l933:AddSlider({
                                        "Boat Tween Speed",
                                        100,
                                        300,
                                        10,
                                        250,
                                        {
                                            gal37,
                                            "BoatSpeed"
                                        },
                                        "S-BoatSpeed"
                                    })
                                    gal_l933:AddToggle({
                                        "Auto Repair Boat [ BETA ]",
                                        false,
                                        {
                                            gal37,
                                            "RepairBoat"
                                        },
                                        "S-RepairBoat"
                                    })
                                    gal_l933:AddSection("NPCs")
                                    gal_l933:AddDropdown({
                                        "Select NPC",
                                        {
                                            "Shipwright Teacher",
                                            "Shark Hunter",
                                            "Beast Hunter",
                                            "Spy"
                                        },
                                        "Spy",
                                        {
                                            gal37,
                                            "selectedNpc"
                                        }
                                    })
                                    local gal155 = gal_l933:AddToggle({
                                        "Teleport to NPC",
                                        false,
                                        function(gal_p1_116, ...)
                                            gal32.teleporting = gal_p1_116
                                            local gal_l1019 = gal32.teleporting
                                            while gal_l1019 do
                                                repeat
                                                    task.wait()
                                                until gal37.selectedNpc
                                                gal43(gal156[gal37.selectedNpc]) 
                                            end
                                            if gal_p1_116 then
                                                gal155:Set(false, true)
                                            end
                                            return 
                                        end
                                    })
                                    local gal_l1023 = gal155
                                    gal_l1023:Callback(function(gal_p1_117, ...)
                                        if gal_p1_117 then
                                            TweenManager = gal148.Managers.TweenManager
                                            local gal_l999 = not gal32.teleporting
                                            local gal_l995 = math.huge
                                            if gal_l999 then
                                                repeat
                                                    task.wait()
                                                until TweenManager:GetLastPosition()
                                                TweenManager = LocalPlayer
                                                gal_l995 = TweenManager:DistanceFromCharacter(TweenManager:GetLastPosition())
                                                local gal_l1000 = not gal32.teleporting
                                                gal_l999 = gal_l995 < 15
                                                while gal_l1000 do
                                                    while not gal_l1000 do end
                                                    LocalPlayer.teleporting = false
                                                    break 
                                                end
                                                gal_l999 = gal_l995 < 15
                                            else
                                                gal_l999 = gal_l995 < 15
                                            end
                                        end
                                        return 
                                    end)
                                    gal_l933:AddSection("Quests/Items")
                                    gal_l930(gal_l933, {
                                        "Auto Unlock Shipwright Subclass [ BETA ]"
                                    }, "Shipwright")
                                    gal_l930(gal_l933, {
                                        "Auto Shark Anchor"
                                    }, "SharkAnchor")
                                end
                                local gal157 = gal_l1009.Stats
                                local gal_l1024 = "MaxLevel"
                                local gal_l1025 = Level.Value < gal42.GameData[gal_l1024]
                                if gal_l1025 then
                                    local gal158 = {}
                                    local gal_l1026 = Data
                                    local gal159 = gal_l1026:WaitForChild("Points")
                                    local gal_l1027 = Data
                                    local gal160 = gal_l1027:WaitForChild("Stats")
                                    local gal_l1028 = gal157
                                    gal_l1028:AddSlider({
                                        "Points Amount",
                                        1,
                                        100,
                                        1,
                                        3,
                                        {
                                            gal37,
                                            "StatsPoints"
                                        },
                                        "P-Stats"
                                    })
                                    local gal_l1029 = gal157
                                    gal_l1029:AddToggle({
                                        "Auto Stats",
                                        false,
                                        function(gal_p1_118, ...)
                                            gal32.AutoStats = gal_p1_118
                                            gal_l995 = task.wait()
                                            while not gal_l995 do
                                                while gal_l995 do
                                                    gal_l999 = nil
                                                    for gal_l999, gal_l1002 in gal_l999, pairs(gal_l999) do
                                                        while not gal_l1002 do
                                                            while not gal_l1002 do end
                                                            gal_l1021 = math.clamp
                                                            gal150("AddPoint", gal_l999, gal_l1021(math.clamp(gal37.StatsPoints or 3, 0, task[gal_l999]), 0, gal42.GameData.MaxLevel)) 
                                                        end 
                                                    end 
                                                end
                                                return 
                                            end
                                            AutoStats = gal32.AutoStats 
                                        end,
                                        "A-Stats"
                                    })
                                    local gal_l1030 = gal157
                                    gal_l1030:AddSection("Select Stats")
                                    table.foreach({
                                        "Melee",
                                        "Defense",
                                        "Gun",
                                        "Sword",
                                        "Demon Fruit"
                                    }, function(gal_p1_119, gal_p2_119, ...)
                                        gal157:AddToggle({
                                            gal_p2_119,
                                            false,
                                            {
                                                gal158,
                                                gal_p2_119
                                            },
                                            "Stats-" .. gal_p2_119
                                        })
                                        return 
                                    end)
                                else
                                    local gal_l1031 = gal157
                                    gal_l1031:Destroy()
                                end
                                local gal161 = gal_l1009.Islands
                                local gal_l1032 = gal_l929 == 3
                                if gal_l1032 then
                                    local gal_l1043 = gal161
                                    local function gal_l1027(gal_p1_120, gal_p2_120, ...)
                                        local gal_l1035 = gal161:AddParagraph({
                                            gal_p1_120 .. " : not Spawn"
                                        })
                                        local gal_l1037 = gal_p2_120 and gal_l1035
                                        local gal_l1038 = string.gsub(gal_p1_120, " ", "")
                                        local gal_l1039 = task.wait
                                        while gal_l1039() do
                                            while Map:FindFirstChild(gal_l1038) do
                                                local gal_l1041 = U[gal_l142[6]]
                                                gal_l1037:SetTitle(gal_p1_120 .. " : Spawned | Distance : " .. math.floor(gal_l1041:DistanceFromCharacter(Map:FindFirstChild(gal_l1038).WorldPivot.Position) / 5)) 
                                            end
                                            gal_l1035:SetTitle(gal_p1_120 .. " : not Spawn")
                                            local ChildAdded = Map.ChildAdded
                                            ChildAdded:Wait() 
                                        end
                                        return 
                                    end
                                    gal_l1043:AddSection("Islands Stats")
                                    task.spawn(gal_l1027, "Mirage Island", "MysticIsland")
                                    task.spawn(gal_l1027, "Kitsune Island")
                                    task.spawn(gal_l1027, "Prehistoric Island")
                                    local gal_l1044 = gal161
                                    gal_l1044:AddSection("Prehistoric Island")
                                    gal_l930(gal161, {
                                        "Auto Craft Volcanic Magnet"
                                    }, "CraftVolcanicMagnet")
                                    gal_l930(gal161, {
                                        "Teleport to Prehistoric Island"
                                    }, "GotoVolcano")
                                    gal_l930(gal161, {
                                        "Fully Prehistoric Island"
                                    }, "FullyVolcano")
                                    local gal_l1045 = gal161
                                    gal_l1045:AddToggle({
                                        "Ignore Collect Bones [ Fully ]",
                                        false,
                                        {
                                            gal37,
                                            "IgnoreBones"
                                        },
                                        "IgnoreBones"
                                    })
                                    local gal_l1046 = gal161
                                    gal_l1046:AddToggle({
                                        "Ignore Collect Dragon Egg [ Fully ]",
                                        false,
                                        {
                                            gal37,
                                            "IgnoreEggs"
                                        },
                                        "IgnoreEggs"
                                    })
                                    local gal_l1047 = gal161
                                    gal_l1047:AddToggle({
                                        "Reset character after Finishing [ Fully ]",
                                        false,
                                        {
                                            gal37,
                                            "VolcanoReset"
                                        },
                                        "VolcanoReset"
                                    })
                                    local gal_l1048 = gal161
                                    gal_l1048:AddSection("Leviathan [ BETA ]")
                                    gal_l930(gal161, {
                                        "Auto Attack Leviathan"
                                    }, "Leviathan")
                                    local gal_l1049 = gal161
                                    gal_l1049:AddSection("Kitsune Island")
                                    local gal_l1050 = gal161
                                    gal_l1050:AddSlider({
                                        "Trade Azure Ember Amount",
                                        10,
                                        25,
                                        5,
                                        20,
                                        {
                                            gal37,
                                            "Azure"
                                        },
                                        "A-Amount"
                                    })
                                    local gal_l1051 = gal161
                                    gal_l1051:AddToggle({
                                        "Auto Trade Azure Ember",
                                        false,
                                        function(gal_p1_121, ...)
                                            gal32.TradeAzure = gal_p1_121
                                            while gal32.TradeAzure do
                                                gal_l1036 = Lighting:GetAttribute("IsBlueMoon")
                                                while not gal_l1036 do
                                                    while not gal_l1036 do
                                                        task.wait(1) 
                                                    end
                                                    gal_l1042 = Net["RF/KitsuneStatuePray"]
                                                    gal_l1042:InvokeServer() 
                                                end
                                                gal_l1036 = not gal_l1036:GetAttribute("BlueMoonEnded") 
                                            end
                                            return 
                                        end
                                    }, "Trade-Azure")
                                    gal_l930(gal161, {
                                        "Auto Kitsune Island"
                                    }, "KitsuneIsland")
                                    local gal_l1052 = gal161
                                    gal_l1052:AddSection("Mirage Island")
                                    gal_l930(gal161, {
                                        "Teleport To Gear"
                                    }, "MirageGear")
                                    gal_l930(gal161, {
                                        "Teleport To Mirage"
                                    }, "TeleportMirage")
                                    gal_l930(gal161, {
                                        "Teleport To Fruit Dealer"
                                    }, "MirageFruitDealer")
                                    gal_l930(gal161, {
                                        "Collect Mirage Chests"
                                    }, "MirageChests")
                                    local gal_l1053 = gal161
                                    gal_l1053:AddToggle({
                                        "Look To Moon",
                                        false,
                                        function(gal_p1_122, ...)
                                            gal32.LookMoon = gal_p1_122
                                            while gal32.LookMoon do
                                                CurrentCamera.CFrame = CFrame.new(CurrentCamera.CFrame.Position, Lighting:GetMoonDirection() + CurrentCamera.CFrame.Position)
                                                task.wait() 
                                            end
                                            return 
                                        end,
                                        "MirageLookMoon"
                                    })
                                else
                                    local gal_l1054 = gal161
                                    gal_l1054:Destroy()
                                end
                                local gal_l1055 = gal_l1009.FruitRaid
                                local gal162 = {
                                    "Rocket",
                                    "Spin",
                                    "Blade",
                                    "Spring",
                                    "Bomb",
                                    "Smoke",
                                    "Spike"
                                }
                                local gal163 = true
                                gal_l1055:AddSection("Fruits")
                                gal_l1055:AddToggle({
                                    "Auto Store Fruits",
                                    false,
                                    function(gal_p1_123, ...)
                                        gal32.auto_store = gal_p1_123
                                        gal_l1042 = gal32.auto_store
                                        while gal_l1042 do
                                            gal_l1042 = task.wait
                                            gal_l1042(gal37.SmoothMode and .3 or .2)
                                            gal163 = false
                                            gal_l999 = not LocalPlayer:GetAttribute("IslandRaiding")
                                            while not gal_l999 do
                                                while gal149:GetStorableFruit(gal_l999) do
                                                    gal149:StoreFruit(gal149:GetStorableFruit(gal_p1_123)) 
                                                end
                                                gal163 = true 
                                            end
                                            gal_l1001 = gal32.unstore_common_fruits
                                            while not gal_l1001 do end 
                                        end
                                        gal163 = true
                                        return 
                                    end,
                                    "F-AutoStore"
                                })
                                gal_l930(gal_l1055, {
                                    "Teleport To Fruits"
                                }, "Fruits")
                                gal_l1055:AddToggle({
                                    "Auto Random Fruit",
                                    false,
                                    function(gal_p1_124, ...)
                                        U[gal_l1102].random_fruit = gal_p1_124
                                        while U[gal_l1102].random_fruit do
                                            gal149:RerollRandomFruit()
                                            task.wait(.1) 
                                        end
                                        return 
                                    end,
                                    "F-RandomFruit"
                                })
                                gal_l1055:AddSection("Raid")
                                gal_l932:AddDropdown({
                                    "Boss List",
                                    {},
                                    false,
                                    {
                                        gal37,
                                        "BossSelected"
                                    },
                                    "B-Selected"
                                })
                                if gal_l929 ~= 2 and gal_l929 ~= 3 then
                                    gal_l1055:AddParagraph({
                                        "Only on Sea 2 and 3"
                                    })
                                else
                                    gal_l1055:AddDropdown({
                                        "Select Chip",
                                        gal42.RaidList,
                                        "",
                                        {
                                            gal37,
                                            "SelectedChip"
                                        },
                                        "R-RaidChip"
                                    })
                                    gal_l779.Toggle(gal_l1055, {
                                        "Auto Farm Raid",
                                        "Kill Aura, Start & Awaken"
                                    }, "Raid")
                                    gal_l1055:AddToggle({
                                        "Auto Buy Chip",
                                        false,
                                        function(gal_p1_125, ...)
                                            gal32.raid_microchip = gal_p1_125
                                            while gal32.raid_microchip do
                                                while not gal163 do
                                                    task.wait() 
                                                end
                                                while gal149:CanBuyMicrochip() do
                                                    gal150("RaidsNpc", "Select", gal37.SelectedChip) 
                                                end
                                                task.wait(.1) 
                                            end
                                            return 
                                        end,
                                        "R-BuyChip"
                                    })
                                    gal_l1055:AddToggle({
                                        "Unstore Common Fruits",
                                        false,
                                        function(gal_p1_126, ...)
                                            gal32.unstore_common_fruits = gal_p1_126
                                            while gal32.unstore_common_fruits do
                                                gal_l1038 = gal149:CanBuyMicrochip() == -1
                                                while not gal_l1038 do
                                                    while not gal_l1038 do
                                                        task.wait(.25) 
                                                    end
                                                    for gal_l1056 = 1, #gal162 do
                                                        gal_l1041 = gal162[gal_l1038]
                                                        gal_l1007 = gal_l1041 .. "-" .. gal_l1041
                                                        local Character = LocalPlayer.Character
                                                        gal_l779 = Character:FindFirstChild(gal_l1007)
                                                        while gal_l779 do
                                                            while gal_l779 do end
                                                            while gal151[gal_l1007] > 0 do
                                                                gal150("LoadFruit", gal_l1007) 
                                                            end 
                                                        end
                                                        Character = LocalPlayer.Backpack
                                                        gal_l779 = Character:FindFirstChild(gal_l1007) 
                                                    end 
                                                end 
                                            end
                                            return 
                                        end,
                                        "R-Unstore"
                                    })
                                end
                                tQ[17] = 439
                                local gal_l1057 = gal_l1009.Teleport
                                tQ[13] = -11576
                                tQ[9] = -10988
                                local gal166 = CFrame.new(28286, 14897, 103)
                                tQ[12] = 14
                                tQ[10] = 50
                                tQ[2] = 275
                                tQ[7] = 5528
                                tQ[11] = -10232
                                tQ[1] = -310
                                tQ[4] = 332
                                tQ[15] = -14076
                                tQ[8] = 79
                                tQ[5] = -8658
                                tQ[1] = "CFrame"
                                tQ[1] = "new"
                                tQ[3] = -7008
                                tQ[1] = 2683
                                tQ[3] = "CFrame"
                                tQ[2] = Env[tQ[3]]
                                tQ[3] = "new"
                                tQ[1] = tQ[2][tQ[3]]
                                tQ[3] = -12528
                                tQ[2] = tQ[1](tQ[3], tQ[4], tQ[5])
                                tQ[6] = 142
                                tQ[1] = "Haunted Castle"
                                tQ[5] = "CFrame"
                                tQ[4] = Env[tQ[5]]
                                tQ[5] = "new"
                                tQ[3] = tQ[4][tQ[5]]
                                tQ[5] = -9517
                                tQ[4] = tQ[3](tQ[5], tQ[6], tQ[7])
                                tQ[7] = "CFrame"
                                tQ[3] = "Ice Cream Island"
                                tQ[6] = Env[tQ[7]]
                                tQ[7] = "new"
                                tQ[5] = tQ[6][tQ[7]]
                                tQ[14] = 10
                                tQ[7] = -902
                                tQ[6] = tQ[5](tQ[7], tQ[8], tQ[9])
                                tQ[9] = "CFrame"
                                tQ[8] = Env[tQ[9]]
                                tQ[9] = "new"
                                tQ[7] = tQ[8][tQ[9]]
                                tQ[5] = "Peanut Island"
                                tQ[9] = -2062
                                tQ[8] = tQ[7](tQ[9], tQ[10], tQ[11])
                                tQ[7] = "Cake Island"
                                tQ[11] = "CFrame"
                                tQ[10] = Env[tQ[11]]
                                tQ[11] = "new"
                                tQ[9] = tQ[10][tQ[11]]
                                tQ[11] = -1897
                                tQ[10] = tQ[9](tQ[11], tQ[12], tQ[13])
                                tQ[9] = "Candy Cane Island"
                                tQ[13] = "CFrame"
                                tQ[12] = Env[tQ[13]]
                                tQ[13] = "new"
                                tQ[11] = tQ[12][tQ[13]]
                                tQ[13] = -1038
                                tQ[12] = tQ[11](tQ[13], tQ[14], tQ[15])
                                tQ[15] = "CFrame"
                                tQ[16] = 9
                                tQ[11] = "Tiki Outpost"
                                tQ[14] = Env[tQ[15]]
                                tQ[15] = "new"
                                tQ[13] = tQ[14][tQ[15]]
                                tQ[15] = -16224
                                tQ[14] = tQ[13](tQ[15], tQ[16], tQ[17])
                                local gal167 = {
                                    ["Middle Town"] = CFrame.new(-688, 15, 1585),
                                    MarineFord = CFrame.new(-4810, 21, 4359),
                                    Marine = CFrame.new(-2728, 25, 2056),
                                    WindMill = CFrame.new(889, 17, 1434),
                                    Desert = CFrame.new(1054, 53, 4490),
                                    ["Snow Island"] = CFrame.new(1298, 87, -1344),
                                    ["Pirate Village"] = CFrame.new(-1173, 45, 3837),
                                    Jungle = CFrame.new(-1614, 37, 146),
                                    Prison = CFrame.new(4870, 6, 736),
                                    ["Under Water Island"] = CFrame.new(61164, 5, 1820),
                                    Colosseum = CFrame.new(-1535, 7, -3014),
                                    ["Magma Village"] = CFrame.new(-5290, 9, 8349),
                                    ["Sky Island 1"] = CFrame.new(-4814, 718, -2551),
                                    ["Sky Island 2"] = CFrame.new(-4652, 873, -1754),
                                    ["Sky Island 3"] = CFrame.new(-7895, 5547, -380),
                                    ["Fountain City"] = CFrame.new(5041, 1, 4101),
                                    ["The Cafe"] = CFrame.new(-382, 73, 290),
                                    ["Frist Spot"] = CFrame.new(-11, 29, 2771),
                                    ["Dark Area"] = CFrame.new(3494, 13, -3259),
                                    ["Flamingo Mansion"] = CFrame.new(-317, 331, 597),
                                    ["Flamingo Room"] = CFrame.new(2285, 15, 905),
                                    ["Green Zone"] = CFrame.new(-2258, 73, -2696),
                                    ["Zombie Island"] = CFrame.new(-5552, 194, -776),
                                    ["Two Snow Mountain"] = CFrame.new(752, 408, -5277),
                                    ["Punk Hazard"] = CFrame.new(-5897, 18, -5096),
                                    ["Cursed Ship"] = CFrame.new(919, 125, 32869),
                                    ["Ice Castle"] = CFrame.new(5505, 40, -6178),
                                    ["Forgotten Island"] = CFrame.new(-3050, 240, -10178),
                                    ["Ussop Island"] = CFrame.new(4816, 8, 2863),
                                    Mansion = CFrame.new(-12471, 374, -7551),
                                    ["Port Town"] = CFrame.new(-345, 21, 5542),
                                    ["Castle On The Sea"] = CFrame.new(-5073, 315, -3153),
                                    ["Hydra Island"] = CFrame.new(5666, 1013, tQ[1]),
                                    ["Great Tree"] = Env[tQ[1]][tQ[1]](tQ[1], tQ[2], tQ[3]),
                                    ["Floating Turtle"] = tQ[2],
                                    [tQ[1]] = tQ[4],
                                    [tQ[3]] = tQ[6],
                                    [tQ[5]] = tQ[8],
                                    [tQ[7]] = tQ[10],
                                    [tQ[9]] = tQ[12],
                                    [tQ[11]] = tQ[14]
                                }
                                gal_l1057:AddSection("Travel")
                                gal_l1057:AddButton({
                                    "Teleport to Sea 1",
                                    function(...)
                                        gal_l1042 = U[gal_l54]
                                        gal_l1042:TravelTo(1)
                                        return 
                                    end,
                                    Desc = "Main"
                                })
                                gal_l1057:AddButton({
                                    "Teleport to Sea 2",
                                    function(...)
                                        gal_l1042 = U[gal_l54]
                                        gal_l1042:TravelTo(2)
                                        return 
                                    end,
                                    Desc = "Dressrosa"
                                })
                                gal_l1057:AddButton({
                                    "Teleport to Sea 3",
                                    function(...)
                                        gal_l1042 = U[gal_l54]
                                        gal_l1042:TravelTo(3)
                                        return 
                                    end,
                                    Desc = "Zou"
                                })
                                gal_l1057:AddSection("Islands")
                                gal_l1057:AddDropdown({
                                    "Select Island",
                                    ({
                                        {
                                            "WindMill",
                                            "Marine",
                                            "Middle Town",
                                            "Jungle",
                                            "Pirate Village",
                                            "Desert",
                                            "Snow Island",
                                            "MarineFord",
                                            "Colosseum",
                                            "Sky Island 1",
                                            "Sky Island 2",
                                            "Sky Island 3",
                                            "Prison",
                                            "Magma Village",
                                            "Under Water Island",
                                            "Fountain City"
                                        },
                                        {
                                            "The Cafe",
                                            "Frist Spot",
                                            "Dark Area",
                                            "Flamingo Mansion",
                                            "Flamingo Room",
                                            "Green Zone",
                                            "Zombie Island",
                                            "Two Snow Mountain",
                                            "Punk Hazard",
                                            "Cursed Ship",
                                            "Ice Castle",
                                            "Forgotten Island",
                                            "Ussop Island"
                                        },
                                        {
                                            "Mansion",
                                            "Port Town",
                                            "Great Tree",
                                            "Castle On The Sea",
                                            "Hydra Island",
                                            "Floating Turtle",
                                            "Haunted Castle",
                                            "Ice Cream Island",
                                            "Peanut Island",
                                            "Cake Island",
                                            "Candy Cane Island",
                                            "Tiki Outpost"
                                        }
                                    })[gal_l929],
                                    "",
                                    {
                                        gal32,
                                        "SelectedIsland"
                                    }
                                })
                                local gal165 = gal_l1057:AddToggle({
                                    "Teleport to Island",
                                    false,
                                    function(gal_p1_127, ...)
                                        gal32.teleporting = gal_p1_127
                                        local gal_l940 = gal32.teleporting
                                        while gal_l940 do
                                            repeat
                                                task.wait()
                                            until gal167[gal32.SelectedIsland]
                                            gal43(gal167[gal32.SelectedIsland]) 
                                        end
                                        if gal_p1_127 then
                                            gal165:Set(false, true)
                                        end
                                        return 
                                    end
                                })
                                local gal_l1058 = gal165
                                gal_l1058:Callback(function(gal_p1_128, ...)
                                    if gal_p1_128 then
                                        TweenManager = gal148.Managers.TweenManager
                                        gal_l1036 = math.huge
                                        gal_l999 = not gal32.teleporting
                                        if gal_l999 then
                                            repeat
                                                task.wait()
                                            until TweenManager:GetLastPosition()
                                            TweenManager = LocalPlayer
                                            gal_l1036 = TweenManager:DistanceFromCharacter(TweenManager:GetLastPosition())
                                            gal_l1000 = not gal32.teleporting
                                            gal_l999 = gal_l1036 < 15
                                            while gal_l1000 do
                                                while not gal_l1000 do end
                                                LocalPlayer.teleporting = false
                                                break 
                                            end
                                            gal_l999 = gal_l1036 < 15
                                        else
                                            gal_l999 = gal_l1036 < 15
                                        end
                                    end
                                    return 
                                end)
                                if gal_l929 == 3 then
                                    gal_l1057:AddSection("Race V4")
                                    gal_l1057:AddButton({
                                        "Teleport to Temple of Time",
                                        function(...)
                                            gal_l1042 = not Map:FindFirstChild("Temple of Time")
                                            if gal_l1042 then
                                                ReplicatedStorage.MapStash["Temple of Time"].Parent = Map
                                            end
                                            for gal_l1059 = 1, 10 do
                                                task.wait()
                                                Character = LocalPlayer.Character
                                                Character:SetPrimaryPartCFrame(gal166) 
                                            end
                                            return 
                                        end
                                    })
                                end
                                local gal168 = gal_l1009.Status
                                local gal169 = gal_l929
                                local gal_l1060 = U[gal_l1059].Managers.FarmManager.Enemies.Elites
                                local gal170 = gal42.Enemies.IsSpawned
                                local gal172 = "\xf0\x9f\x9f\xa2"
                                local gal174 = "\xf0\x9f\x94\xb4"
                                local gal175 = {
                                    "\xf0\x9f\x8c\x91",
                                    "\xf0\x9f\x8c\x98",
                                    "\xf0\x9f\x8c\x97",
                                    "\xf0\x9f\x8c\x96",
                                    "\xf0\x9f\x8c\x95",
                                    "\xf0\x9f\x8c\x94",
                                    "\xf0\x9f\x8c\x93",
                                    "\xf0\x9f\x8c\x92"
                                }
                                local gal176 = {}
                                local gal177 = 0
                                local function HttpGet(...)
                                    local gal_l142 = {
                                        241,
                                        234
                                    }
                                    U[gal_l142[5]] = true
                                    if string.find(U[gal_l142[6]]("CakePrinceSpawner", true) or "Error", U[gal_l142[7]]) then
                                        U[gal_l142[6]]("CakePrinceSpawner")
                                    end
                                    return 
                                end
                                HttpGet(function(...)
                                    local gal_l1059 = gal42:GetProgress("EliteProgress", "EliteHunter", "Progress")
                                    Enemies = gal42.Enemies
                                    local gal_l1056 = Enemies:GetEnemyByTag("Elite")
                                    if gal_l1056 then
                                        return nil
                                    end
                                    return nil 
                                end, gal169 == 3)
                                HttpGet(function(...)
                                    local gal_l142 = {
                                        236,
                                        233,
                                        gal_l54
                                    }
                                    gal_l1056 = gal_l932:AddDropdown({
                                        "Boss List",
                                        {},
                                        false,
                                        {
                                            U[gal_l142[4]],
                                            "BossSelected"
                                        },
                                        "B-Selected"
                                    })
                                    gal_l1059 = gal170("Cake Prince") and "Cake Prince" or gal170("Dough King") and "Dough King"
                                    if gal_l1059 then
                                        return nil
                                    end
                                    gal_l1042 = string.gsub
                                    gal_l1056 = U[gal_l54]
                                    gal_l1056 = gal_l1042(gal_l1056:GetProgress("Katakuri", "CakePrinceSpawner", true), "%D", "")
                                    gal_l1000 = gal_l1056:len() == 0 and "0"
                                    if gal_l1000 then
                                        return "Katakuri: " .. gal_l1000
                                    else
                                        gal_l1036 = gal_l1042(gal_l1056:GetProgress("Katakuri", "CakePrinceSpawner", true), "%D", "")
                                    end 
                                end, gal169 == 3)
                                HttpGet(function(...)
                                    if gal170("Tyrant of the Skies") then
                                        return "Tyrant of the Skies: " .. gal172
                                    end
                                    TikiOutpost = Map.TikiOutpost
                                    for gal_l1061 = 1, 4 do
                                        gal_l1007 = TikiOutpost:FindFirstChild("Eye" .. gal_l1036, true)
                                        while not gal_l1007 do
                                            while not gal_l1007 do end
                                            gal_l1056 = 0 + 1 
                                        end
                                        gal_l1007 = gal_l1007.Transparency == 0 
                                    end
                                    gal_l1042 = "Tyrant of the Skies: %i/4 %s"
                                    return nil 
                                end, gal169 == 3)
                                HttpGet(function(...)
                                    gal_l1042 = U[gal_l54]
                                    gal_l1059 = gal_l1042:GetProgress("Sword Dealer", "LegendarySwordDealer", "1")
                                    if type(gal_l1059) == "string" then
                                        return nil
                                    end
                                    return nil 
                                end, gal169 == 2)
                                HttpGet(function(...)
                                    gal_l1042 = U[gal_l54]
                                    gal_l1000 = {
                                        gal_l1042:GetProgress("BaristaCousin", "ColorsDealer", "1")
                                    }
                                    gal_l1056 = gal_l1042:GetProgress("BaristaCousin", "ColorsDealer", "1")
                                    if type(gal_l1056) == "string" then
                                        return nil
                                    end
                                    return "Barista Cousin: " .. gal174 
                                end)
                                HttpGet(function(...)
                                    gal_l1059 = workspace:FindFirstChild("Fruit ")
                                    if gal_l1059 then
                                        gal_l1042 = U[gal_l54]
                                        gal_l1056 = gal_l1042:GetRealFruitName(gal_l1059)
                                        return nil
                                    end
                                    return "Devil Fruit: " .. gal174 
                                end)
                                HttpGet(function(...)
                                    gal_l1059 = {}
                                    for gal_l1062 = 1, #U[zU].Berries do
                                        task.wait(.1)
                                        gal_l1041 = U[zU].Berries["by real_redz"]
                                        local GetAttributes = gal_l1041.GetAttributes
                                        gal_l779 = {
                                            GetAttributes(gal_l1041)
                                        }
                                        gal_l1007 = GetAttributes[2]
                                        gal_l1010 = GetAttributes[3]
                                        for gal_l1010, gal_l786 in pairs(j("pairs")) do
                                            table.insert(gal_l1059, string.sub(gal_l786, 1, -7)) 
                                        end 
                                    end
                                    if #gal_l1059 > 0 then
                                        return nil
                                    end
                                    return "Berries: " .. gal174 
                                end)
                                HttpGet(function(...)
                                    local gal_l1061 = U[300]
                                    return "Players: " .. #gal_l1061:GetPlayers() .. "/12" 
                                end)
                                HttpGet(function(...)
                                    return nil 
                                end)
                                HttpGet(function(...)
                                    gal_l1059 = Lighting:GetAttribute("MoonPhase")
                                    ClockTime = Lighting.ClockTime
                                    if ClockTime >= 6 and ClockTime < 12 then
                                        gal_l1059 = ClockTime:GetAttribute("MoonPhase") + 1
                                    end
                                    return nil 
                                end, gal169 == 3)
                                gal178 = 1
                                local gal_l1063 = Stepped
                                local gal179 = gal_l1063:Connect(function(...)
                                    if not gal168 or not gal168.Cont then
                                        return gal179:Disconnect()
                                    end
                                    if gal169 == 3 and (gal178 == 1 and tick() - gal177 >= 1) then
                                        if not gal168.Cont.Parent then
                                            U[gal_l943] = tick()
                                        end
                                        local Enemies = U[gal_l54].Enemies
                                        if Enemies:GetEnemyByTag("Elite") then
                                            U[EU] = tick()
                                        end
                                    end
                                    if tick() - gal177 >= 1 and gal168.Cont.Parent then
                                        local gal_l951 = (gal178 >= #gal176 and 0 or gal178) + 1
                                        if gal_l951 >= #gal176 then
                                            U[gal_l943] = tick()
                                        end
                                        if gal_l951 then
                                            gal_l951.Updating = true
                                            local Paragraph = gal_l951.Paragraph
                                            Paragraph:SetTitle(gal_l951.Function())
                                            gal_l951.Updating = false
                                        end
                                    end
                                    return 
                                end)
                                local gal_l1064 = gal_l1009.Visual
                                local gal180 = gal148.Managers.EspManager
                                local gal181 = gal148.Managers.SeaManager
                                local gal182 = {}
                                local gal183 = {
                                    Chest1 = Color3.fromRGB(150, 150, 150),
                                    Chest2 = Color3.fromRGB(255, 255, 0),
                                    Chest3 = Color3.fromRGB(0, 255, 255),
                                    Other = Color3.fromRGB(150, 0, 255)
                                }
                                local gal184 = "My Boat<font color='rgb(170, 170, 0)'> [ %im ]</font>\n<font color='rgb(25, 240, 25)'>[%i/%i]</font>"
                                local gal_l1065 = gal180.new("MyBoat")
                                local gal_l1066 = gal_l1065:SetEspColor(Color3.fromRGB(255, 255, 0))
                                local gal_l1067 = gal_l1066:SetCustomEspDisplay(function(gal_p1_129, gal_p2_129, ...)
                                    if gal_l961 then
                                        return gal184:format(gal_p2_129, gal_l961, gal184)
                                    else
                                    end 
                                end)
                                gal182.MyBoat = gal_l1067:GetInstance(function(...)
                                    return select(1, gal181:GetMyBoat()) 
                                end)
                                local gal_l1068 = gal180.new("Players")
                                local gal_l1069 = gal_l1068:SetEspColor(Color3.fromRGB(220, 220, 220))
                                local gal_l1070 = gal_l1069:SetObjects(Characters)
                                gal182.Players = gal_l1070:Validator(function(gal_p1_130, ...)
                                    return gal_p1_130 ~= U[304].Character 
                                end)
                                local gal_l1071 = gal180.new("Islands")
                                local gal_l1072 = gal_l1071:SetEspColor(Color3.fromRGB(0, 255, 255))
                                local gal_l1073 = gal_l1072:SetObjects(Locations)
                                gal182.Islands = gal_l1073:Validator(function(gal_p1_131, ...)
                                    return gal_p1_131.Name ~= "Sea" and string.sub(gal_p1_131.Name, 1, 6) ~= "Trial " 
                                end)
                                local gal_l1074 = gal180.new("Fruits")
                                local gal_l1075 = gal_l1074:SetEspColor(Color3.fromRGB(255, 0, 0))
                                local gal_l1076 = gal_l1075:SetObjects(workspace)
                                local gal_l1077 = gal_l1076:WaitChildsAdded()
                                gal182.Fruits = gal_l1077:Validator(function(gal_p1_132, ...)
                                    local gal_l970 = gal_p1_132.Name == "Fruit "
                                    if gal_l970 then
                                        local Fruits = gal182.Fruits
                                        Fruits:SetInstanceName(gal_p1_132, nil)
                                    end
                                    local gal_l974 = string.find
                                    local gal_l975 = gal_l974(gal_p1_132.Name, "Fruit")
                                    if gal_l975 then
                                        local gal_l977 = gal_p1_132.ClassName ~= "Model"
                                        if gal_l977 then
                                            return gal_l977
                                        else
                                        end
                                    end
                                    return 
                                end)
                                local gal_l1078 = gal180.new("Flowers")
                                local gal_l1079 = gal_l1078:SetObjects(workspace)
                                local gal_l1080 = gal_l1079:WaitChildsAdded()
                                local gal_l1081 = gal_l1080:SetEspColor(function(gal_p1_133, ...)
                                    return gal_p1_133.Color 
                                end)
                                gal182.Flowers = gal_l1081:Validator(function(gal_p1_134, ...)
                                    return string.sub(gal_p1_134.Name, 1, 6) == "Flower" 
                                end)
                                local gal_l1082 = gal180.new("Chests")
                                local gal_l1083 = gal_l1082:SetObjects(gal45.Chests)
                                local gal_l1084 = gal_l1083:SetAlwaysValidate()
                                local gal_l1085 = gal_l1084:SetEspColor(function(gal_p1_135, ...)
                                    local gal_l979 = gal183[gal_p1_135.Name]
                                    if gal_l979 then
                                        return gal_l979
                                    else
                                    end 
                                end)
                                gal182.Chests = gal_l1085:Validator(function(gal_p1_136, ...)
                                    return not gal_p1_136:GetAttribute("IsDisabled") 
                                end)
                                local gal_l1086 = gal180.new("Berries")
                                local gal_l1087 = gal_l1086:SetObjects(gal45.Berries)
                                local gal_l1088 = gal_l1087:SetAlwaysValidate()
                                local gal_l1089 = gal_l1088:SetEspColor(Color3.fromRGB(255, 255, 0))
                                gal182.Berries = gal_l1089:Validator(function(gal_p1_137, ...)
                                    local gal_l983 = {
                                        pairs(gal_p1_137:GetAttributes())
                                    }
                                    local gal_l984 = gal_l983[3]
                                    local gal_l985 = gal_l983[2]
                                    local gal_l986 = pairs(gal_p1_137:GetAttributes())
                                    local gal_l987, gal_l988 = gal_l986(gal_l985, gal_l984), nil
                                    if gal_l987 then
                                        local Berries = gal182.Berries
                                        Berries:SetInstanceName(gal_p1_137, "by real_redz")
                                        return true
                                    end
                                    return 
                                end)
                                local gal_l1090 = gal42
                                if not gal_l1090:IsBlacklistedExecutor() then
                                    gal_l1064:AddSection("Aimbot Nearest")
                                    gal_l1064:AddToggle({
                                        "Aimbot Gun",
                                        false,
                                        {
                                            gal32,
                                            "AimBot_Gun"
                                        }
                                    })
                                    gal_l1064:AddToggle({
                                        "Aimbot Tap",
                                        false,
                                        {
                                            gal32,
                                            "AimBot_Tap"
                                        }
                                    })
                                    gal_l1064:AddToggle({
                                        "Aimbot Skills",
                                        false,
                                        {
                                            gal32,
                                            "AimBot_Skills"
                                        }
                                    })
                                    gal_l1064:AddToggle({
                                        "Ignore Mobs",
                                        true,
                                        {
                                            gal37,
                                            "NoAimMobs"
                                        }
                                    })
                                end
                                gal_l1064:AddSection("ESP")
                                gal_l1064:AddSlider({
                                    "Esp Size",
                                    7,
                                    15,
                                    1,
                                    10,
                                    function(...)
                                        gal180:ChangeEspSize(select(-1, ...))
                                        return 
                                    end,
                                    "S-EspSize"
                                })
                                if gal_l929 == 2 then
                                    gal_l1064:AddToggle({
                                        "ESP Flowers",
                                        false,
                                        {
                                            gal182.Flowers,
                                            "Enabled"
                                        },
                                        "Esp-Flower"
                                    })
                                end
                                if gal_l929 ~= 1 then
                                    gal_l1064:AddToggle({
                                        "ESP My Boat",
                                        false,
                                        {
                                            gal182.MyBoat,
                                            "Enabled"
                                        },
                                        "Esp-MyBoat"
                                    })
                                end
                                gal_l1064:AddToggle({
                                    "ESP Players",
                                    false,
                                    {
                                        gal182.Players,
                                        "Enabled"
                                    },
                                    "Esp-Players"
                                })
                                gal_l1064:AddToggle({
                                    "ESP Fruits",
                                    false,
                                    {
                                        gal182.Fruits,
                                        "Enabled"
                                    },
                                    "Esp-Fruits"
                                })
                                gal_l1064:AddToggle({
                                    "ESP Berries",
                                    false,
                                    {
                                        gal182.Berries,
                                        "Enabled"
                                    },
                                    "Esp-Berry"
                                })
                                gal_l1064:AddToggle({
                                    "ESP Chests",
                                    false,
                                    {
                                        gal182.Chests,
                                        "Enabled"
                                    },
                                    "Esp-Chests"
                                })
                                gal_l1064:AddToggle({
                                    "ESP Islands",
                                    false,
                                    {
                                        gal182.Islands,
                                        "Enabled"
                                    },
                                    "Esp-Island"
                                })
                                gal_l1064:AddSection("Visual")
                                gal_l1064:AddButton({
                                    "Meteor Rain",
                                    function(...)
                                        require(game:GetService("ReplicatedStorage").Effect.Container.UzothSpec)({
                                            Position = U[304].Character.PrimaryPart.Position
                                        })
                                        return 
                                    end
                                })
                                gal_l1064:AddButton({
                                    "Remove Portal Dash Cooldown",
                                    function(...)
                                        Backpack = U[304].Backpack
                                        Backpack = Backpack:FindFirstChild("Portal-Portal") or Backpack:FindFirstChild("Portal-Portal")
                                        if Backpack then
                                            Activated = Backpack.Activated
                                            gal_l1061 = nil
                                            for gal_l1061, gal_l1001 in getconnections(next) do
                                                if #debug.getupvalues(gal_l1001.Function) == 9 then
                                                    gal_l1010 = task.wait()
                                                    while not gal_l1010 do
                                                        while next do
                                                            debug.setupvalue(gal_l1001.Function, 2, 0) 
                                                        end 
                                                    end
                                                    while not Backpack do end
                                                    Backpack:IsDescendantOf(game)
                                                end 
                                            end
                                        end
                                        return 
                                    end
                                })
                                local gal_l1091 = gal_l1009.Shop
                                local gal_l1092 = gal42
                                local gal_l1093 = gal_l1092.Shop
                                local gal_l1094 = gal_l1092[3]
                                for gal_l1095, gal_l1096 in gal_l1092[1], ipairs(gal_l1096) do
                                    local gal_l1099 = gal_l1095
                                    gal_l1091:AddSection(gal_l1096[1])
                                    local gal_l1100 = gal_l1096[2]
                                    local gal_l1101 = nil
                                    local gal_l1102 = nil
                                    for gal_l1103, gal_l1104 in ipairs(gal_l1104) do
                                        repeat
                                            local gal_l1105 = gal_l1103
                                            local gal185 = gal_l1104
                                            local gal_l1106 = gal185[2]
                                        until type(U[gal_l1104][2]) == "table"
                                        local function gal_l1106(...)
                                            gal150(unpack(U[gal_l1104][2]))
                                            return 
                                        end
                                        gal_l1091:AddButton({
                                            U[gal_l1104][1],
                                            gal_l1106
                                        }) 
                                    end 
                                end
                                local gal_l1107 = gal_l1009.Misc
                                local function gal187(gal_p1_138, gal_p2_138, ...)
                                    for gal_l995 = #gal_p2_138, 2, -1 do
                                        local gal_l996 = gal_p1_138:NextInteger(1, gal_l995)
                                        gal_p2_138[gal_l995] = gal_p2_138[gal_l996]
                                        gal_p2_138[gal_l996] = gal_p2_138[gal_l995] 
                                    end
                                    return 
                                end
                                local function gal188(gal_p1_139, ...)
                                    local gal_l997 = string.reverse(gal_p1_139)
                                    local gal_l998 = string.sub(gal_l997, 1, -3)
                                    local gal_l999 = {
                                        "0",
                                        "1",
                                        "2",
                                        "3",
                                        "4",
                                        "5",
                                        "6",
                                        "7",
                                        "8",
                                        "9"
                                    }
                                    local gal_l1000 = {
                                        "a",
                                        "b",
                                        "c",
                                        "d",
                                        "e",
                                        "f",
                                        "g",
                                        "h",
                                        "i",
                                        "j",
                                        "k",
                                        "l",
                                        "n",
                                        "o",
                                        "p",
                                        "q",
                                        "r",
                                        "s",
                                        "t",
                                        "u"
                                    }
                                    local gal_l1001 = {
                                        8,
                                        4,
                                        4,
                                        4,
                                        12
                                    }
                                    local gal_l1002 = Random.new(tonumber("-" .. string.sub(gal_l998, -2, -1)))
                                    gal187(gal_l1002, gal_l999)
                                    gal187(gal_l1002, gal_l1000)
                                    for gal_l1003 = 1, #gal_l999 do
                                        local gal_l1004 = gal_l999[gal_l1003]
                                        local gal_l1005 = string.gsub(gal_l980, gal_l1000[gal_l1003 + 10], gal_l1004 .. gal_l1004)
                                        local gal_l1006 = string.gsub(gal_l1005, gal_l1000[gal_l1003], gal_l1004) 
                                    end
                                    local gal_l1007 = {}
                                    for gal_l1009 = 1, #gal_l1001 do
                                        table.insert(gal_l1007, string.sub(gal_l1006, 1, 1 + gal_l1001[gal_l1009] - 1)) 
                                    end
                                    return string.lower(table.concat(gal_l1007, "-")) 
                                end
                                local function gal189(gal_p1_140, ...)
                                    local gal_l1012 = gal_p1_140:gsub("\n", "")
                                    local gal_l1013 = gal_l1012:gsub("```", "")
                                    local gal_l1014 = gal_l1013:gsub("`", "")
                                    if string.sub(gal_l1014, 1, 5) ~= "redz-" then
                                        return string.sub(gal_l1014, 6, -1)
                                    end
                                    return gal188(string.sub(gal_l1014, 6, -1)) 
                                end
                                local function gal190(gal_p1_141, ...)
                                    local gal_l1015 = U[296].__ServerBrowser
                                    gal_l1015:InvokeServer("teleport", gal_p1_141)
                                    return 
                                end
                                if IsOwner then
                                    gal_l1107:AddSection("Executor")
                                    gal_l1107:AddButton({
                                        "Execute Clipboard",
                                        function(...)
                                            loadstring((getclipboard or fromclipboard)())()
                                            return 
                                        end
                                    })
                                end
                                if gal42.JobIds then
                                    gal_l1107:AddSection("Join Server")
                                    local function gal_l1108(gal_p1_142, ...)
                                        return U[gal_l1102](gal_p1_142) 
                                    end
                                    gal_l1107:AddTextBox({
                                        "Input Job Id",
                                        "1",
                                        true,
                                        gal190,
                                        "JobId"
                                    }).OnChanging = gal_l1108
                                    gal_l1107:AddButton({
                                        "Join Clipboard",
                                        function(...)
                                            gal190((getclipboard or fromclipboard)())
                                            return 
                                        end
                                    })
                                end
                                gal_l1107:AddSection("Settings")
                                gal_l1107:AddDropdown({
                                    "Farm Mode",
                                    {
                                        "Up",
                                        "Orbit",
                                        "Star"
                                    },
                                    "Up",
                                    {
                                        gal37,
                                        "FarmMode"
                                    },
                                    "S-FarmMode"
                                })
                                gal_l1107:AddSlider({
                                    "Farm Distance",
                                    5,
                                    30,
                                    1,
                                    15,
                                    function(gal_p1_143, ...)
                                        U[gal_l1088].FarmPos = Vector3.new(0, gal_p1_143, 0)
                                        U[gal_l1088].FarmDistance = gal_p1_143
                                        return 
                                    end,
                                    "S-Distance"
                                })
                                gal_l1107:AddSlider({
                                    "Tween Speed",
                                    50,
                                    300,
                                    5,
                                    200,
                                    {
                                        gal37,
                                        "TweenSpeed"
                                    },
                                    "S-TweenSpeed"
                                })
                                gal_l1107:AddSlider({
                                    "Bring Mobs Distance",
                                    50,
                                    400,
                                    10,
                                    250,
                                    {
                                        gal37,
                                        "BringDistance"
                                    },
                                    "S-BringDistance"
                                })
                                gal_l1107:AddToggle({
                                    "Bring Mobs",
                                    true,
                                    {
                                        gal37,
                                        "BringMobs"
                                    },
                                    "S-BringMobs"
                                })
                                gal_l1107:AddToggle({
                                    "Auto Haki",
                                    true,
                                    {
                                        gal37,
                                        "AutoBuso"
                                    },
                                    "S-AutoBuso"
                                })
                                gal_l1107:AddToggle({
                                    "Auto Attack",
                                    true,
                                    {
                                        gal37,
                                        "AutoClick"
                                    },
                                    "S-AutoClick"
                                })
                                gal_l1107:AddToggle({
                                    "Auto Shoot",
                                    false,
                                    {
                                        gal37,
                                        "AutoShoot"
                                    },
                                    "S-AutoShoot"
                                })
                                gal_l1107:AddToggle({
                                    "Take Quest Debounce",
                                    false,
                                    {
                                        gal148.Managers.QuestManager,
                                        "takeQuestDebounce"
                                    },
                                    "S-QuestDenounce",
                                    Desc = "Wait 75 seconds to take the next mission"
                                })
                                gal_l1107:AddSection("Codes")
                                gal_l1107:AddButton({
                                    "Redeem all Codes",
                                    gal47.AllCodes
                                })
                                gal_l1107:AddSection("Server")
                                gal_l1107:AddButton({
                                    "Server Hop",
                                    function(...)
                                        gal_l1042 = U[gal_l54]
                                        gal_l1042:ServerHop()
                                        return 
                                    end
                                })
                                gal_l1107:AddButton({
                                    "Rejoin",
                                    function(...)
                                        U[gal_l54].Rejoin()
                                        return 
                                    end
                                })
                                gal_l1107:AddSection("Team")
                                gal_l1107:AddButton({
                                    "Join Pirates Team",
                                    gal44.Pirates
                                })
                                gal_l1107:AddButton({
                                    "Join Marines Team",
                                    gal44.Marines
                                })
                                gal_l1107:AddSection("Race")
                                gal_l1107:AddToggle({
                                    "Auto Active Race V3",
                                    false,
                                    function(gal_p1_144, ...)
                                        gal32.ActiveRaceV3 = gal_p1_144
                                        ActiveRaceV3 = gal32.ActiveRaceV3
                                        while ActiveRaceV3 do
                                            ActiveRaceV3 = Data.Race
                                            while ActiveRaceV3:FindFirstChild("Evolved") do
                                                ActiveRaceV3 = Remotes.CommE
                                                ActiveRaceV3:FireServer("ActivateAbility")
                                                ActiveRaceV3 = task.wait
                                                ActiveRaceV3(gal37.SmoothMode and 2.5 or 1) 
                                            end
                                            ActiveRaceV3 = Data.Race.ChildAdded
                                            ActiveRaceV3:Wait() 
                                        end
                                        return 
                                    end,
                                    "S-RaceV3"
                                })
                                gal_l1107:AddToggle({
                                    "Auto Active Race V4",
                                    false,
                                    function(gal_p1_145, ...)
                                        gal32.ActiveRaceV4 = gal_p1_145
                                        while gal32["ActiveRaceV4"] do
                                            Character = LocalPlayer.Character
                                            while Character do
                                                RaceTransformed = Character:FindFirstChild("RaceTransformed")
                                                RaceEnergy = Character:FindFirstChild("RaceEnergy")
                                                while not RaceEnergy do
                                                    while not gal_l999 do
                                                        RaceEnergy = task.wait
                                                        RaceEnergy(U[gal_l142[4]].SmoothMode and 1 or .5) 
                                                    end
                                                    Backpack = U[gal_l142[6]].Backpack
                                                    Awakening = Backpack:FindFirstChild("Awakening")
                                                    gal_l1037 = "Awakening"
                                                    while Awakening do end
                                                    gal_l1037 = Character:FindFirstChild("Awakening") 
                                                end
                                                gal_l1041 = RaceEnergy.Value >= 1
                                                while not gal_l1041 do end
                                                while not RaceTransformed do end
                                                gal_l1041 = not RaceTransformed.Value 
                                            end
                                            Character = LocalPlayer.CharacterAdded
                                            gal_l1037 = Character:Wait() 
                                        end
                                        return 
                                    end,
                                    "S-RaceV4"
                                })
                                gal_l1107:AddSection("Menu")
                                gal_l1107:AddButton({
                                    "Devil Fruit Shop",
                                    function(...)
                                        gal_l1037 = require(U[304].PlayerGui.Main.UIController.FruitShop)
                                        gal_l1037:Open("FruitDealer")
                                        return 
                                    end
                                })
                                gal_l1107:AddButton({
                                    "Advanced Fruit Dealer",
                                    function(...)
                                        gal_l1037 = require(U[304].PlayerGui.Main.UIController.FruitShop)
                                        gal_l1037:Open("AdvancedFruitDealer")
                                        return 
                                    end
                                })
                                gal_l1107:AddButton({
                                    "Titles",
                                    function(...)
                                        gal150("getTitles")
                                        LocalPlayer.PlayerGui.Main.Titles.Visible = true
                                        return 
                                    end
                                })
                                local gal_l1109 = gal42
                                if not gal_l1109:IsBlacklistedExecutor() then
                                    gal_l1107:AddSection("Local-Player")
                                    gal_l1107:AddToggle({
                                        "Enable Speed Hack",
                                        false,
                                        function(gal_p1_146, ...)
                                            if gal_p1_146 then
                                                Hooking = gal42.Hooking
                                                Hooking:EnableBypass()
                                            end
                                            gal32.WalkSpeedBypass = gal_p1_146 or false
                                            return 
                                        end,
                                        "M-WalkSpeed:A"
                                    })
                                    gal_l1107:AddSlider({
                                        "Walk Speed",
                                        10,
                                        300,
                                        5,
                                        150,
                                        function(gal_p1_147, ...)
                                            gal_l1042 = U[gal_l1102]
                                            gal_l1042.WalkSpeedBypass = gal191 or false
                                            return 
                                        end,
                                        "M-WalkSpeed:B"
                                    })
                                end
                                gal_l1107:AddSection("Visual")
                                gal_l1107:AddButton({
                                    "Remove Fog",
                                    function(...)
                                        if Lighting:FindFirstChild("LightingLayers") then
                                            LightingLayers = Lighting.LightingLayers
                                            LightingLayers:Remove()
                                        end
                                        return 
                                    end
                                })
                                gal_l1107:AddSection("More FPS")
                                gal_l1107:AddToggle({
                                    "Smooth Farm Mode",
                                    false,
                                    {
                                        gal37,
                                        "SmoothMode"
                                    },
                                    "SmoothFarm",
                                    Desc = "Reduces calculation speed to improve FPS"
                                })
                                gal_l1107:AddToggle({
                                    "Remove Damage",
                                    false,
                                    function(gal_p1_148, ...)
                                        U[296].Assets.GUI.DamageCounter.Enabled = not gal_p1_148
                                        return 
                                    end,
                                    "M-DamageCounter"
                                })
                                gal_l1107:AddToggle({
                                    "Remove Notifications",
                                    false,
                                    function(gal_p1_149, ...)
                                        U[304].PlayerGui.Notifications.Enabled = not gal_p1_149
                                        return 
                                    end,
                                    "M-Notifications"
                                })
                                gal_l1107:AddSection("Others")
                                gal_l1107:AddToggle({
                                    "Walk On Water",
                                    true,
                                    function(gal_p1_150, ...)
                                        gal32.WalkOnWater = gal_p1_150
                                        gal_l1061 = gal186 or Map:WaitForChild("WaterBase-Plane", 9000000000.0).Size
                                        Vector3.new(gal_l1061.X, 113, gal_l1061.Z)
                                        gal_l1041 = task.wait(.25)
                                        while not gal_l1041 do
                                            gal_l1042 = gal_l1042 or gal_p1_150.Size
                                            while gal_l1041 do
                                                Sit = gal42.IsAlive(LocalPlayer.Character)
                                                while not Sit do
                                                    while Sit do
                                                        gal_l1042:WaitForChild("WaterBase-Plane", 9000000000.0).Size = gal_l1042 or gal_p1_150.Size 
                                                    end
                                                    gal_l1042:WaitForChild("WaterBase-Plane", 9000000000.0).Size = Vector3.new(gal_l1061.X, 113, gal_l1061.Z) 
                                                end
                                                Sit = LocalPlayer.Character.Humanoid.Sit 
                                            end
                                            gal_l1042:WaitForChild("WaterBase-Plane", 9000000000.0).Size = gal_l1042 or gal_p1_150.Size
                                            return 
                                        end
                                        WalkOnWater = gal32.WalkOnWater 
                                    end,
                                    "M-WalkOnWater"
                                })
                                gal_l1107:AddToggle({
                                    "Anti AFK",
                                    true,
                                    function(gal_p1_151, ...)
                                        gal32.AntiAFK = gal_p1_151
                                        while gal32.AntiAFK do
                                            VirtualUser:CaptureController()
                                            VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))
                                            task.wait(600) 
                                        end
                                        return 
                                    end,
                                    "M-AntiAFK"
                                })
                                local gal_l1110 = gal_l1009.Items
                                if gal_l929 == 3 then
                                    gal_l1110:AddSection("Dragon Dojo")
                                    gal_l930(gal_l1110, {
                                        "Auto Dojo Trainer Quest",
                                        "Automatically completes Dojo Trainer quests"
                                    }, "DojoTrainer")
                                    gal_l930(gal_l1110, {
                                        "Auto Dragon Hunter Quest",
                                        "Automatically completes Dragon Hunter quests"
                                    }, "DragonHunter")
                                    gal_l930(gal_l1110, {
                                        "Auto Draco V2 & V3",
                                        "Evolves the Draco Race to V2 and V3"
                                    }, "DracoV2V3")
                                    gal_l1110:AddSection("Farm")
                                    gal_l930(gal_l1110, {
                                        "Auto Elite Hunter",
                                        "Automatically completes Elite Hunter quests"
                                    }, "EliteHunter")
                                    gal_l930(gal_l1110, {
                                        "Auto Rip Indra",
                                        "Activates the plates and summons Rip Indra"
                                    }, "RipIndra")
                                    gal_l930(gal_l1110, {
                                        "Auto Cake Prince",
                                        "Automatically summons the Cake Prince"
                                    }, "CakePrince")
                                    gal_l930(gal_l1110, {
                                        "Auto Dough King",
                                        "Automatically summons the Dough King"
                                    }, "DoughKing")
                                    gal_l930(gal_l1110, {
                                        "Auto Tyrant of the Skies",
                                        "Kill mobs and the Eagle Boss"
                                    }, "TyrantSkies")
                                    gal_l1110:AddSection("Sword")
                                    gal_l930(gal_l1110, {
                                        "Auto Collect Yama",
                                        "Automatically collects the Yama sword after defeating 30 Elite Hunters"
                                    }, "Yama")
                                    gal_l930(gal_l1110, {
                                        "Auto Tushita",
                                        "Solves the Tushita puzzle and defeats Longma"
                                    }, "Tushita")
                                    gal_l930(gal_l1110, {
                                        "Auto Cursed Dual Katana",
                                        "Complete the Cursed Dual Katana puzzle"
                                    }, "CursedDualKatana")
                                    gal_l1110:AddSection("Mastery")
                                    gal_l930(gal_l1110, {
                                        "Auto Mastery all Swords"
                                    }, "MasterySwords")
                                    gal_l1110:AddSection("Quest")
                                    gal_l930(gal_l1110, {
                                        "Auto Citizen Quest"
                                    }, "Citizen")
                                    gal_l930(gal_l1110, {
                                        "Auto Rainbow Haki"
                                    }, "RainbowHaki")
                                else
                                    if gal42.GameData.Sea == 2 then
                                        gal_l1110:AddSection("Third Sea")
                                        gal_l930(gal_l1110, {
                                            "Auto Third Sea",
                                            "Automatically unlocks access to the Third Sea"
                                        }, "ThirdSea")
                                        gal_l930(gal_l1110, {
                                            "Auto Kill Don Swan",
                                            "Automatically defeats Don Swan"
                                        }, "DonSwan")
                                        gal_l1110:AddSection("Bosses")
                                        gal_l930(gal_l1110, {
                                            "Auto Darkbeard",
                                            "Automatically spawns and defeats Darkbeard"
                                        }, "Darkbeard")
                                        gal_l930(gal_l1110, {
                                            "Auto Cursed Captain",
                                            "Automatically summons and defeats the Cursed Captain"
                                        }, "CursedCaptain")
                                        gal_l1110:AddSection("Law")
                                        gal_l930(gal_l1110, {
                                            "Fully Raid Law",
                                            "Automatically spawns and defeats Law (Order)"
                                        }, "Order")
                                        gal_l1110:AddToggle({
                                            "Auto Start [ Fully ]",
                                            true,
                                            {
                                                U[gal_l1088],
                                                "StartLaw"
                                            },
                                            "S-RaidLaw",
                                            Desc = "Automatically spawns and defeats Law (Order)"
                                        })
                                        gal_l1110:AddSection("Sword")
                                        gal_l1110:AddToggle({
                                            "Auto Buy Legendary Sword",
                                            false,
                                            function(gal_p1_152, ...)
                                                gal32.LegendSword = gal_p1_152
                                                gal_l1061 = task.wait()
                                                while not gal_l1061 do
                                                    while gal_l1061 do
                                                        gal_l1062 = gal150("LegendarySwordDealer", "1")
                                                        LegendSword = "string"
                                                        while type(gal_l1062) == LegendSword do
                                                            while gal152[gal_l1062] do
                                                                task.wait(13500) 
                                                            end
                                                            while Beli.Value >= 2000000.0 do
                                                                U[gal_l589]("LegendarySwordDealer", "2") 
                                                            end
                                                            LegendSword = Beli:GetPropertyChangedSignal("Value")
                                                            LegendSword:Wait() 
                                                        end
                                                        task.wait(5) 
                                                    end
                                                    return 
                                                end
                                                LegendSword = gal32.LegendSword 
                                            end,
                                            "LegendSword",
                                            Desc = "Automatically purchases Legendary Swords when available"
                                        })
                                        gal_l930(gal_l1110, {
                                            "Auto Rengoku",
                                            "Automatically kill Ice Admiral to unlock the Rengoku sword"
                                        }, "Rengoku")
                                        gal_l1110:AddSection("Race")
                                        gal_l930(gal_l1110, {
                                            "Auto Race V2",
                                            "Automatically evolves the Race to V2"
                                        }, "RaceV2")
                                        gal_l930(gal_l1110, {
                                            "Auto Race V3",
                                            "Mink, Human & Shark"
                                        }, "RaceV3")
                                        gal_l1110:AddSection("Bartilo")
                                        gal_l930(gal_l1110, {
                                            "Auto Bartilo Quest",
                                            "Req: Level 850"
                                        }, "Bartilo")
                                    else
                                        if gal_l929 == 1 then
                                            gal_l1110:AddSection("Second Sea")
                                            gal_l930(gal_l1110, {
                                                "Auto Second Sea",
                                                "Automatically unlocks access to the Second Sea"
                                            }, "SecondSea")
                                            gal_l1110:AddSection("Swords")
                                            gal_l930(gal_l1110, {
                                                "Auto Unlock Saber",
                                                "Automatically unlocks the Saber Sword"
                                            }, "Saber")
                                            gal_l930(gal_l1110, {
                                                "Auto Pole V1",
                                                "Kill Thunder God"
                                            }, "PoleV1")
                                            gal_l930(gal_l1110, {
                                                "Auto Saw Sword",
                                                "Kill The Saw"
                                            }, "TheSaw")
                                        end
                                        gal_l1110:AddSection("Berries")
                                        gal_l930(gal_l1110, {
                                            "Auto Collect Berries"
                                        }, "BerryBush")
                                        gal_l1110:AddToggle({
                                            "Auto Berry Hop",
                                            false,
                                            {
                                                U[gal_l1088],
                                                "BerryHop"
                                            },
                                            "S-BerryHop"
                                        })
                                        if gal_l929 ~= 1 then
                                            gal_l1110:AddSection("Aura Color")
                                            gal_l1110:AddToggle({
                                                "Auto Barista Cousin",
                                                false,
                                                function(gal_p1_153, ...)
                                                    gal32.barista_cousin = gal_p1_153
                                                    while gal32.barista_cousin do
                                                        gal_l1000 = {
                                                            gal150("ColorsDealer", "1")
                                                        }
                                                        gal_l1062 = gal_l1000[2]
                                                        gal_l999 = type(gal150("ColorsDealer", "1"))
                                                        while gal_l999 == "string" do
                                                            gal_l999 = U[gal_l589]("ColorsDealer", "2")
                                                            gal_l1000 = gal_l999 == 1
                                                            while gal_l1000 do
                                                                while gal_l1000 do
                                                                    task.wait(250) 
                                                                end
                                                                gal_l1042 = U[gal_l142[25]]
                                                                gal_l1037 = gal_l1042:GetPropertyChangedSignal("Value")
                                                                gal_l1037:Wait() 
                                                            end
                                                            gal_l1037 = gal_l999 == 2 
                                                        end
                                                        task.wait(5) 
                                                    end
                                                    return 
                                                end,
                                                "B-Cousin"
                                            })
                                        end
                                        return
                                    end
                                end
                            end
                        end
                    end
                end 
            end
            gal48.StartFarm = function(gal_p1_154, ...)
                local gal_l1111 = gal_p1_154
                if not gal32.loadedFarm then
                    gal32.loadedFarm = true
                    task.spawn(gal42.RunFunctions.FarmQueue, gal36)
                end
                return 
            end
            gal48.StartFunctions = function(gal_p1_155, ...)
                local gal_l1377 = gal_p1_155
                table.clear(gal35)
                local gal193 = {}
                local function gal_l1374(gal_p1_156, gal_p2_156, gal_p3_156, ...)
                    if gal_p3_156 ~= false then
                        gal193[gal_p1_156] = gal_p2_156
                        table.insert(gal35, {
                            Name = gal_p1_156,
                            Function = gal_p2_156
                        })
                    end
                    return 
                end
                local gal194 = gal_l1377.Managers.QuestManager
                local gal_l1378 = gal_l1377.Managers.ItemsManager
                local gal195 = gal_l1377.Managers.FarmManager
                local gal196 = gal_l1377.Managers.RaidManager
                tQ[40] = 71
                local gal197 = gal_l1377.Managers.SeaManager
                local gal198 = gal_l1377.Managers.TweenManager
                local gal199 = gal42.GameData.MaxMastery
                local gal200 = gal42.GameData.MaxLevel
                local gal201 = gal42.GameData.Sea
                local gal202 = gal42.IsAlive
                local gal_l1379 = gal42.Inventory
                local gal203 = gal42.EquipTool
                tQ[19] = "CFrame"
                local gal204 = gal42.FireRemote
                tQ[13] = "Piranha"
                tQ[32] = -6551
                local gal205 = gal_l1379.Unlocked
                tQ[12] = "Fish Crew Member"
                local gal206 = gal_l1379.Count
                local gal207 = gal_l1379.Mastery
                local gal208 = gal_l1379.Items
                local gal209 = gal42.Enemies.IsSpawned
                local gal210 = gal42.EnemySpawned
                tQ[15] = "PirateGrandBrigade"
                local gal211 = gal42.EnemyLocations
                tQ[25] = -7645
                local gal212 = gal195.Enemies.Elites
                local gal213 = gal195.Enemies.Bones
                tQ[33] = -6551
                local gal214 = gal195.Enemies.Katakuri
                local gal215 = gal195.Enemies.Ectoplasm
                local gal216 = gal195.attack
                local gal217 = gal_l1378.CursedDualKatana
                tQ[16] = "GhostShip"
                local gal218 = gal_l1378.DojoTrainer
                tQ[1] = "Captain Elephant"
                local gal219 = Vector3.yAxis * 3
                tQ[11] = "Sea Beast"
                local gal220 = Vector3.yAxis * 5
                local gal221 = Vector3.yAxis * 50
                local gal222 = Vector3.yAxis * -10
                tQ[17] = "FishBoat"
                local gal223 = CFrame.new(-1926, 13, 1738)
                local gal224 = CFrame.new(-5556, 300, -2988)
                local gal225 = CFrame.new(914, 126, 33100)
                local gal226 = CFrame.new(-5410, 314, -2628)
                local gal227 = CFrame.new(-5561, 314, -2663)
                tQ[23] = -6707
                tQ[2] = "Beautiful Pirate"
                local gal228 = CFrame.new(-8932.85, 142.87, 6063.31)
                local gal229 = CFrame.new(1346, 37, -1329)
                local gal230 = CFrame.new(-2103, 70, -12165)
                tQ[4] = 108
                local gal231 = CFrame.new(224, 25, -12771)
                tQ[43] = 112
                local gal232 = CFrame.new(3779, 16, -3500)
                tQ[21] = -11150
                tQ[30] = "CFrame"
                local gal233 = CFrame.new(912, 186, 33591)
                local gal234 = CFrame.new(-9513, 164, 5786)
                tQ[36] = 115
                local gal235 = CFrame.new(-1461, 30, -51)
                local gal236 = CFrame.new(5864, 1209, 810)
                local gal237 = CFrame.new(5251, 20, 454)
                local gal238 = CFrame.new(-7739, 5657, -2289)
                local gal239 = CFrame.new(-690, 15, 1583)
                local gal240 = CFrame.new(-26952, 21, 329)
                local gal241 = CFrame.new(-462, 73, 300)
                tQ[50] = 2
                local gal242 = CFrame.new(2289, 15, 808)
                tQ[22] = 578
                tQ[35] = 129
                local gal243 = CFrame.new(-2777, 73, -3570)
                tQ[24] = 332
                local gal244 = CFrame.new(-1988, 124, -70)
                local gal245 = CFrame.new(-12512, 340, -9872)
                local gal246 = CFrame.new(-12445, 332, -7676)
                local gal247 = CFrame.new(-16252, 153, 1394)
                local gal248 = CFrame.new(-16649, 107, 1293)
                tQ[5] = 137
                local gal_l1380 = Net
                local gal249 = gal_l1380:WaitForChild("RF/InteractSubclassQuest")
                tQ[34] = 141
                local gal_l1381 = Net
                local gal_l1382 = Net
                gal_l1382:WaitForChild("RF/InteractDragonQuest")
                local gal250 = gal_l1382:WaitForChild("RF/StartSubclassQuest")
                local gal_l1383 = Net
                local gal251 = gal_l1383:WaitForChild("RF/FruitCustomizerRF")
                local gal_l1384 = Net
                gal_l1384:WaitForChild("RF/JuiceNetworkRF")
                local gal_l1385 = Net
                tQ[42] = 146
                tQ[37] = 147
                tQ[9] = "Shark"
                local gal252 = gal_l1385:WaitForChild("RF/DragonHunter")
                local gal_l1386 = Net
                tQ[20] = 382
                local gal253 = gal_l1386:WaitForChild("RF/ClaimBerry")
                tQ[3] = "Evil"
                local gal_l1387 = Net
                local gal254 = gal_l1387:WaitForChild("RE/TouchKitsuneStatue")
                local gal_l1388 = Net
                local gal_l1389 = Net
                gal_l1389:WaitForChild("RE/CollectBlueEmber")
                local gal_l1390 = Remotes
                tQ[7] = "PirateBrigade"
                gal_l1390:WaitForChild("RE/DragonDojoEmber")
                local gal255 = gal_l1390:WaitForChild("SubclassNetwork")
                local gal_l1391 = Remotes
                gal_l1391:WaitForChild("QuestUpdate")
                local gal256 = setmetatable({}, {
                    __index = function(gal_p1_157, gal_p2_157, ...)
                        rawset(gal_p1_157, gal_p2_157, NPCs:FindFirstChild(gal_p2_157) or NPCs:FindFirstChild(gal_p2_157))
                        return rawget(gal_p1_157, gal_p2_157) 
                    end
                })
                tQ[14] = "PirateBrigade"
                tQ[10] = "Terrorshark"
                tQ[31] = 603
                tQ[8] = "Sea Beast"
                tQ[27] = "Cursed Skeleton"
                gal274 = 0
                gal275 = 0
                local gal276 = 0
                local gal277 = 0
                local gal278 = {
                    "Forest Pirate",
                    "Mythological Pirate"
                }
                local gal279 = {
                    "Stone",
                    "Hydra Leader",
                    "Kilo Admiral",
                    tQ[1],
                    tQ[2]
                }
                tQ[2] = "Yama"
                local gal280 = {
                    "Yama",
                    "Tushita"
                }
                tQ[1] = "Good"
                tQ[2] = 160
                tQ[1] = 161
                tQ[6] = {
                    tQ[7],
                    tQ[8]
                }
                tQ[3] = 162
                U[tQ[1]] = {
                    Tushita = tQ[1],
                    [tQ[2]] = tQ[3]
                }
                U[tQ[2]] = -1
                U[tQ[3]] = nil
                tQ[7] = "ThirdSea"
                U[tQ[4]] = {}
                U[tQ[5]] = {}
                tQ[8] = {
                    tQ[9],
                    tQ[10],
                    tQ[11],
                    tQ[12],
                    tQ[13],
                    tQ[14],
                    tQ[15],
                    tQ[16],
                    tQ[17]
                }
                tQ[16] = -7983
                tQ[6] = 163
                tQ[13] = -7660
                tQ[10] = "Vector3"
                U[tQ[6]] = {
                    SecondSea = tQ[6],
                    [tQ[7]] = tQ[8]
                }
                tQ[14] = -7713
                tQ[9] = Env[tQ[10]]
                tQ[12] = 380
                tQ[10] = "yAxis"
                tQ[8] = tQ[9][tQ[10]]
                tQ[9] = 75
                tQ[7] = tQ[8] * tQ[9]
                tQ[9] = nil
                tQ[15] = -7876
                tQ[8] = "Segment"
                tQ[11] = "CFrame"
                tQ[7] = 164
                U[tQ[7]] = {
                    SegmentVector = tQ[7],
                    [tQ[8]] = tQ[9]
                }
                tQ[10] = Env[tQ[11]]
                tQ[11] = "new"
                tQ[9] = tQ[10][tQ[11]]
                tQ[11] = -13335
                tQ[10] = tQ[9](tQ[11], tQ[12], tQ[13])
                tQ[12] = "CFrame"
                tQ[11] = Env[tQ[12]]
                tQ[13] = 380
                tQ[12] = "new"
                tQ[9] = tQ[11][tQ[12]]
                tQ[12] = -13138
                tQ[11] = tQ[9](tQ[12], tQ[13], tQ[14])
                tQ[17] = -7815
                tQ[14] = 380
                tQ[13] = "CFrame"
                tQ[12] = Env[tQ[13]]
                tQ[13] = "new"
                tQ[9] = tQ[12][tQ[13]]
                tQ[13] = -13298
                tQ[12] = tQ[9](tQ[13], tQ[14], tQ[15])
                tQ[14] = "CFrame"
                tQ[13] = Env[tQ[14]]
                tQ[14] = "new"
                tQ[9] = tQ[13][tQ[14]]
                tQ[15] = 380
                tQ[26] = "Hell's Messenger"
                tQ[14] = -13512
                tQ[13] = tQ[9](tQ[14], tQ[15], tQ[16])
                tQ[15] = "CFrame"
                tQ[14] = Env[tQ[15]]
                tQ[16] = 380
                tQ[15] = "new"
                tQ[39] = 165
                tQ[9] = tQ[14][tQ[15]]
                tQ[15] = -13632
                tQ[14] = {
                    tQ[9](tQ[15], tQ[16], tQ[17])
                }
                tQ[9] = "Swan Pirate"
                tQ[8] = {
                    tQ[10],
                    tQ[11],
                    tQ[12],
                    tQ[13],
                    j(tQ[14])
                }
                tQ[18] = 1115
                tQ[13] = "CFrame"
                tQ[12] = Env[tQ[13]]
                tQ[14] = 110
                tQ[15] = 1129
                tQ[13] = "new"
                tQ[11] = tQ[12][tQ[13]]
                tQ[13] = 778
                tQ[12] = tQ[11](tQ[13], tQ[14], tQ[15])
                tQ[14] = "CFrame"
                tQ[38] = 166
                tQ[13] = Env[tQ[14]]
                tQ[14] = "new"
                tQ[11] = tQ[13][tQ[14]]
                tQ[14] = 1018
                tQ[16] = 1128
                tQ[15] = 110
                tQ[13] = tQ[11](tQ[14], tQ[15], tQ[16])
                tQ[15] = "CFrame"
                tQ[14] = Env[tQ[15]]
                tQ[15] = "new"
                tQ[16] = 110
                tQ[11] = tQ[14][tQ[15]]
                tQ[15] = 1020
                tQ[17] = 1366
                tQ[14] = tQ[11](tQ[15], tQ[16], tQ[17])
                tQ[16] = "CFrame"
                tQ[15] = Env[tQ[16]]
                tQ[17] = 110
                tQ[16] = "new"
                tQ[11] = tQ[15][tQ[16]]
                tQ[16] = 1016
                tQ[15] = {
                    tQ[11](tQ[16], tQ[17], tQ[18])
                }
                tQ[10] = {
                    tQ[12],
                    tQ[13],
                    tQ[14],
                    j(tQ[15])
                }
                tQ[44] = 167
                tQ[10] = "Yama"
                tQ[13] = "Good"
                tQ[15] = "Evil"
                tQ[16] = "Frags"
                tQ[8] = 168
                U[tQ[8]] = {
                    ["Forest Pirate"] = tQ[8],
                    [tQ[9]] = tQ[10]
                }
                tQ[11] = "Tushita"
                tQ[14] = "Yama"
                tQ[17] = -1
                tQ[9] = {
                    tQ[10],
                    tQ[11]
                }
                tQ[12] = "Tushita"
                tQ[11] = {
                    [tQ[12]] = tQ[13],
                    [tQ[14]] = tQ[15]
                }
                tQ[12] = "CurrentQuest"
                tQ[10] = "Modes"
                tQ[15] = {}
                tQ[14] = "Quest"
                tQ[18] = Env[tQ[19]]
                tQ[13] = {
                    [tQ[14]] = tQ[15],
                    [tQ[16]] = tQ[17]
                }
                tQ[15] = {}
                tQ[19] = "new"
                tQ[14] = "BoatsDealer"
                tQ[17] = tQ[18][tQ[19]]
                tQ[16] = "CakeQueen"
                tQ[19] = -710
                tQ[18] = tQ[17](tQ[19], tQ[20], tQ[21])
                tQ[17] = "DoorNpc"
                tQ[21] = "CFrame"
                tQ[20] = Env[tQ[21]]
                tQ[21] = "new"
                tQ[19] = tQ[20][tQ[21]]
                tQ[21] = -12131
                tQ[20] = tQ[19](tQ[21], tQ[22], tQ[23])
                tQ[19] = "ForestPirate"
                tQ[23] = "CFrame"
                tQ[22] = Env[tQ[23]]
                tQ[23] = "new"
                tQ[21] = tQ[22][tQ[23]]
                tQ[23] = -13350
                tQ[22] = tQ[21](tQ[23], tQ[24], tQ[25])
                tQ[21] = "Heaven"
                tQ[24] = "Heaven's Guardian"
                tQ[25] = "Cursed Skeleton"
                tQ[23] = {
                    tQ[24],
                    tQ[25]
                }
                tQ[29] = Env[tQ[30]]
                tQ[25] = {
                    tQ[26],
                    tQ[27]
                }
                tQ[30] = "new"
                tQ[26] = "CursedSkeleton"
                tQ[24] = "Hell"
                tQ[28] = tQ[29][tQ[30]]
                tQ[30] = -12360
                tQ[29] = tQ[28](tQ[30], tQ[31], tQ[32])
                tQ[31] = "CFrame"
                tQ[30] = Env[tQ[31]]
                tQ[32] = 603
                tQ[41] = 169
                tQ[31] = "new"
                tQ[28] = tQ[30][tQ[31]]
                tQ[31] = -12331
                tQ[30] = {
                    tQ[28](tQ[31], tQ[32], tQ[33])
                }
                tQ[27] = {
                    tQ[29],
                    j(tQ[30])
                }
                tQ[28] = "OpenedDoor"
                tQ[29] = false
                tQ[21] = 6
                tQ[17] = 6
                tQ[13] = 141
                tQ[9] = 170
                tQ[18] = 6346
                U[tQ[9]] = {
                    Quests = tQ[9],
                    [tQ[10]] = tQ[11],
                    [tQ[12]] = tQ[13],
                    [tQ[14]] = tQ[15],
                    [tQ[16]] = tQ[18],
                    [tQ[17]] = tQ[20],
                    [tQ[19]] = tQ[22],
                    [tQ[21]] = tQ[23],
                    [tQ[24]] = tQ[25],
                    [tQ[26]] = tQ[27],
                    [tQ[28]] = tQ[29]
                }
                tQ[24] = 6291
                tQ[14] = 6169
                tQ[12] = "CFrame"
                tQ[11] = Env[tQ[12]]
                tQ[12] = "new"
                tQ[10] = tQ[11][tQ[12]]
                tQ[12] = -8654
                tQ[11] = tQ[10](tQ[12], tQ[13], tQ[14])
                tQ[16] = 6018
                tQ[20] = 6001
                tQ[10] = "Gravestones"
                tQ[14] = "CFrame"
                tQ[26] = 6230
                tQ[27] = 2
                tQ[32] = 171
                tQ[15] = 142
                tQ[33] = 172
                tQ[13] = Env[tQ[14]]
                tQ[14] = "new"
                tQ[12] = tQ[13][tQ[14]]
                tQ[14] = -8760
                tQ[30] = "Shark Teeth"
                tQ[22] = 6039
                tQ[13] = tQ[12](tQ[14], tQ[15], tQ[16])
                tQ[12] = "BuySkullGuitar"
                tQ[19] = 154
                tQ[16] = "CFrame"
                tQ[15] = Env[tQ[16]]
                tQ[16] = "new"
                tQ[14] = tQ[15][tQ[16]]
                tQ[16] = -9680
                tQ[15] = tQ[14](tQ[16], tQ[17], tQ[18])
                tQ[18] = "CFrame"
                tQ[17] = Env[tQ[18]]
                tQ[14] = "Zombies"
                tQ[25] = 6
                tQ[18] = "new"
                tQ[16] = tQ[17][tQ[18]]
                tQ[18] = -10139
                tQ[17] = tQ[16](tQ[18], tQ[19], tQ[20])
                tQ[16] = "Trophies"
                tQ[20] = "CFrame"
                tQ[19] = Env[tQ[20]]
                tQ[20] = "new"
                tQ[18] = tQ[19][tQ[20]]
                tQ[20] = -9529
                tQ[19] = tQ[18](tQ[20], tQ[21], tQ[22])
                tQ[18] = "Ghost"
                tQ[22] = "CFrame"
                tQ[21] = Env[tQ[22]]
                tQ[23] = 270
                tQ[22] = "new"
                tQ[20] = tQ[21][tQ[22]]
                tQ[22] = -9758
                tQ[21] = tQ[20](tQ[22], tQ[23], tQ[24])
                tQ[20] = "Pipes"
                tQ[24] = "CFrame"
                tQ[23] = Env[tQ[24]]
                tQ[24] = "new"
                tQ[22] = tQ[23][tQ[24]]
                tQ[24] = -9576
                tQ[23] = tQ[22](tQ[24], tQ[25], tQ[26])
                tQ[14] = "Context"
                tQ[13] = "RequestQuest"
                tQ[12] = "Context"
                tQ[11] = {
                    [tQ[12]] = tQ[13]
                }
                tQ[20] = "Cyborg"
                tQ[10] = {
                    GravestoneEvent = tQ[11],
                    [tQ[10]] = tQ[13],
                    [tQ[12]] = tQ[15],
                    [tQ[14]] = tQ[17],
                    [tQ[16]] = tQ[19],
                    [tQ[18]] = tQ[21],
                    [tQ[20]] = tQ[23]
                }
                tQ[12] = "Check"
                tQ[15] = "Check"
                tQ[17] = "Sea Beast"
                tQ[13] = {
                    [tQ[14]] = tQ[15]
                }
                tQ[13] = "Orbitus"
                tQ[11] = 173
                U[tQ[11]] = {
                    RequestQuest = tQ[11],
                    [tQ[12]] = tQ[13]
                }
                tQ[15] = "Jeremy"
                tQ[21] = "Ghoul"
                tQ[14] = "Diamond"
                tQ[12] = {
                    tQ[13],
                    tQ[14],
                    tQ[15]
                }
                tQ[16] = {
                    tQ[17]
                }
                tQ[13] = "Shark"
                tQ[18] = "Fishman"
                tQ[15] = "CreateDictionary"
                tQ[14] = Env[tQ[15]]
                tQ[19] = "Mink"
                tQ[17] = true
                tQ[15] = tQ[14](tQ[16], tQ[17])
                tQ[25] = "__index"
                tQ[14] = "CreateDictionary"
                tQ[16] = "Human"
                tQ[17] = "Skypiea"
                tQ[12] = 174
                U[tQ[12]] = {
                    Human = tQ[12],
                    [tQ[13]] = tQ[15]
                }
                tQ[22] = "BrickColor"
                tQ[13] = Env[tQ[14]]
                tQ[15] = {
                    tQ[16],
                    tQ[17],
                    tQ[18],
                    tQ[19],
                    tQ[20],
                    tQ[21]
                }
                tQ[16] = true
                tQ[19] = "_hotGreen"
                tQ[14] = tQ[13](tQ[15], tQ[16])
                tQ[18] = "Winter Sky"
                tQ[14] = "Pure Red"
                tQ[28] = "Electric Wings"
                tQ[13] = {
                    Races = tQ[14]
                }
                tQ[21] = Env[tQ[22]]
                tQ[23] = {}
                tQ[17] = "Hot pink"
                tQ[16] = "Snow White"
                tQ[15] = "Oyster"
                tQ[22] = "new"
                tQ[20] = tQ[21][tQ[22]]
                tQ[22] = "Lime green"
                tQ[21] = tQ[20](tQ[22])
                tQ[14] = 175
                tQ[22] = "Terrorshark"
                tQ[20] = "CreateDictionary"
                tQ[18] = "Shark"
                tQ[21] = {
                    tQ[22]
                }
                U[tQ[14]] = {
                    ["Really red"] = tQ[14],
                    [tQ[15]] = tQ[16],
                    [tQ[17]] = tQ[18],
                    [tQ[19]] = tQ[21]
                }
                tQ[22] = true
                tQ[17] = {
                    tQ[18]
                }
                tQ[18] = true
                tQ[16] = "CreateDictionary"
                tQ[15] = Env[tQ[16]]
                tQ[48] = 3
                tQ[16] = tQ[15](tQ[17], tQ[18])
                tQ[15] = "SharkAnchor"
                tQ[19] = Env[tQ[20]]
                tQ[26] = function(...)
                    return true 
                end
                tQ[20] = tQ[19](tQ[21], tQ[22])
                tQ[29] = 8
                tQ[24] = {
                    [tQ[25]] = tQ[26]
                }
                tQ[22] = "setmetatable"
                tQ[18] = "Terrorshark"
                tQ[26] = "Terror Eyes"
                tQ[19] = "_Selected"
                tQ[21] = Env[tQ[22]]
                tQ[25] = 20
                tQ[22] = tQ[21](tQ[23], tQ[24])
                tQ[31] = 10
                tQ[24] = "Fool's Gold"
                tQ[23] = {
                    [tQ[24]] = tQ[25],
                    [tQ[26]] = tQ[27],
                    [tQ[28]] = tQ[29],
                    [tQ[30]] = tQ[31]
                }
                tQ[28] = "Terror Eyes"
                tQ[29] = "Terrorshark"
                tQ[31] = "Electric Wings"
                tQ[24] = "Drops"
                tQ[27] = "Shark"
                tQ[21] = "Materials"
                tQ[30] = "Fish Crew Member"
                tQ[26] = "Shark Teeth"
                tQ[25] = {
                    [tQ[26]] = tQ[27],
                    [tQ[28]] = tQ[29],
                    [tQ[30]] = tQ[31]
                }
                tQ[17] = {
                    [tQ[18]] = tQ[20],
                    [tQ[19]] = tQ[22],
                    [tQ[21]] = tQ[23],
                    [tQ[24]] = tQ[25]
                }
                tQ[29] = 176
                tQ[20] = 177
                tQ[21] = 178
                tQ[22] = 179
                tQ[25] = 180
                tQ[16] = 181
                tQ[18] = 182
                tQ[31] = 183
                tQ[17] = 184
                tQ[15] = 185
                tQ[19] = 186
                U[tQ[15]] = {
                    Shipwright = tQ[16],
                    [tQ[15]] = tQ[17]
                }
                tQ[27] = 187
                U[tQ[16]] = function(...)
                    if tick() - gal274 <= 30 then
                        return gal267
                    end
                    local gal274 = tick()
                    local gal267 = gal251:InvokeServer({
                        Context = "GetSkinsInventory"
                    })
                    return gal267 
                end
                tQ[26] = 188
                U[tQ[17]] = function(gal_p1_158, gal_p2_158, ...)
                    if gal_p1_158 then
                        for gal_l1121 = 1, #gal_p1_158 do
                            gal_p1_158[gal_l1121].Name = gal_p2_158 
                        end
                    end
                    return 
                end
                U[tQ[18]] = function(gal_p1_159, gal_p2_159, gal_p3_159, ...)
                    if Level.Value < gal_p2_159 then
                        return
                    end
                    local gal268 = gal195:GetNpcVectorCFrame(gal_p1_159)
                    if gal_p3_159 then
                        return LocalPlayer:DistanceFromCharacter(gal_p3_159.PrimaryPart.Position) >= LocalPlayer:DistanceFromCharacter(gal268.Position)
                    end
                    return true 
                end
                U[tQ[19]] = function(gal_p1_160, ...)
                    if gal_p1_160 then
                        local function gal_l1130(gal_p1_161, gal_p2_161, gal_p3_161, ...)
                            if Level.Value < gal_p2_161 then
                                return
                            end
                            local gal_l1130 = U[gal_l1001]
                            U[bQ] = gal_l1130:GetNpcVectorCFrame(gal_p1_161)
                            if gal_p3_161 then
                                return LocalPlayer:DistanceFromCharacter(gal_p3_161.PrimaryPart.Position) >= LocalPlayer:DistanceFromCharacter(U[bQ].Position)
                            end
                            return true 
                        end
                    end
                    return gal_p1_160 
                end
                U[tQ[20]] = function(...)
                    if gal257 then
                        U[tQ[19]](gal257.Parent)
                    end
                    if Map then
                        return gal257
                    end
                    local IslandModel = Map.Waterfall.IslandModel
                    local gal_l1137 = IslandModel:FindFirstChild("Meshes/bambootree", true)
                    while gal_l1137 do
                        if U[tQ[19]](gal_l1137.Parent) then
                            U[tQ[17]](gal_l1129, "Meshes/bambootree")
                            return gal_l1137
                        end 
                    end
                    return 
                end
                tQ[24] = 189
                U[tQ[21]] = function(...)
                    if gal258 then
                        gal209(gal258)
                    end
                    if gal258 then
                        return gal258
                    end
                    local gal_l1142 = gal42[1]
                    for gal_l1143, gal_l1144 in pairs(gal_l1142) do
                        if gal209(gal_l1143) then
                            return gal42
                        end 
                    end
                    return 
                end
                tQ[23] = 190
                U[tQ[22]] = function(gal_p1_162, gal_p2_162, gal_p3_162, ...)
                    if gal_p3_162 ~= true and (not nil and gal37.BossQuest) then
                        if gal_l1139 then
                            gal194:StartQuest(gal194[1], gal194[3] or 3, gal194[2])
                            return "Getting Boss Quest: " .. gal_p2_162
                        end
                    end
                    local gal_l1150 = gal210(gal_p2_162)
                    if gal_l1150 then
                        return "Defeating Boss: " .. gal_p2_162, gal216(gal_l1150, true)
                    end
                    if gal_p1_162.Position then
                        return "Waiting for: " .. gal_p2_162, gal43(gal_p1_162.Position)
                    end
                    return false 
                end
                U[tQ[23]] = function(...)
                    local EmberTemplate = workspace:FindFirstChild("EmberTemplate")
                    while EmberTemplate do
                        U[tQ[17]](nil, "EmberTemplate")
                        return true 
                    end
                    return 
                end
                U[tQ[24]] = function(...)
                    gal43(gal259.Part.CFrame)
                    return "Collecting Ember" 
                end
                tQ[28] = 191
                tQ[45] = function(...)
                    if gal205.Tushita then
                        if gal209("rip_indra True Form") then
                            local gal_l1155 = gal210("rip_indra True Form")
                            if gal_l1155 then
                                U[gal_l1053](gal_l1155)
                            else
                                gal43(gal226)
                            end
                            return true
                        end
                        return nil
                    end
                    local gal_l1158 = gal42:GetProgress("Tushita", "TushitaProgress")
                    local gal260 = gal260 or gal_l1158.OpenedDoor
                    if gal260 then
                        if gal209("Longma") then
                            return U[tQ[22]](gal42.Bosses.Longma, "Longma")
                        end
                        return nil
                    end
                    if VerifyTool("Holy Torch") then
                        for gal_l1159 = 1, #gal_l1158.Torches do
                            if not gal42:GetProgress("Tushita", "TushitaProgress").Torches[gal_l1159] then
                                U[gal_l170]("TushitaProgress", "Torch", 1)
                            end 
                        end
                        return true
                    end
                    if gal209("rip_indra True Form") then
                        gal43(CFrame.new(5713, 38, 255))
                        return true
                    end
                    local gal_l1160 = not gal_l37.EliteHunter
                    return gal_l1160 
                end
                tQ[30] = 192
                U[tQ[25]] = function(...)
                    local gal_l1162 = U[tQ[20]]()
                    if gal_l1162 then
                        if LocalPlayer:DistanceFromCharacter(gal_l1162.Position) >= 5 then
                            return U[gal_l142[11]](gal_l1162.CFrame)
                        end
                        if gal205["Skull Guitar"] then
                            if VerifyTool("Skull Guitar") then
                                local Hooking = gal42.Hooking
                                Hooking:SetTarget(Tree)
                                gal203("Skull Guitar")
                                local FastAttack = gal42.FastAttack
                                FastAttack:ShootInTarget(LocalPlayer.Position + gal222)
                            else
                                U[gal_l170]("LoadItem", "Skull Guitar")
                            end
                        else
                            gal203(gal197:GetRandomWeapon(), true)
                            gal42.UseSkills(LocalPlayer, gal37.SeaSkills)
                        end
                    end
                    return 
                end
                U[tQ[26]] = function(gal_p1_163, ...)
                    EnableBuso()
                    gal197:StopMovingBoat()
                    local gal_l1170 = gal_p1_163.Name == "Leviathan Segment"
                    if gal_l1170 and gal_p1_163:FindFirstChild("Head") then
                        gal203(gal197:GetRandomWeapon(), true)
                        gal42.UseSkills(gal_p1_163.Head.CFrame + U[tQ[7]].SegmentVector, gal37.SeaSkills)
                        return true, gal43(gal_p1_163.Head.CFrame + U[tQ[7]].SegmentVector)
                    end
                    if gal_p1_163:FindFirstChild("Head") then
                        local gal_l1172 = CFrame.new(gal_p1_163.Head.Position.X, 60, gal_p1_163.Head.Position.Z)
                        EnableBuso()
                        gal197:StopMovingBoat()
                        gal203(gal197:GetRandomWeapon(), true)
                        gal42.UseSkills(gal_l1172, gal37.SeaSkills)
                        return true, gal43(gal_l1172)
                    end
                    return 
                end
                U[tQ[27]] = function(...)
                    if LocalPlayer:FindFirstChild("QuestHaze") then
                        return "Yama", 2
                    end
                    if LocalPlayer:FindFirstChild("BoatQuest") then
                        return "Tushita", 1
                    end
                    if Map:FindFirstChild("HellDimension") then
                        return "Yama", 3
                    end
                    if Map:FindFirstChild("HeavenlyDimension") then
                        return "Tushita", 3
                    end
                    if gal206["Alucard Fragment"] == 6 then
                        return "FinalQuest"
                    end
                    if U[tQ[2]] == gal206["Alucard Fragment"] then
                        return unpack(U[tQ[3]])
                    end
                    for gal_l1183, gal_l1184 in ipairs(gal_l1163) do
                        local gal_l1186 = U[tQ[1]][gal_l1184]
                        local gal_l1187 = gal204("CDKQuest", "Progress")[gal_l1186]
                        local gal_l1188 = gal_l1187 < -2
                        while gal_l1188 do
                            local gal_l1190 = (gal_l1187 + 2) * -1
                            while not gal_l1184 do end
                            U[tQ[2]] = gal206["Alucard Fragment"]
                            U[tQ[3]] = {
                                gal_l1184,
                                gal_l1190
                            }
                            return gal_l1184, gal_l1190 
                        end
                        local gal_l1192 = gal_l1187 >= 0
                        while not gal_l1192 do
                            while not gal_l1192 do end
                            U[gal_l170]("CDKQuest", "StartTrial", gal_l1186) 
                        end 
                    end
                    return 
                end
                U[tQ[28]] = function(...)
                    local Enemies = gal42.Enemies
                    local gal_l1199 = Enemies:GetClosestByTag("CakePrince")
                    local gal_l1201 = not gal194:VerifyQuest(gal214[1])
                    if gal_l1201 then
                        U[tQ[18]]("Cake Quest Giver 2", 2275, gal_l1199)
                    end
                    if gal_l1201 then
                        gal194:StartQuest("CakeQuest2", 2, gal268)
                    else
                        if gal_l1199 then
                            U[gal_l1053](gal_l1202:GetClosestByTag("CakePrince"), true, true)
                        else
                            gal43(gal230)
                        end
                        return true
                    end 
                end
                U[tQ[29]] = function(...)
                    U[tQ[16]]()
                    if gal265 then
                        for gal_l1206 = 1, #gal265 do
                            if nil then
                                repeat

                                until not U[tQ[16]]()[U[tQ[14]][nil]]
                            end 
                        end
                        return 2
                    else
                    end 
                end
                U[tQ[30]] = function(...)
                    if U[tQ[19]](gal263) then
                        return true
                    end
                    local TikiOutpost = Map.TikiOutpost
                    local EagleBossArena = TikiOutpost:FindFirstChild("EagleBossArena", true)
                    local gal_l1212 = {
                        EagleBossArena:GetChildren()
                    }
                    local gal_l1213 = EagleBossArena[1]
                    for gal_l1215, gal_l1216 in gal_l1213, ipairs(j(gal_l1213)) do
                        local gal_l1218 = gal_l1216.Name == "Tree"
                        while not gal_l1218 do
                            while not gal_l1218 do end
                            U[aU] = gal_l1216
                            return true 
                        end
                        local gal_l1220 = U[tQ[19]](gal_l1216) 
                    end
                    return 
                end
                U[tQ[31]] = function(gal_p1_164, ...)
                    if gal270 and nil then
                        return gal270.Parent
                    end
                    local GetChildren = gal_p1_164.GetChildren
                    local gal_l1223 = {
                        GetChildren(gal_p1_164)
                    }
                    local gal_l1225 = GetChildren[1]
                    for gal_l1226, gal_l1227 in gal_l1225, ipairs(j(gal_l1225)) do
                        local Specs = gal_l1227:FindFirstChild("Specs", true)
                        while not Specs do
                            while not Specs do end
                            U[AQ] = Specs
                            return Specs.Parent 
                        end 
                    end
                    return 
                end
                U[tQ[32]] = function(...)
                    local PrehistoricIsland = Map.PrehistoricIsland
                    local SpawnedDragonEggs = PrehistoricIsland:FindFirstChild("SpawnedDragonEggs", true)
                    local gal_l1233 = SpawnedDragonEggs and SpawnedDragonEggs:FindFirstChild("DragonEgg")
                    if gal_l1233 then
                        local ProximityPrompt = gal_l1233:FindFirstChild("ProximityPrompt", true)
                        if ProximityPrompt then
                            if LocalPlayer:DistanceFromCharacter(ProximityPrompt.Parent.Position) < 3 then
                                fireproximityprompt(ProximityPrompt)
                            else
                                gal43(ProximityPrompt.Parent.CFrame)
                            end
                            return true
                        end
                    end
                    return 
                end
                U[tQ[33]] = function(...)
                    if gal206["Dinosaur Bones"] >= 99 then
                        return
                    end
                    local DinoBone = workspace:FindFirstChild("DinoBone")
                    if DinoBone then
                        local gal_l1241 = LocalPlayer:DistanceFromCharacter(DinoBone.Position) <= 1500
                    end
                    if DinoBone then
                        if LocalPlayer:DistanceFromCharacter(DinoBone.Position) <= 3 then
                            gal43(workspace:FindFirstChild("DinoBone").CFrame + gal220)
                        else
                            U[gal_l142[11]](workspace:FindFirstChild("DinoBone").CFrame)
                        end
                        return true
                    end
                    return 
                end
                U[tQ[34]] = function(...)
                    local gal_l1243 = gal210("Lava Golem")
                    if gal_l1243 then
                        return true, gal216(gal_l1243, true)
                    end
                    return 
                end
                U[tQ[35]] = function(...)
                    if Fragments.Value >= 1000 then
                        gal204("BlackbeardReward", "Microchip", "2")
                        local gal_l1245 = not VerifyTool("Microchip")
                        local gal_l1246 = tick() - tick() <= 5
                        while not gal_l1245 do
                            while gal_l1246 do
                                task.wait() 
                            end
                            break 
                        end
                        local gal_l1247 = tick() - tick() <= 5
                    end
                    return 
                end
                U[tQ[36]] = function(...)
                    return fireclickdetector(U[312].CircleIsland.RaidSummon.Button.Main.ClickDetector) 
                end
                U[tQ[37]] = function(...)
                    return fireclickdetector(U[312].Waterfall.SealedKatana.Hitbox.ClickDetector) 
                end
                U[tQ[38]] = function(gal_p1_165, gal_p2_165, gal_p3_165, ...)
                    local gal_l1250 = gal_p2_165:GetAttribute("IsMinigameActive")
                    if gal_l1250 then
                        local gal_l1251 = tick() - gal275 >= 5
                        if gal_l1251 then
                            local gal275 = tick()
                            gal42:RemoveVolcanoLava()
                        end
                        if U[tQ[34]]() then
                            return true
                        end
                        local gal_l1253 = U[tQ[31]](gal_p3_165)
                        if gal_l1253 then
                            if LocalPlayer:DistanceFromCharacter(gal_l1253.Position) < 5 then
                                gal203(gal197:GetRandomWeapon(), true)
                                gal42.UseSkills(gal_l1252(gal_l1233), gal37.SeaSkills)
                            else
                                U[tQ[33]](gal_l1252(gal_l1233).CFrame, false, false, true)
                            end
                            return true
                        end
                        if gal_l1253 then
                            return true, U[tQ[33]](gal_l1253.CFrame, false, false, true)
                        end
                    else
                        if LocalPlayer:GetAttribute("PrehistoricIslandParticipant") then
                            if gal_p1_165 then
                                if gal_p1_165 then
                                    if gal_l1257 and U[tQ[32]]() then
                                        return true
                                    end
                                    return
                                else
                                    if gal_p1_165 then
                                        local gal_l1262 = gal_p1_165 and U[tQ[33]]()
                                    else
                                    end
                                end
                            else
                            end
                        end
                    end 
                end
                U[tQ[39]] = function(gal_p1_166, gal_p2_166, ...)
                    if gal_p2_166 then
                        local ProximityPrompt = gal_p1_166:FindFirstChild("ProximityPrompt", true)
                        local gal_l1270 = LocalPlayer:DistanceFromCharacter(gal_p2_166.Position) <= 5
                        if gal_l1270 then
                            fireproximityprompt(ProximityPrompt)
                        else
                            gal43(gal_p2_166.CFrame)
                        end
                    end
                    return 
                end
                local function gal_l1391(gal_p1_167, ...)
                    if gal_p1_167 then
                        local GetChildren = gal_p1_167.GetChildren
                        local gal_l1275 = {
                            GetChildren(gal_p1_167)
                        }
                        for gal_l1278, gal_l1279 in ipairs(j(gal_l1271)) do
                            local gal_l1280 = U[tQ[39]]
                            local gal_l1282 = gal_l1279:IsA("Model")
                            while not gal_l1282 do
                                if gal_l1280(gal_l1279, gal_l1282) then
                                    return "Collecting Fire Flower"
                                end 
                            end
                            local PrimaryPart = gal_l1279.PrimaryPart
                            while PrimaryPart do end 
                        end
                    end
                    local gal_l1289 = gal210(gal278)
                    if gal_l1289 then
                        gal216(gal_l1289, true)
                    else
                        gal198:TweenToCFrameQueue(U[tQ[8]]["Forest Pirate"])
                    end
                    return true 
                end
                U[tQ[40]] = gal_l1391
                U[tQ[41]] = function(gal_p1_168, gal_p2_168, ...)
                    local gal_l1294 = gal_p1_168 < 350
                    local gal_l1295 = gal_l1294 and "Tushita" or "Yama"
                    if VerifyTool(gal_l1295) then
                        gal203(gal_l1295)
                        gal195.ToolDebounce()
                        local PirateRaid = gal_l37["PirateRaid"]
                        if PirateRaid then
                            return PirateRaid and gal193.PirateRaid()
                        else
                        end
                    end
                    gal204("LoadItem", gal_l1295)
                    return "Getting 350 in: " .. gal_l1295 
                end
                U[tQ[42]] = function(gal_p1_169, ...)
                    local gal_l1306 = gal204("CDKQuest", "OpenDoor")
                    if gal_l1306 == "opened" or gal_l1306 == "can" then
                        local Breakable = gal_p1_169:FindFirstChild("Breakable")
                        if Breakable then
                            local Breakable = gal_p1_169.Breakable
                            Breakable:Destroy()
                        end
                    end
                    return 
                end
                U[tQ[43]] = function(...)
                    if gal_l1310 then
                        return gal273.Transparency ~= 1
                    end
                    for gal_l1316, gal_l1317 in ipairs(("ipairs"):GetChildren()) do
                        local gal_l1319 = gal_l1317:IsA("MeshPart")
                        while not gal_l1319 do
                            while not gal_l1319 do end
                            U[DQ] = gal_l1317
                            return gal_l1317.Transparency ~= 1 
                        end 
                    end
                    return 
                end
                U[tQ[44]] = function(...)
                    if gal_l1324 then
                        return gal_l1322
                    end
                    local MysticIsland = Map.MysticIsland
                    local gal_l1327 = MysticIsland:FindFirstChild("dbz_map1_Cube.012", true)
                    return gal_l1327 
                end
                tQ[47] = gal201
                tQ[46] = tQ[47] == tQ[48]
                gal_l1374("Tushita", tQ[45], tQ[46])
                tQ[45] = function(...)
                    if gal209("Darkbeard") then
                        local gal_l1329 = gal210("Darkbeard")
                        if gal_l1329 then
                            U[gal_l1053](gal_l1329)
                        else
                            gal43(gal232)
                        end
                        return true
                    end
                    if VerifyTool("Fist of Darkness") then
                        gal203("Fist of Darkness")
                        gal43(gal232)
                        return true
                    end
                    return 
                end
                tQ[48] = 2
                tQ[47] = gal201
                tQ[46] = tQ[47] == tQ[48]
                gal_l1374("Darkbeard", tQ[45], tQ[46])
                tQ[45] = function(...)
                    if gal209("Cursed Captain") then
                        local gal_l1332 = gal210("Cursed Captain")
                        if gal_l1332 then
                            U[gal_l1053](gal_l1332)
                        else
                            gal43(gal233)
                        end
                        return true
                    end
                    return 
                end
                tQ[48] = 2
                tQ[47] = gal201
                tQ[46] = tQ[47] == tQ[48]
                gal_l1374("CursedCaptain", tQ[45], tQ[46])
                tQ[45] = function(...)
                    local gal_l1335 = Enemies:FindFirstChild("Core") or Enemies:FindFirstChild("Core")
                    if gal_l1335 then
                        local gal_l1336 = gal202(gal_l1335)
                        if gal_l1336 then
                            local PrimaryPart = (gal_l1316 or gal_l1335:FindFirstChild("Core")).PrimaryPart
                        end
                        gal_l1315("CursedCaptain", tQ[45], tQ[46])
                    end
                    if gal_l1335 then
                        return "Defeating Factory", gal195.GotoTargetCFrame(gal_l1335.PrimaryPart.CFrame)
                    end
                    return 
                end
                tQ[47] = gal201
                tQ[48] = 2
                tQ[46] = tQ[47] == tQ[48]
                gal_l1374("Factory", tQ[45], tQ[46])
                tQ[47] = gal201
                tQ[45] = function(...)
                    if gal205["Cursed Dual Katana"] then
                        return
                    end
                    if not gal205.Tushita then
                        return gal193.Tushita()
                    end
                    if not gal205["Yama"] then
                        local gal_l1340 = gal193.Yama()
                        if gal_l1340 then
                            return gal_l1340
                        else
                        end
                    end
                    local Tushita = gal207.Tushita
                    local Yama = gal207.Yama
                    if Tushita >= 350 and Yama >= 350 then
                        if not gal272 then
                            return U[tQ[42]](Map.Turtle.Cursed)
                        end
                        local gal_l1344 = U[tQ[27]]()
                        if gal_l1344 then
                            if gal_l1344[2] then
                                if gal217[gal_l1344][gal_l1344[2]](U[tQ[9]], gal193) then
                                    return gal_l1341 .. gal_l1344[2]
                                end
                            else
                                if gal217[gal_l1344](U[tQ[9]], gal193) then
                                    return gal_l1341
                                end
                            end
                        end
                        return
                    end
                    return U[tQ[41]](Tushita, Yama) 
                end
                tQ[48] = 3
                tQ[46] = tQ[47] == tQ[48]
                tQ[47] = gal_l1374("CursedDualKatana", tQ[45], tQ[46])
                tQ[49] = gal201
                tQ[48] = tQ[49] == tQ[50]
                tQ[46] = tQ[48]
                tQ[45] = function(...)
                    local gal_l1346 = Locations:FindFirstChild("l'\xc3\x89glise de Proph\xc3\xa9tie")
                    if gal_l1346 then
                        local gal_l1348 = LocalPlayer:DistanceFromCharacter(gal_l1346.Position) <= 150
                    end
                    if gal_l1346 then
                        local gal_l1349 = gal204("Awakener", "Check")
                        if type(gal_l1349) == "table" then
                            if Fragments.Value < (gal_l1349.Cost or 0) then
                                return true, U[gal_l170]("Awakener", "Teleport")
                            end
                            gal204("Awakener", "Awaken")
                            gal204("Awakener", "Teleport")
                        else
                            if gal204("Awakener", "Check") ~= 0 then
                                return true, U[gal_l170]("Awakener", "Teleport")
                            end
                        end
                    end
                    local gal_l1352 = gal196:IsRaiding()
                    if gal_l1352 then
                        local gal_l1354 = gal42:GetRaidIsland()
                        if gal_l1354 then
                            local GetChildren = Enemies.GetChildren
                            local gal_l1357 = {
                                GetChildren(Enemies)
                            }
                            for gal_l1360, gal_l1361 in ipairs(j(gal_l1361)) do
                                local PrimaryPart = gal_l1361.PrimaryPart
                                local gal_l1365 = gal202(gal_l1361)
                                while not gal_l1365 do
                                    while not gal_l1365 do end
                                    local gal_l1368 = (gal_l1365:GetRaidIsland().Position - PrimaryPart.Position).Magnitude <= 1000
                                    while not gal_l1368 do
                                        while not gal_l1368 do end
                                        return true, gal216(gal_l1361, true, true, gal37.FarmMode ~= "Up" and gal37.FarmMode or "Star") 
                                    end 
                                end 
                            end
                            if LocalPlayer:DistanceFromCharacter(gal_l1354.Position) <= 3000 then
                                gal43(gal_l1373:GetRaidIsland().CFrame + gal221)
                            end
                            return true
                        end
                        return true
                    end
                    local gal_l1375 = VerifyTool("Special Microchip")
                    if gal_l1375 then
                        return true, gal196:start()
                    end
                    return 
                end
                local gal_l1392 = "Raid"
                if tQ[48] then
                    local gal_l1793 = tQ[47]
                    gal_l1791("Raid", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        if not Map:FindFirstChild("FrozenHeart") then
                            local Segment = U[tQ[7]].Segment
                            if Segment then
                                local gal_l1395 = U[gal_l1191](Segment)
                            end
                            if Segment then
                                return U[tQ[26]](Segment)
                            end
                            local gal_l1400 = SeaBeasts:GetChildren()
                            for gal_l1401 = 1, #gal_l1400 do
                                local gal_l1402 = gal_l1400[gal_l1401]
                                local gal_l1403 = gal_l1402.name
                                local gal_l1404 = gal_l1403:find("Leviathan")
                                while not gal_l1404 do
                                    while not gal_l1404 do end
                                    U[tQ[7]].Segment = gal_l1402
                                    return U[tQ[26]](gal_l1402) 
                                end
                                local gal_l1406 = gal202(gal_l1402)
                                while not gal_l1406 do end 
                            end
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Leviathan", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Lighting:GetAttribute("BlueMoonEnded") then
                            return
                        end
                        local KitsuneIsland = Map:FindFirstChild("KitsuneIsland")
                        if KitsuneIsland then
                            local gal_l1415 = Lighting:GetAttribute("MoonPhase") == 5
                        end
                        if KitsuneIsland then
                            if U[tQ[23]]() then
                                return U[tQ[24]]()
                            end
                            local ShrineDialogPart = KitsuneIsland:FindFirstChild("ShrineDialogPart")
                            if ShrineDialogPart then
                                local gal_l1417 = U[gal_l142[8]]
                                if gal_l1417:DistanceFromCharacter(ShrineDialogPart.Position) <= 3 then
                                    local gal_l1418 = U[gal_l142[17]]
                                    if gal_l1418:GetAttribute("MoonPhase") == 5 and not nil then
                                        local gal_l1419 = U[IU]
                                        gal_l1419:FireServer()
                                    end
                                else
                                    U[gal_l142[11]](ShrineDialogPart.CFrame)
                                end
                            else
                                if gal_l1419:FindFirstChild("KitsuneIsland").WorldPivot then
                                    U[gal_l142[11]](gal_l1419:FindFirstChild("KitsuneIsland").WorldPivot)
                                end
                                return true
                            end
                        end
                        return 
                    end
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("KitsuneIsland", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[45] = function(...)
                        if Map:FindFirstChild("PrehistoricIsland") then
                            if gal_l37.FullyVolcano or gal_l37.GotoVolcano then
                                return false
                            end
                            if LocalPlayer:GetAttribute("CurrentLocation") == "Prehistoric Island" then
                                return false
                            end
                        else
                            if tick() - gal277 <= 30 then
                                return false
                            end
                            if gal205["Volcanic Magnet"] then
                                U[TQ] = tick()
                                return
                            end
                            local gal_l1422 = gal206["Scrap Metal"] < 10
                            if gal_l1422 then
                                local gal_l1423 = U[gal_l1363]
                                return gal_l1423:Material("Leather + Scrap Metal")
                            end
                            if gal206["Blaze Ember"] < 15 then
                                return U[gal_l1416].DragonHunter()
                            end
                            if LocalPlayer:DistanceFromCharacter(gal236.Position) < 3 then
                                U[gal_l170]("CraftItem", "Craft", "Volcanic Magnet")
                            else
                                gal43(gal236)
                            end
                            return true
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("CraftVolcanicMagnet", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[45] = function(gal_p1_170, gal_p2_170, ...)
                        local PrehistoricIsland = Map:FindFirstChild("PrehistoricIsland")
                        if PrehistoricIsland then
                            local Core = PrehistoricIsland:FindFirstChild("Core")
                            local gal_l1429 = Core and Core:FindFirstChild("ActivationPrompt")
                            if U[tQ[38]](gal_p1_170, PrehistoricIsland, Core and Core:FindFirstChild("VolcanoRocks")) then
                                U[dQ] = tick()
                                return true
                            end
                            if gal_l1429 then
                                if gal_l1429 then
                                    U[dQ] = tick()
                                end
                                if gal_l1429 then
                                    local gal_l1430 = gal_l1421:GetAttribute("IsMinigameActive")
                                    if not gal_l1430 and gal_l1430:DistanceFromCharacter(gal_l1429.Position) <= 3 then
                                        fireproximityprompt(gal_l1429:WaitForChild("ProximityPrompt", 9000000000.0))
                                    else
                                        U[gal_l142[11]]((Core and Core:FindFirstChild("ActivationPrompt")).CFrame)
                                    end
                                else
                                    if Core then
                                        local PrehistoricRelic = Core:FindFirstChild("PrehistoricRelic")
                                        local gal_l1432 = PrehistoricRelic and PrehistoricRelic:FindFirstChild("Skull")
                                    end
                                    if Core then
                                        gal43(PrehistoricIsland:FindFirstChild("Core").PrehistoricRelic.Skull.CFrame + Vector3.yAxis * 25)
                                        if gal_p2_170 then
                                            if gal_l1437 then
                                                local gal_l1439 = tick() - gal276 >= 15
                                                if gal_l1439 then
                                                    gal202(LocalPlayer.Character)
                                                end
                                                if gal_l1439 then
                                                    if gal_l37:DistanceFromCharacter((Core.PrehistoricRelic.Skull.CFrame + Vector3[gal_l1283] * 25).Position) <= 10 then
                                                        gal_l37.Character.Humanoid.Health = 0
                                                    end
                                                end
                                            end
                                            return true
                                        else
                                        end
                                    end
                                end
                            else
                            end
                        end
                        local gal_l1443 = not gal_l37.Sea
                        if gal_l1443 then
                            return gal197:DriveBoat("inf")
                        end
                        return 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[48] = 3
                    gal_l1791("FullyVolcano", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        local Enemies = gal42.Enemies
                        local gal_l1446 = Enemies:GetTagged("PirateRaid")
                        if #gal_l1446 > 0 or tick() - gal42.PirateRaid <= 10 then
                            for gal_l1447 = 1, #gal_l1446 do
                                return true, U[gal_l1053](gal_l1446[68], true, true) 
                            end
                            return true, gal43(gal224)
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("PirateRaid", tQ[45], tQ[46])
                    tQ[45] = function(gal_p1_171, ...)
                        if gal_p1_171 then
                            if gal_p1_171 then
                                local gal_l1450 = gal_p1_171:IsA("Model") or gal_p1_171:IsA("Tool")
                                gal_l1427("PirateRaid", tQ[45], tQ[46])
                            end
                            if gal_p1_171 then
                                local gal_l1451 = gal_p1_171:FindFirstChild("Handle") and gal_p1_171.Handle.CFrame
                                if not gal_l1451 and gal_p1_171:IsA("Model") then
                                end
                                if gal_l1455 then
                                    if LocalPlayer:DistanceFromCharacter(gal_l1455.Position) <= 2 then
                                        gal43((gal_l1447:FindFirstChild("Handle") and gal_l1447.Handle.CFrame) + gal219)
                                    else
                                        U[gal_l142[11]](gal_l1447:FindFirstChild("Handle") and gal_l1447.Handle.CFrame)
                                    end
                                    return true
                                end
                            end
                            return
                        end 
                    end
                    gal_l1791("Fruits", tQ[45])
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[48] = 3
                    tQ[45] = function(...)
                        local gal_l1458 = gal218:EvoDracoRace(U[gal_l1447])
                        if gal_l1458 == "FireFlowers" then
                            return U[tQ[40]](workspace:FindFirstChild("FireFlowers"))
                        end
                        return gal_l1458 
                    end
                    gal_l1791("DracoV2V3", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[45] = function(...)
                        local gal_l1460 = U[tQ[4]]["Dragon Talon"]
                        if not gal_l1460 or gal_l1460 < 500 then
                            if not VerifyTool("Dragon Talon") then
                                U[gal_l170]("BuyDragonTalon")
                            else
                                if not gal_l1460 then
                                    U[tQ[4]]["Dragon Talon"] = GetToolMastery("Dragon Talon")
                                    return true
                                end
                                U[tQ[4]]["Dragon Talon"] = GetToolMastery("Dragon Talon")
                                gal203("Dragon Talon")
                                gal195.ToolDebounce()
                                return gal193.Bones()
                            end
                        end
                        return gal218:Train(gal193) 
                    end
                    tQ[48] = 3
                    gal_l1791("DojoTrainer", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if gal269 == "Locked" then
                            return
                        end
                        if U[tQ[23]]() then
                            return U[tQ[24]]()
                        end
                        if not gal269 or not gal269.Text then
                            local gal_l1463 = LocalPlayer:DistanceFromCharacter(gal236.Position) < 5
                            if gal_l1463 then
                                local gal269 = gal252:InvokeServer(U[tQ[11]].Check)
                                if gal269 and not gal269.Text then
                                    pcall(gal252.InvokeServer, gal252, U[tQ[11]].RequestQuest)
                                end
                            else
                                gal43(gal236)
                            end
                            return "Getting Dragon Hunter Quest"
                        end
                        local Text = gal269.Text
                        if Text:find("Defeat") then
                            local gal_l1468 = Text:find("Venomous") and "Venomous Assailant" or "Hydra Enforcer"
                            local gal_l1469 = gal210(gal_l1468)
                            if gal_l1469 then
                                U[gal_l1053](gal_l1469, true)
                            else
                                if gal211[gal_l1468] then
                                    local gal_l1472 = U[gal_l1440]
                                    gal_l1472:TweenToCFrameQueue(gal211[gal_l1468])
                                end
                                return "Killing: " .. gal_l1468
                            end
                        end
                        if Text:find("Destroy") then
                            U[tQ[25]]()
                            return "Breaking Hydra Island Tree's"
                        end
                        return 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("DragonHunter", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Map:FindFirstChild("MysticIsland") then
                            local gal_l1474 = gal256["Advanced Fruit Dealer"]
                            if gal_l1474 then
                                return true, U[gal_l142[11]](gal_l1474.PrimaryPart.CFrame)
                            end
                        end
                        return 
                    end
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("MirageFruitDealer", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        if Map:FindFirstChild("MysticIsland") and U[tQ[43]]() then
                            gal43(gal273.CFrame)
                            return true
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("MirageGear", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[45] = function(...)
                        if Map:FindFirstChild("MysticIsland") then
                            return gal193.ChestTween(" from Mirage Island", Map.MysticIsland)
                        end
                        return 
                    end
                    tQ[48] = 3
                    gal_l1791("MirageChests", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Map:FindFirstChild("MysticIsland") and U[tQ[44]]() then
                            gal43(gal_l1327.CFrame + Vector3.yAxis * 211.8)
                            return true
                        end
                        return 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("TeleportMirage", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        if Map:FindFirstChild("PrehistoricIsland") then
                            local PrehistoricIsland = Map.PrehistoricIsland
                            local Core = PrehistoricIsland:FindFirstChild("Core")
                            local gal_l1482 = Core and Core:FindFirstChild("ActivationPrompt")
                            if gal_l1482 then
                                return true, U[gal_l142[11]](gal_l1482.CFrame)
                            end
                            if Core then
                                return true, U[gal_l142[11]](Core.PrehistoricRelic.Skull.CFrame + Vector3.yAxis * 25)
                            end
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("GotoVolcano", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Subclass.Value == "Shipwright" then
                            return nil
                        end
                        local gal_l1489 = {
                            gal249:InvokeServer("Shipwright")
                        }
                        local gal_l1491 = gal249:InvokeServer("Shipwright")
                        local gal_l1492 = gal_l1491 == 1
                        if gal_l1492 then
                            gal250:InvokeServer("Shipwright")
                        else
                            if gal_l1491 == 3 then
                                local gal_l1494 = gal_l1491 == gal_l1487
                                if (tonumber(gal_l1494[2]) or 0) < 20 then
                                    return gal193.Sea(U[tQ[15]].Shipwright)
                                end
                            else
                                if gal_l1491 == 4 or gal_l1491 == 2 then
                                    local GetPlayerData = U[HU].GetPlayerData
                                    local gal_l1497 = GetPlayerData:InvokeServer().Purchased.Shipwright ~= nil
                                    if gal_l1497 then
                                        local EquipSubclass = U[HU].EquipSubclass
                                        EquipSubclass:InvokeServer("Shipwright")
                                    else
                                        local gal_l1499 = U[gal_l142[12]].Value >= 3000
                                        if gal_l1499 then
                                            local PurchaseSubclass = U[HU].PurchaseSubclass
                                            PurchaseSubclass:InvokeServer("Shipwright")
                                        end
                                    end
                                end
                                return
                            end
                        end 
                    end
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Shipwright", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Data.Race.Value == "Draco" or not gal205["Warrior Helmet"] then
                            return nil
                        end
                        local gal_l1502 = gal42:GetProgress("RaceV2", "Alchemist", "1")
                        if gal_l1502 == 0 or gal_l1502 == 2 then
                            if gal_l1502 ~= 2 or Beli.Value >= 500000.0 then
                                local gal_l1504 = LocalPlayer:DistanceFromCharacter(gal243.Position) < 5
                                if gal_l1504 then
                                    local gal_l1505 = U[gal_l170]
                                    gal_l1505("Alchemist", gal_l1505:GetProgress("RaceV2", "Alchemist", "1") == 0 and "2" or "3")
                                else
                                    gal43(gal243)
                                end
                                return true
                            end
                        else
                            if gal_l1505:GetProgress("RaceV2", "Alchemist", "1") == 1 then
                                for gal_l1507 = 1, 2 do
                                    local gal_l1509 = workspace:FindFirstChild("Flower" .. gal_l1507)
                                    while not gal_l1509 do
                                        while not gal_l1509 do end
                                        return "Collecting Flower: " .. gal_l1507, gal198(gal_l1509.CFrame) 
                                    end
                                    local gal_l1513 = gal_l1509.Transparency ~= 1
                                    while not gal_l1513 do end
                                    local gal_l1517 = not VerifyTool("Flower " .. gal_l1507) 
                                end
                                if not VerifyTool("Flower 3") then
                                    local gal_l1519 = gal210("Swan Pirate")
                                    if gal_l1521 then
                                        U[gal_l1053](gal_l1519)
                                    else
                                        gal198:TweenToCFrameQueue(U[tQ[8]]["Swan Pirate"])
                                    end
                                    return "Getting Flower: 3"
                                end
                            end
                            return
                        end 
                    end
                    tQ[48] = 2
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("RaceV2", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        if Data.Race.Value == "Draco" or (not gal_l1496:FindFirstChild("Evolved") or U[tQ[5]].RaceV3) then
                            return nil
                        end
                        local gal_l1525 = gal42:GetProgress("RaceV3", "Wenlocktoad", "1")
                        if gal_l1525 == -2 then
                            if not U[tQ[5]].RaceV3 then
                                U[tQ[5]].RaceV3 = {
                                    [Data.Race.Value] = true
                                }
                            else
                                U[tQ[5]].RaceV3[Data.Race.Value] = true
                            end
                            return nil
                        end
                        if gal_l1525 == 0 or gal_l1525 == 2 then
                            if gal_l1525 ~= 2 or Beli.Value >= 2000000.0 then
                                local gal_l1527 = LocalPlayer:DistanceFromCharacter(gal244.Position) < 5
                                if gal_l1527 then
                                    local gal_l1528 = U[gal_l170]
                                    gal_l1528("Wenlocktoad", gal_l1528:GetProgress("RaceV3", "Wenlocktoad", "1") == 0 and "2" or "3")
                                else
                                    gal43(gal244)
                                end
                                return true
                            end
                        else
                            if gal_l1528:GetProgress("RaceV3", "Wenlocktoad", "1") == 1 then
                                if gal_l1502 == "Fishman" then
                                    return gal193.Sea(U[tQ[12]].Shark)
                                end
                                if gal_l1502 == "Human" then
                                    for gal_l1533, gal_l1534 in ipairs(gal_l1534.Human) do
                                        if gal209(gal_l1534) then
                                            return U[tQ[22]](gal42.Bosses[gal_l1534], gal_l1534)
                                        end 
                                    end
                                else
                                    if Data.Race.Value == "Mink" then
                                        return gal193.ChestTween(" for Mink V3")
                                    end
                                end
                            end
                            return
                        end 
                    end
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("RaceV3", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        if gal205["Shark Anchor"] then
                            return
                        end
                        local SharkAnchor = U[tQ[15]].SharkAnchor
                        if gal205["Monster Magnet"] then
                            return gal193.Sea(SharkAnchor.Terrorshark, false)
                        end
                        local gal_l1537 = {}
                        for gal_l1541, gal_l1542 in pairs() do
                            while SharkAnchor.Drops.Materials do
                                ({})[gal_l1517] = true 
                            end 
                        end
                        if next(gal_l1537) then
                            return gal193.Sea(gal_l1537, false)
                        end
                        gal204("CraftItem", "Check", "SharkAnchor")
                        gal204("CraftItem", "Craft", "SharkAnchor")
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("SharkAnchor", tQ[45], tQ[46])
                    tQ[45] = function(gal_p1_172, ...)
                        if gal_p1_172 then
                            local gal_l1547 = gal197:GetSeaEvents(U[tQ[6]].SecondSea, gal_p1_172)
                            if gal_l1547 then
                                local gal_l1549 = U[gal_l1542]
                                return true, gal_l1549:attackSeaEvent(gal_l1547)
                            end
                            if gal197:CanRepair() then
                                local gal_l1551 = U[gal_l1542]
                                return gal_l1551:RepairBoat()
                            end
                            local gal_l1552 = gal37.autoDriveBoat
                            if gal_l1552 then
                                local gal_l1553 = U[gal_l1542]
                                return gal_l1553:DriveBoat()
                            end
                            return
                        else
                        end 
                    end
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[48] = 3
                    gal_l1791("Sea", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[45] = function(gal_p1_173, gal_p2_173, ...)
                        if gal_p1_173 then
                            local gal_l1559 = gal_p2_173 ~= false
                            if gal_l1559 then
                                local gal_l1562 = gal_p1_173("Sea", tQ[45], tQ[46])
                                if gal_p2_173 then
                                    local gal_l1565 = gal197:GetSeaEvents(U[tQ[6]].ThirdSea, gal_p1_173, gal_p2_173)
                                    if gal37 then
                                        local gal_l1567 = U[gal_l1542]
                                        return true, gal_l1567:attackSeaEvent(gal37)
                                    end
                                    if gal197:CanRepair() then
                                        local gal_l1569 = U[gal_l1542]
                                        return gal_l1569:RepairBoat()
                                    end
                                    local gal_l1570 = gal37.autoDriveBoat
                                    if gal_l1570 then
                                        local gal_l1571 = U[gal_l1542]
                                        return gal_l1571:DriveBoat()
                                    end
                                    return
                                else
                                end
                            end
                        else
                        end 
                    end
                    gal_l1791("Sea", tQ[45], tQ[46])
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[48] = 2
                    tQ[45] = function(...)
                        if gal205.Rengoku or gal_l37.Level then
                            return nil
                        end
                        if VerifyTool("Library Key") then
                            return gal204("OpenLibrary")
                        end
                        if VerifyTool("Hidden Key") then
                            return gal204("OpenRengoku")
                        end
                        if gal209("Awakened Ice Admiral") then
                            return U[tQ[22]](gal42.Bosses["Awakened Ice Admiral"], "Awakened Ice Admiral")
                        end
                        if Level.Value >= 1425 or not gal_l37.Level then
                            local gal_l1574 = gal210("Arctic Warrior", "Snow Lurker")
                            if gal_l1574 then
                                U[gal_l1053](gal_l1574)
                                return true
                            end
                        end
                        return 
                    end
                    gal_l1791("Rengoku", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Level.Value < 850 or gal205["Warrior Helmet"] then
                            return nil
                        end
                        local gal_l1577 = gal42:GetProgress("Bartilo", "BartiloQuestProgress")
                        if gal_l1577.KilledSpring then
                            gal204("BartiloQuestProgress", "DidPlates")
                        else
                            if gal_l1577.KilledBandits then
                                if U[gal_l932]("Jeremy") then
                                    local gal_l1579 = U[gal_l933]("Jeremy")
                                    if gal_l1579 then
                                        U[gal_l1053](gal_l1579)
                                    else
                                        U[tQ[8]](CFrame.new(2316, 449, 787))
                                    end
                                    return true
                                end
                            else
                                if not gal42:GetProgress("Bartilo", "KilledBandits")["KilledBandits"] then
                                    local gal_l1583 = gal194:VerifyQuest("Swan Pirate") and gal194:VerifyQuest("50")
                                    if gal_l1583 then
                                        local gal_l1585 = gal210("Swan Pirate")
                                        if gal_l1585 then
                                            U[gal_l1053](gal_l1585)
                                        else
                                            gal198:TweenToCFrameQueue(U[tQ[8]]["Swan Pirate"])
                                        end
                                    else
                                        gal194:StartQuest("BartiloQuest", 1, gal241)
                                    end
                                    return true
                                end
                                return
                            end
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Bartilo", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        if gal205.Yama then
                            return nil
                        end
                        if gal42:GetProgress("EliteProgress", "EliteHunter", "Progress") >= 30 then
                            if LocalPlayer:DistanceFromCharacter(gal237.Position) < 5 then
                                pcall(U[tQ[37]])
                                task.wait(1)
                            else
                                gal43(gal237)
                            end
                            return true
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Yama", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        if Level.Value < 1800 or gal205["Musketeer Hat"] then
                            return nil
                        end
                        local gal_l1592 = gal42:GetProgress("Citizen", "CitizenQuestProgress")
                        local gal_l1594 = gal195:GetNpcVectorCFrame("Citizen")
                        if gal_l1592.KilledBoss then
                            return true, gal43(gal245)
                        end
                        if gal_l1592.KilledBandits then
                            if gal209("Captain Elephant") then
                                if not gal194:VerifyQuest("Captain Elephant") then
                                    if gal194:DistanceFromCharacter(gal195:GetNpcVectorCFrame("Citizen").Position) >= 5 then
                                        U[gal_l170]("CitizenQuestProgress", "Citizen")
                                    else
                                        gal210(gal195:GetNpcVectorCFrame("Citizen"))
                                    end
                                    return true
                                end
                                local gal_l1598 = gal210("Captain Elephant")
                                if gal_l1598 then
                                    U[gal_l1053](gal_l1598)
                                else
                                    gal43(gal246)
                                end
                                return true
                            end
                            return
                        end
                        local gal_l1601 = gal194:VerifyQuest("Forest Pirate")
                        if gal_l1601 and gal194:VerifyQuest("50") then
                            local gal_l1603 = gal210("Forest Pirate")
                            if gal_l1603 then
                                U[gal_l1053](gal_l1603, true)
                            else
                                gal198:TweenToCFrameQueue(U[tQ[8]]["Forest Pirate"])
                            end
                            return true
                        end
                        if LocalPlayer:DistanceFromCharacter(gal_l1594.Position) >= 5 then
                            gal204("CitizenQuest", 1)
                        else
                            gal43(gal_l1594)
                        end
                        return true 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Citizen", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if gal271 then
                            return
                        end
                        local gal_l1608 = gal194:VerifyQuest(gal279)
                        if gal_l1608 then
                            if gal209(gal_l1608) then
                                return U[tQ[22]](gal42.Bosses[gal_l1608], gal_l1608, true)
                            end
                        else
                            if gal204("HornedMan") ~= 1 then
                                U[gal_l170]("HornedMan", "Bet")
                            else
                                U[sQ] = true
                            end
                            return
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("RainbowHaki", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        gal194:VerifyQuest(gal212)
                        local gal_l1610 = gal_l37.DoughKing or (gal_l37.CakePrince or gal_l37.RipIndra)
                        if gal_l1610 then
                            local gal_l1612 = gal209("rip_indra True Form")
                            if gal_l1612 then
                                local gal_l1613 = gal_l1612 or (VerifyTool("God's Chalice") or VerifyTool("Sweet Chalice"))
                                if gal_l1613 then
                                    return nil
                                end
                                if gal194:VerifyQuest(gal212) then
                                    local gal_l1616 = U[gal_l933](gal194:VerifyQuest(gal212))
                                else
                                    local Enemies = gal42.Enemies
                                    local gal_l1619 = Enemies:GetEnemyByTag("Elite")
                                    if gal_l1619 then
                                        local gal_l1621 = gal195:GetNpcVectorCFrame("Elite Hunter")
                                        gal43(gal_l1621)
                                        gal198:InteractWithNpc(gal_l1621, "EliteHunter")
                                        return "Getting Elite Quest: " .. gal_l1619.Name
                                    end
                                end
                            end
                        end 
                    end
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("EliteHunter", tQ[45], tQ[46])
                    tQ[45] = function(gal_p1_174, gal_p2_174, ...)
                        local gal_l1624 = gal42.Berry(gal_p1_174)
                        if gal_l1624 then
                            local gal_l1626 = {
                                pairs(gal_l1624:GetAttributes())
                            }
                            local gal_l1627 = gal_l1626[3]
                            local gal_l1628 = gal_l1626[2]
                            local gal_l1629 = pairs(gal_l1624:GetAttributes())
                            local gal_l1630, gal_l1631 = gal_l1629(gal_l1628, gal_l1627), nil
                            if gal_l1630 then
                                local Parent = gal_l1622(gal_l1608).Parent
                                local gal_l1633 = Parent:GetPivot() * Parent:GetAttribute(gal_l1630)
                                local gal_l1635 = LocalPlayer:DistanceFromCharacter(gal_l1633.Position) < 3
                                if gal_l1635 then
                                    local gal_l1636 = U[uU]
                                    gal_l1636:InvokeServer(Parent.Name, gal_l1630)
                                else
                                    gal43(gal_l1633)
                                end
                                return "Collecting Berry: " .. 72
                            end
                        else
                            if gal_p2_174 then
                                if gal_p2_174 then
                                    gal42:ServerHop()
                                end
                                return
                            end
                        end 
                    end
                    gal_l1791("BerryBush", tQ[45])
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Level.Value < 1500 or Level.Value >= 1850 then
                            return nil
                        end
                        local Zou2 = U[tQ[5]].Zou2
                        gal42:GetProgress("Zou1", "ZQuestProgress")
                        if Zou2 then
                            if not Zou2 then
                                if gal42:GetProgress("Unlockables", "GetUnlockables").FlamingoAccess then
                                    return gal193.DonSwan()
                                end
                                return nil
                            end
                            if not U[tQ[5]].Zou2 then
                                U[tQ[5]].Zou2 = true
                            end
                            local gal_l1643 = LocalPlayer:DistanceFromCharacter(gal240.Position)
                            if gal_l1643 < 1200 then
                                local rip_indra = gal43:FindFirstChild("rip_indra")
                                if rip_indra then
                                    U[gal_l1053](rip_indra)
                                end
                                return true
                            end
                            local KilledIndraBoss = gal_l1646:GetProgress("Zou1", "ZQuestProgress").KilledIndraBoss
                            if KilledIndraBoss then
                                return gal42:TravelTo(3)
                            end
                            local gal_l1651 = LocalPlayer:DistanceFromCharacter(gal223.Position)
                            if gal_l1651 < 5 then
                                gal204("ZQuestProgress", "Begin")
                                gal32.OnFarm = false
                                local gal_l1653 = LocalPlayer:DistanceFromCharacter(gal240.Position) < 1200
                                if gal_l1653 then
                                    task.wait()
                                    local gal_l1656 = LocalPlayer:DistanceFromCharacter(gal240.Position) < 1200
                                    local gal_l1657 = not gal_l37[gal37.RunningOption]
                                    while gal_l1656 do
                                        while not gal_l1657 do end
                                        return true 
                                    end
                                else
                                end
                            end
                            gal43(gal223)
                            return
                        else
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("ThirdSea", tQ[45], tQ[46])
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if not gal205["Warrior Helmet"] then
                            return nil
                        end
                        if gal209("Don Swan") then
                            local gal_l1663 = gal210("Don Swan")
                            if gal_l1663 then
                                U[gal_l1053](gal_l1663)
                            else
                                gal43(gal242)
                            end
                            return true
                        end
                        return 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("DonSwan", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Level.Value < 700 then
                            return
                        end
                        local gal_l1666 = gal42:GetProgress("Dressrosa", "DressrosaQuestProgress")
                        if gal_l1666.KilledIceBoss and (not gal205["Warrior Helmet"] and Level.Value < 1250) then
                            return gal42:TravelTo(2)
                        end
                        if not gal_l1666.TalkedDetective then
                            gal204("DressrosaQuestProgress", "Detective")
                        else
                            if not gal_l1666.UsedKey then
                                if not VerifyTool("Key") then
                                    U[gal_l170]("DressrosaQuestProgress", "Detective")
                                end
                                gal203("Key")
                                gal204("DressrosaQuestProgress", "UseKey")
                            else
                                if not gal_l1667:GetProgress("Dressrosa", "DressrosaQuestProgress").KilledIceBoss then
                                    local gal_l1668 = gal210("Ice Admiral")
                                    if gal_l1668 then
                                        U[gal_l1053](gal_l1668)
                                    else
                                        gal43(gal229)
                                    end
                                end
                                return true
                            end
                        end 
                    end
                    tQ[48] = 1
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("SecondSea", tQ[45], tQ[46])
                    tQ[48] = 2
                    tQ[47] = gal201
                    tQ[45] = function(gal_p1_175, ...)
                        local Order = Enemies:FindFirstChild("Order")
                        if gal_l1675 then
                            return "Defeating Law", gal216(Order, true)
                        end
                        if not VerifyTool("Microchip") and not Order then
                            return U[tQ[35]]()
                        end
                        if VerifyTool("Microchip") and Enemies then
                            return pcall(U[tQ[36]])
                        end
                        return 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Order", tQ[45], tQ[46])
                    tQ[48] = 1
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if Level.Value < 200 or gal205.Saber then
                            return nil
                        end
                        local gal_l1677 = gal42:GetProgress("Shanks", "ProQuestProgress")
                        if gal_l1677.UsedRelic then
                            if gal209("Saber Expert") then
                                local gal_l1679 = gal210("Saber Expert")
                                if gal_l1679 then
                                    U[gal_l1053](gal_l1679)
                                else
                                    gal43(gal235)
                                end
                                return true
                            end
                        else
                            if gal_l1677.KilledMob then
                                if VerifyTool("Relic") then
                                    U[gal_l170]("ProQuestProgress", "PlaceRelic")
                                else
                                    U[gal_l170]("ProQuestProgress", "RichSon")
                                end
                                return true
                            end
                            if gal_l1677.UsedCup then
                                if not gal42:GetProgress("Shanks", gal_l1679).TalkedSon then
                                    return U[gal_l170]("ProQuestProgress", "RichSon")
                                end
                                if U[gal_l932]("Mob Leader") then
                                    local gal_l1682 = U[gal_l933]("Mob Leader")
                                    if gal_l1682 then
                                        U[gal_l1053](gal_l1682)
                                    else
                                        U[gal_l142[11]](CFrame.new(-2880, 9, 5430))
                                    end
                                    return true
                                end
                                return
                            end
                            if gal_l1677.UsedTorch then
                                if VerifyTool("Cup") then
                                    if gal_l1690 then
                                        gal204("ProQuestProgress", "FillCup", gal_l1690)
                                        U[gal_l170]("ProQuestProgress", "SickMan")
                                        return true
                                    else
                                    end
                                else
                                    U[gal_l170]("ProQuestProgress", "GetCup")
                                end
                            end
                            local Plates = gal_l1677.Plates
                            local gal_l1697, gal_l1698 = next(Plates, gal_l1685), nil
                            while gal_l1697 do
                                U[gal_l170]("ProQuestProgress", "Plate", gal_l1677.Managers.ItemsManager)
                                return true 
                            end
                            if VerifyTool("Torch") then
                                U[gal_l170]("ProQuestProgress", "DestroyTorch")
                            else
                                U[gal_l170]("ProQuestProgress", "GetTorch")
                            end
                            return true
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[48] = 1
                    gal_l1791("Saber", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        if Level.Value < 450 or gal205["Pole (1st Form)"] then
                            return
                        end
                        if gal209("Thunder God") then
                            local gal_l1700 = gal210("Thunder God")
                            if gal_l1700 then
                                U[gal_l1053](gal_l1700)
                            else
                                gal43(gal238)
                            end
                            return true
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("PoleV1", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        if Level.Value < 100 or gal205["Shark Saw"] then
                            return nil
                        end
                        if gal209("The Saw") then
                            local gal_l1703 = gal210("The Saw")
                            if gal_l1703 then
                                U[gal_l1053](gal_l1703)
                            else
                                gal43(gal239)
                            end
                            return true
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[48] = 1
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("TheSaw", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        local gal_l1705 = gal210("Soul Reaper")
                        if gal_l1705 then
                            gal216(gal_l1705)
                            return true
                        end
                        if VerifyTool("Hallow Essence") then
                            gal203("Hallow Essence")
                            gal43(gal228)
                            return true
                        end
                        return 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("SoulReaper", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if gal209("rip_indra True Form") then
                            local gal_l1708 = gal210("rip_indra True Form")
                            if gal_l1708 then
                                U[gal_l1053](gal_l1708)
                            else
                                gal43(gal226)
                            end
                            return "Defeating: rip_indra True Form"
                        end
                        if VerifyTool("God's Chalice") then
                            local gal_l1710 = U[tQ[29]]()
                            if gal_l1710 == 1 then
                                return "Activating Places"
                            end
                            if gal_l1710 == 2 then
                                return "God's Chalice: rip_indra True Form", gal43(gal227)
                            end
                        end
                        return 
                    end
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("RipIndra", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        local BossSelected = gal37.BossSelected
                        if BossSelected then
                            gal209(BossSelected)
                        end
                        if BossSelected then
                            return U[tQ[22]](gal42.Bosses[BossSelected], BossSelected)
                        end
                        return 
                    end
                    gal_l1791("BossSelected", tQ[45])
                    tQ[45] = function(...)
                        local gal_l1712 = U[tQ[21]]()
                        if gal_l1712 then
                            return U[tQ[22]](gal42.Bosses[gal_l1712], gal_l1712)
                        end
                        return 
                    end
                    gal_l1791("AllBosses", tQ[45])
                    tQ[45] = function(...)
                        if gal261 and gal262 then
                            if not VerifyTool(gal261) then
                                return gal204("LoadItem", gal261)
                            end
                            gal203(gal261)
                            local ToolDebounce = gal195.ToolDebounce
                            ToolDebounce()
                            if not (gal_l37.TyrantSkies or (gal_l37.CakePrince or (gal_l37.DoughKing or (gal_l37.Bones or (gal_l37.Level or gal_l37.Material))))) then
                                return U[gal_l1697].Bones()
                            end
                        else
                            for gal_l1718, gal_l1719 in pairs(gal_l1709) do
                                local gal_l1720 = gal_l1719.Type == "Sword"
                                while not gal_l1720 do
                                    while not gal_l1720 do end 
                                end
                                local gal_l1725 = gal207[gal_l1718] < gal199
                                while not gal_l1725 do end 
                            end
                            if nil then
                                U[SU] = nil
                            else
                                U[YU] = true
                            end
                            return
                        end 
                    end
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("MasterySwords", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[45] = function(...)
                        local gal_l1730 = gal210("Tyrant of the Skies")
                        if gal_l1730 then
                            return "Defeating Tyrant of the Skies", gal216(gal_l1730, true)
                        end
                        if not gal264 then
                            return false
                        end
                        if gal264.Transparency == 0 then
                            local gal_l1732 = U[tQ[30]]()
                            if gal_l1732 then
                                local PrimaryPart = gal263.PrimaryPart
                                gal203(gal197:GetRandomWeapon(), true)
                                gal42.UseSkills(PrimaryPart.CFrame, gal37.MasterySkills)
                                return "Breaking Breakables", gal43(PrimaryPart.CFrame)
                            end
                            return "Waiting Breakables", gal43(gal247)
                        end
                        local Enemies = gal42.Enemies
                        local gal_l1737 = not gal194:VerifyQuest("Skull Slayer")
                        if gal_l1737 then
                            U[tQ[18]]("Tiki Quest Giver 3", 2575, Enemies:GetClosestByTag("TyrantSkies"))
                        end
                        if gal_l1737 then
                            gal194:StartQuest("TikiQuest3", 2, gal268)
                        else
                            if gal_l1733 then
                                U[gal_l1053](gal_l1738:GetClosestByTag("TyrantSkies"), true, true)
                            else
                                gal43(gal248)
                            end
                            return "Making Red Eyes"
                        end 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("TyrantSkies", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[45] = function(...)
                        local gal_l1740 = gal210("Dough King") or gal210("Cake Prince")
                        if VerifyTool("Red Key") then
                            gal204("CakeScientist", "Check")
                            return true
                        end
                        if gal_l1740 then
                            gal216(gal_l1740)
                            return true
                        end
                        local gal_l1742 = not VerifyTool("Sweet Chalice")
                        if gal_l1742 then
                            local gal_l1744 = gal206["Conjured Cocoa"] < 10
                            if gal_l1744 then
                                local gal_l1745 = U[gal_l1698]
                                return gal_l1745:Material("Conjured Cocoa")
                            end
                            gal43(gal231)
                            gal198:InteractWithNpc(gal231, "SweetChaliceNpc")
                            return true
                        end
                        return U[tQ[28]]() 
                    end
                    tQ[47] = gal201
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("DoughKing", tQ[45], tQ[46])
                    tQ[48] = 3
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        if gal_l37.DoughKing then
                            return nil
                        end
                        local gal_l1747 = gal210("Dough King") or gal210("Cake Prince")
                        if gal_l1747 then
                            gal216(gal_l1747)
                            return true
                        end
                        return U[tQ[28]]() 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("CakePrince", tQ[45], tQ[46])
                    tQ[45] = function(gal_p1_176, gal_p2_176, ...)
                        local gal_l1749 = gal42.Chests()
                        if gal_l1749 then
                            local gal_l1750 = gal_l1749:GetPivot(gal_p2_176)
                            local gal_l1752 = LocalPlayer:DistanceFromCharacter(gal_l1750.Position) < 3
                            if gal_l1752 then
                                gal43(gal_l1750 + gal220)
                                task.wait(.15)
                            else
                                U[gal_l142[11]](gal_l1750)
                            end
                            return "Collecting Chest" .. (gal_p1_176 or "")
                        end
                        return 
                    end
                    tQ[48] = 2
                    gal_l1791("ChestTween", tQ[45])
                    tQ[47] = gal201
                    tQ[45] = function(...)
                        local gal_l1754 = gal210(gal215)
                        if gal_l1754 then
                            return "Killing: " .. gal_l1754.Name, gal216(gal_l1754, true, true)
                        end
                        return "Waiting for: Enemy Spawn", gal43(gal225) 
                    end
                    tQ[46] = tQ[47] == tQ[48]
                    gal_l1791("Ectoplasm", tQ[45], tQ[46])
                    tQ[47] = gal201
                    tQ[48] = 3
                    tQ[46] = tQ[47] == tQ[48]
                    tQ[45] = function(...)
                        if gal_l37.Level and Level.Value < gal200 then
                            return
                        end
                        local Enemies = gal42.Enemies
                        local gal_l1757 = Enemies:GetClosestByTag("Bones")
                        local gal_l1759 = not gal194:VerifyQuest(gal213[4])
                        if gal_l1759 then
                            U[tQ[18]]("Haunted Castle Quest Giver 2", 2050, Target)
                        end
                        if gal_l1759 then
                            gal194:StartQuest("HauntedQuest2", 2, gal268)
                            return true
                        end
                        if gal_l1757 then
                            return "Killing: " .. gal_l1757.Name, gal216(gal_l1757, true, true)
                        end
                        return "Waiting for: Enemy Spawn", gal43(gal234) 
                    end
                    gal_l1791("Bones", tQ[45], tQ[46])
                    tQ[45] = function(...)
                        local gal_l1763 = gal194:GetQuest()
                        if not gal_l1763 then
                            return nil
                        end
                        local gal_l1765 = gal194:VerifyQuest(gal_l1763.Enemy.Name)
                        if gal_l1765 then
                            return U[tQ[22]](gal42.Bosses[gal_l1765], gal_l1765, false)
                        end
                        if gal_l1765 then
                            local gal_l1767 = gal210(gal_l1765)
                            if gal_l1767 then
                                return "Killing: " .. gal_l1767.Name, U[gal_l1053](gal_l1767, true)
                            end
                            local gal_l1770 = #gal_l1763.Enemy.Position > 0
                            if gal_l1770 then
                                local gal_l1771 = U[gal_l1729]
                                gal_l1771:TweenToCFrameQueue(gal_l1763.Enemy.Position)
                            else
                                if gal_l1771:GetQuestPosition(gal_l1763.Name) then
                                    gal43(gal_l1771:GetQuestPosition(gal_l1763.Name) * gal194._Position)
                                end
                                return "Waiting for: " .. gal_l1771:VerifyQuest(gal_l1759)
                            end
                        end
                        return gal194:StartQuest(gal_l1763.Name, gal_l1763.Count, gal194:GetQuestPosition(gal_l1763.Name)) 
                    end
                    gal_l1791("Level", tQ[45])
                    tQ[45] = function(...)
                        if gal201 == 3 and Level.Value >= gal200 then
                            return gal193.Bones()
                        end
                        return gal193.Level() 
                    end
                    gal_l1791("Mastery", tQ[45])
                    tQ[45] = function(...)
                        local gal_l1774 = gal37.fMaterial
                        if gal_l1774 then
                            return gal195:Material(gal37.fMaterial)
                        end
                        return 
                    end
                    gal_l1791("Material", tQ[45])
                    tQ[45] = function(...)
                        local gal_l1776 = gal266 and gal266.PrimaryPart
                        if gal_l1776 then
                            local gal_l1777 = gal202(gal266)
                            if gal_l1777 then
                                local gal_l1778 = U[gal_l142[8]]
                                local gal_l1779 = gal_l1778:DistanceFromCharacter((gal266 and gal266.PrimaryPart).Position) < 1500
                            end
                            gal_l1758("Material", tQ[45])
                        end
                        if gal_l1776 then
                            return "Killing: " .. gal266.Name, gal216(gal266, true, true)
                        end
                        for gal_l1784, gal_l1785 in ipairs(Enemies:GetChildren()) do
                            local PrimaryPart = gal_l1785.PrimaryPart
                            local gal_l1788 = gal202(gal_l1785)
                            while not gal_l1788 do
                                while not gal_l1788 do end
                                repeat

                                until gal_l1775:DistanceFromCharacter(PrimaryPart.Position) < 1500 
                            end 
                        end
                        if nil then
                            gal216(nil, true, true)
                            return true
                        end
                        task.wait(.4)
                        return 
                    end
                    gal_l1791("Nearest", tQ[45])
                    tQ[45] = 3
                    if gal201 == tQ[45] then
                        tQ[48] = function(...)
                            gal218:UpdateBeltProgress("Red", 1)
                            return 
                        end
                        tQ[45] = 214
                        tQ[52] = "Dojo quest abandoned!"
                        tQ[49] = "<Color=Yellow><QUEST COMPLETED!><Color=/>"
                        tQ[51] = "Head back to the Dojo to complete more tasks."
                        tQ[46] = 215
                        U[tQ[45]] = "Do you want to open the portal now?"
                        U[tQ[46]] = false
                        tQ[50] = function(...)
                            gal218:UpdateBeltProgress("White", 8)
                            return 
                        end
                        tQ[53] = "Signals"
                        tQ[47] = function(...)
                            return 
                        end
                        tQ[48] = 216
                        U[tQ[48]] = {
                            ["Obtained <Color=Purple><Mutant Tooth><Color=/> (1x)"] = tQ[48],
                            [tQ[49]] = tQ[50],
                            [tQ[51]] = tQ[47],
                            [tQ[52]] = tQ[47]
                        }
                        tQ[49] = "table"
                        tQ[49] = "insert"
                        tQ[49] = rz_connections
                        tQ[52] = gal42
                        tQ[51] = tQ[52][tQ[53]]
                        tQ[52] = "Notify"
                        tQ[53] = "Connect"
                        tQ[50] = tQ[51][tQ[52]]
                        tQ[47] = nil
                        tQ[52] = function(gal_p1_177, ...)
                            local gal_l1797 = U[tQ[48]][gal_p1_177]
                            if gal_l1797 then
                                return gal_l1797()
                            end
                            if gal_p1_177:find("Earned <Color=Green>%$%d+<Color=/>") then
                                local gal_l1799 = LocalPlayer:GetAttribute("DangerLevel") >= 100
                                if gal_l1799 then
                                    local gal_l1800 = U[gal_l1107]
                                    gal_l1800:UpdateBeltProgress("Yellow", 1)
                                else
                                    local gal_l1803 = not VerifyTool("God's Chalice")
                                end
                            end 
                        end
                        tQ[53] = tQ[50][tQ[53]]
                        tQ[51] = {
                            tQ[53](tQ[50], tQ[52])
                        }
                        tQ[46] = nil
                        tQ[48] = nil
                        tQ[45] = nil
                        Env[tQ[49]][tQ[49]](tQ[49], j(tQ[51]))
                    end
                    tQ[42] = nil
                    tQ[26] = nil
                    tQ[32] = nil
                    tQ[40] = nil
                    tQ[23] = nil
                    tQ[28] = nil
                    tQ[36] = nil
                    tQ[1] = nil
                    tQ[13] = nil
                    tQ[44] = nil
                    tQ[10] = nil
                    tQ[11] = nil
                    tQ[19] = nil
                    tQ[18] = nil
                    tQ[15] = nil
                    tQ[38] = nil
                    tQ[35] = nil
                    tQ[20] = nil
                    tQ[41] = nil
                    tQ[17] = nil
                    tQ[24] = nil
                    tQ[9] = nil
                    tQ[39] = nil
                    tQ[12] = nil
                    tQ[22] = nil
                    tQ[29] = nil
                    tQ[14] = nil
                    tQ[5] = nil
                    tQ[37] = nil
                    tQ[25] = nil
                    tQ[8] = nil
                    tQ[4] = nil
                    tQ[34] = nil
                    tQ[43] = nil
                    tQ[31] = nil
                    tQ[30] = nil
                    tQ[33] = nil
                    tQ[6] = nil
                    tQ[2] = nil
                    tQ[16] = nil
                    tQ[3] = nil
                    tQ[27] = nil
                    tQ[21] = nil
                    tQ[7] = nil
                    return
                else
                    tQ[50] = 3
                    tQ[49] = gal201
                    tQ[48] = tQ[49] == tQ[50]
                    tQ[46] = tQ[48]
                end 
            end
            gal48.Webhooks = function(gal_p1_178, ...)
                local gal_l1807 = gal_p1_178
                if gal42.Webhooks then
                    gal1.load("{Utils}/BloxFruits/Webhooks.lua")(gal42)
                end
                return 
            end
            gal_l1816("Initialize")
            gal_l1816("StartFarm")
            gal_l1816("StartFunctions")
            task.spawn(gal_l1816, "LoadLibrary")
            task.spawn(gal_l1816, "Webhooks")
            return 
        end
        local gal_l1819 = not ("Team"):FindFirstChild("Main")
    end
else
end
