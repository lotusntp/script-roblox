if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

-- ปรับ true = เปิด
-- ปรับ false = ปิด

getgenv().Faster = { -- เพิ่มความเร็ว
    ['CDK Super Fast'] = false, -- ซื้อสีฮาคิ + เปิดสี + เสกแอดมินด้วยถ้วย (คนที่รันโปร สวิตฮับจะมาช่วยเหยียบสีให้)
    ['Buy Color Haki'] = 3 -- ซื้อสีฮาคิระดับLegendaryที่ใช้เปิดสี 3 สี (แนะนำปรับ 3เพราะใช้เงินม่วงเยอะก็จริงแต่โอกาสได้ดาบคู่เยอะมากกว่า)
}

getgenv().RAM = {
    ['Enabled'] = false, -- เปิดใช้งาน Description Roblox Account Manager
    ['Delay'] = 600 -- 10นาที
}

getgenv().Setting = { -- ตั้งค่าทั้วไป
    ['FPS Booster'] = false,
    ['White Screen'] = true,
    ['Disible Gui'] = false, -- ปิด Gui
    ['AFK Check'] = 150, -- ยืนนิ่งครบ 150วิจะทำการเตะ
    ['Lock Fruit'] = 1000000, -- ไม่ใช้ผลราคามากกว่า 1000000ขึ้นไปซื้อชิปลงดัน
    ['Rejoin'] = false -- Rejoin เมื่อโดนเตะ
}

getgenv().Quest = {
    ['RGB Haki'] = true, -- ทำฮาคิสี RGB
    ['Evo Race'] = {
        ['Enabled'] = true, -- ทำเผ่า
        ['Level'] = {1,2,3}, -- ตั้งค่าทำเผ่าขั้น1ถึงขั้น3
        ['Lock'] = { 
            'Fishman','Human','Skypiea'
        }
    },
    ['Quest Dough Awaken'] = {
        ['Enabled'] = false, -- ทำโมจิตื่น
        ['Fast Mode'] = false -- ใช้ผลปีศาจ 1M ในการทำเควสโมจิตื่น
    },
    ['Kill Boss'] = false, -- ฟาร์มบอส
    ['Quest Race V4'] = true -- ทำเควสดึงคันโยก + หาเกียร์
}

getgenv().Fruit = { -- เลือกผลปีศาจ
    ['Main'] = {'Dough-Dough'}, -- ผลหลักถ้าเจอผลนี้ต่อไห้มีผลในตัวก็จะทำการกินผลนี้
    ['Select Fruit'] = {'Dark-Dark','Human-Human: Buddha','Sand-Sand','Magma-Magma'}, -- เลือกผลปีศาจ
    ['Bring Fruit'] = false -- ดึงผลปีศาจ
}

getgenv().Melee = { -- ฟาร์มหมัด
    ['Superhuman'] = false,
    ['Death Step'] = false,
    ['Sharkman Karate'] = false,
    ['Electric Claw'] = false,
    ['Dragon Talon'] = false,
    ['Godhuman'] = false
}

getgenv().Sword = { -- ฟาร์มดาบ
    ['Saber'] = false,
    ['Midnight Blade'] = false,
    ['Shisui'] = false,
    ['Saddi'] = false,
    ['Wando'] = false,
    ['Yama'] = false,
    ['Koko'] = false,
    ['Rengoku'] = false,
    ['Canvander'] = false,
    ['Buddy Sword'] = false,
    ['Twin Hooks'] = false,
    ['SpikeyTrident'] = false,
    ['Hallow Scryte'] = false,
    ['Dark Dagger'] = false,
    ['Tushita'] = false,
    ['True Triple Katana'] = false,
    ['Cursed Dual Katana'] = false -- ทำดาบคู่
}

getgenv().Gun = { -- ฟาร์มปืน
    ['Kabucha'] = false,
    ['Acidum Rifle'] = false,
    ['Soul Guitar'] = false, -- ทำกีต้าร์บรู๊ค
    ['Serpent Bow'] = false
}

getgenv().Mastery = { -- ฟาร์มมาสเตอรี่
    ['Melee'] = false,
    ['Fruit'] = false,

    ['Sword'] = false,
    ['Setting Sword'] = { -- ตั้งค่าดาบที่ต้องการให้ฟาร์มมาสเตอรี่
        [1] = "Tushita",
        [2] = "Hallow Scythe",
        -- [3] = "Spikey Trident",
        -- [4] = "Dark Dagger",
        -- [5] = "Buddy Sword",
        [3] = "Yama",
        -- [7] = "Shisui",
        -- [8] = "Saddi",
        -- [9] = "Wando",
        [4] = "True Triple Katana",
        [5] = "Cursed Dual Katana",
        -- [12] = "Midnight Blade",
        -- [13] = "Rengoku",
        -- [14] = "Saber",
        -- [15] = "Canvander"
    },

    ['Gun'] = false,
    ['Setting Gun'] = { -- ตั้งค่าปืนที่ต้องการให้ฟาร์มมาสเตอรี่
        [1] = 'Soul Guitar',
        [2] = 'Kabucha',
        [3] = 'Acidum Rifle',
        [4] = 'Serpent Bow'
    }
}

_G.On_Next_Generation = true -- เปิดใช้งาน Script Next Generation
script_key="sryfyCupwaqmcXRROjEGotauxVwzGqLL";
loadstring(game:HttpGet("https://raw.githubusercontent.com/londnee/code/main/nextgeneration.lua"))()