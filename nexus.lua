local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService('Players').LocalPlayer
local MeleeName = {}
local MeleeList = {}
local MeleeRequestList = {
    ["Death Step"] = "BuyDeathStep",
    ["Sharkman Karate"] = "BuySharkmanKarate",
    ["Electric Claw"] = "BuyElectricClaw",
    ["Dragon Talon"] = "BuyDragonTalon",
    ["Godhuman"] = "BuyGodhuman",
    ["Superhuman"] = "BuySuperhuman"
}
local function len(x)
    local q = 0
    for i, v in pairs(x) do
        q = q + 1
    end
    return q
end
local function getMeleeName() 
    table.clear(MeleeName)
    for i, v in pairs(MeleeRequestList) do 
        RequestMeleeName =  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(v, true)
        if tonumber(RequestMeleeName) == 1 then 
            table.insert(MeleeName, i)
        end
    end
    return MeleeName
end
local function getLevel() 
    return LocalPlayer.Data.Level.Value
end 
local function getWorld() 
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
        World = 3
    elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 and not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then
        World = 2
    else
        World = 1
    end
    return World
end
local function split(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)
    for each in str:gmatch(regex) do
       table.insert(result, each)
    end
    return result
end
local function getFruitName ()
    if LocalPlayer:FindFirstChild("Backpack") then 
        for i,v in pairs(LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do 
            if v.ToolTip == "Blox Fruit" then 
                return split(v.Name, "-")[1]
            end
        end
    end
    repeat wait() until LocalPlayer.Character
    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool.ToolTip == "Blox Fruit" then
            return split(Tool.Name, "-")[1]
        end
    end
    return 'None'
end
local function getFruitMaster ()
    if LocalPlayer:FindFirstChild("Backpack") then 
        for i,v in pairs(LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do 
            if v.ToolTip == "Blox Fruit" then 
                if v:FindFirstChild("Level") then 
                    return v.Level.Value
                end
            end
        end
    end
    repeat wait() until LocalPlayer.Character
    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool.ToolTip == "Blox Fruit" then
            if Tool:FindFirstChild("Level") then 
                return Tool.Level.Value
            end
        end
    end
    return 0
end
local function getMeleeuse()
    if LocalPlayer:FindFirstChild("Backpack") then 
        for i,v in pairs(LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do 
            if v.ToolTip == "Melee" then 
                return v.Name
            end
        end
    end
    repeat wait() until LocalPlayer.Character
    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool.ToolTip == "Melee" then
            return Tool.Name
        end
    end
    return 'Combat'
end
local function getMeleeMaster ()
    if LocalPlayer:FindFirstChild("Backpack") then 
        for i,v in pairs(LocalPlayer:FindFirstChild("Backpack"):GetChildren()) do 
            if v.ToolTip == "Melee" then 
                if v:FindFirstChild("Level") then 
                    return v.Level.Value
                end
            end
        end
    end
    repeat wait() until LocalPlayer.Character
    if LocalPlayer.Character:FindFirstChildOfClass("Tool") then 
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool.ToolTip == "Melee" then
            if Tool:FindFirstChild("Level") then 
                return Tool.Level.Value
            end
        end
    end
    return 0
end
local function getSkillAwakenCount() 
    SkillAwakened = 0 
    getAwakenedAbilitiesRequests = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if getAwakenedAbilitiesRequests then
        for i, v in pairs(getAwakenedAbilitiesRequests) do
            if v["Awakened"] then 
                    SkillAwakened = SkillAwakened + 1;
                end
            end
            return SkillAwakened, len(getAwakenedAbilitiesRequests)
        else
            return 0, 0
    end
end
local function findItem(item) 
    RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventory")
    for i, __ in pairs(RequestGetInvertory) do
        if __["Name"] == item then
            return true
        end
    end
    return false
end
local function countMelee() 
    table.clear(MeleeList)
    for i, v in pairs(MeleeRequestList) do 
        MeleeRequests =  game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(v, true)
        if tonumber(MeleeRequests) == 1 then 
            MeleeList[v] = true
        end
    end
    return len(MeleeList)
end

local SwordList = {}
local function getSword()
    table.clear(SwordList)
    RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i , v in pairs(RequestGetInvertory) do 
        if v['Type'] == "Sword" then 
            table.insert(SwordList, {
                Name =  v['Name'],
                Rarity = v['Rarity']
            })
        end
    end
    return SwordList
end
local FruitList = {}
local function getFruitList()
    table.clear(FruitList)
    RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i , v in pairs(RequestGetInvertory) do 
        if v['Type'] == "Blox Fruit" then 
            table.insert(FruitList, {
                Name =  v['Name'],
                Rarity = v['Rarity']
            })
        end
    end
    return FruitList
end
local MaterialList = {}
local function getMaterialList()
    table.clear(MaterialList)
    RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i , v in pairs(RequestGetInvertory) do 
        if v['Type'] == "Material" then 
            table.insert(MaterialList, {
                Name =  v['Name'],
                Rarity = v['Rarity']
            })
        end
    end
    return MaterialList
end
local AccessoryList = {}
local function getAccessoryList()
    table.clear(AccessoryList)
    RequestGetInvertory = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory")
    for i , v in pairs(RequestGetInvertory) do 
        if v['Type'] == "Wear" then 
            table.insert(AccessoryList, {
                Name =  v['Name']
            })
        end
    end
    return AccessoryList
end
local function getAwakeend()
    SkillAwakened = 0 
    SkillAWakenedList = {}
    getAwakenedAbilitiesRequests = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if getAwakenedAbilitiesRequests then
    for i, v in pairs(getAwakenedAbilitiesRequests) do
        if v["Awakened"] then 
                SkillAwakened = SkillAwakened + 1;
                table.insert(SkillAWakenedList, i)
            end
        end
    end   
    return SkillAWakenedList;
end
local function getSkillAwakenCount()
    SkillAwakened = 0 
    SkillAWakenedList = {}
    getAwakenedAbilitiesRequests = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getAwakenedAbilities")
    if getAwakenedAbilitiesRequests then
    for i, v in pairs(getAwakenedAbilitiesRequests) do
            SkillAwakened = SkillAwakened + 1;
        end
    end   
    return SkillAwakened;
end
spawn(function() 
    while true do 
        local Melee = getMeleeName()
        local Level = getLevel()
        local World = getWorld()
        local Fruit = getFruitName()
        local SwordL = getSword()
        local FruitL = getFruitList()
        local MaterialL = getMaterialList()
        local AccessorieL = getAccessoryList()
        local Money = game:GetService("Players").LocalPlayer.Data.Beli.Value
        local Fragment = game:GetService("Players").LocalPlayer.Data.Fragments.Value
        local Awakeneds = getAwakeend()
        local cM = countMelee()
        local getFruitMasterx = getFruitMaster()
        local Race = game:GetService("Players").LocalPlayer.Data.Race.Value
        local mm = getMeleeMaster()
        local mn = getMeleeuse()
        local ac = getSkillAwakenCount()
        local Payload = {
                Account = LocalPlayer.Name,
                Melee = Melee,
                Level = Level,
                World = World,
                Fruit = Fruit,
                Inventory = {
                    ["Swords"] =  SwordL,
                    ["Fruit"] = FruitL,
                    ["Material"] = MaterialL,
                    ["Accessory"] = AccessorieL
                },
                countMelee = cM,
                Beli = Money,
                Fragment = Fragment, 
                Awakend = Awakeneds,
                Race = Race,
                FruitMastery = getFruitMasterx,
                MeleeMastery = mm,
                MeleeUse = mn,
                SkillCanAwake = ac,
		Machina = "VNC02"

        }
       	UrlArgs = {
            Url = string.format("http://localhost:8080/inventory/%s", game.Players.LocalPlayer.Name),
            Method = "POST",
            Body = HttpService:JSONEncode(Payload),
            Headers = {
                ["Content-Type"] = "application/json"
            },  
        }
        r = request(UrlArgs)
        wait(5) 
    end 
end)