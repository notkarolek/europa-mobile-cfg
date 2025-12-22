script_name('MultiCheat')
script_version('2.0')
script_version_number(1)
script_author('The MonetLoader Team & Ryan_GosIlng')
script_description('Idk why I made this')
local imgui = require 'mimgui'
local memory = require 'memory' 

local encoding = require 'encoding'     
encoding.default = 'CP1251'  
local u8 = encoding.UTF8    

require 'widgets'  

local SCREEN_W, SCREEN_H = getScreenResolution() 
local new = imgui.new   
local window_state = new.bool()   
local window_scale = new.float(1.0)

 local lfs = require("lfs")
if not lfs.attributes("Music") then
    lfs.mkdir("Music")
end
 
function imgui.Theme()
  imgui.SwitchContext()
  style = imgui.GetStyle()

  --==[ STYLE ]==--
  style.WindowPadding = imgui.ImVec2(5, 5)
  style.FramePadding = imgui.ImVec2(10, 10)
  style.ItemSpacing = imgui.ImVec2(10, 10)
  style.ItemInnerSpacing = imgui.ImVec2(5, 5)
  style.TouchExtraPadding = imgui.ImVec2(5 * MONET_DPI_SCALE, 5 * MONET_DPI_SCALE)
  style.IndentSpacing = 0
  style.ScrollbarSize = 20 * MONET_DPI_SCALE
  style.GrabMinSize = 20 * MONET_DPI_SCALE

  --==[ BORDER ]==--
  style.WindowBorderSize = 1
  style.ChildBorderSize = 1
  style.PopupBorderSize = 1
  style.FrameBorderSize = 1
  style.TabBorderSize = 1

  --==[ ROUNDING ]==--
  style.WindowRounding = 5
  style.ChildRounding = 5
  style.FrameRounding = 5
  style.PopupRounding = 5
  style.ScrollbarRounding = 5
  style.GrabRounding = 5
  style.TabRounding = 5

  --==[ ALIGN ]==--
  style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
  style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)
  style.SelectableTextAlign = imgui.ImVec2(0.5, 0.5)
  
  --==[ COLORS ]==--
  style.Colors[imgui.Col.Text]                   = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
  style.Colors[imgui.Col.TextDisabled]           = imgui.ImVec4(0.50, 0.50, 0.50, 1.00)
  style.Colors[imgui.Col.WindowBg]               = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
  style.Colors[imgui.Col.ChildBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
  style.Colors[imgui.Col.PopupBg]                = imgui.ImVec4(0.07, 0.07, 0.07, 1.00)
  style.Colors[imgui.Col.Border]                 = imgui.ImVec4(0.25, 0.25, 0.26, 0.54)
  style.Colors[imgui.Col.BorderShadow]           = imgui.ImVec4(0.00, 0.00, 0.00, 0.00)
  style.Colors[imgui.Col.FrameBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.FrameBgHovered]         = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
  style.Colors[imgui.Col.FrameBgActive]          = imgui.ImVec4(0.25, 0.25, 0.26, 1.00)
  style.Colors[imgui.Col.TitleBg]                = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.TitleBgActive]          = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.TitleBgCollapsed]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.MenuBarBg]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.ScrollbarBg]            = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.ScrollbarGrab]          = imgui.ImVec4(0.00, 0.00, 0.00, 1.00)
  style.Colors[imgui.Col.ScrollbarGrabHovered]   = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
  style.Colors[imgui.Col.ScrollbarGrabActive]    = imgui.ImVec4(0.51, 0.51, 0.51, 1.00)
  style.Colors[imgui.Col.CheckMark]              = imgui.ImVec4(1.00, 1.00, 1.00, 1.00)
  style.Colors[imgui.Col.SliderGrab]             = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
  style.Colors[imgui.Col.SliderGrabActive]       = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
  style.Colors[imgui.Col.Button]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.ButtonHovered]          = imgui.ImVec4(0.21, 0.20, 0.20, 1.00)
  style.Colors[imgui.Col.ButtonActive]           = imgui.ImVec4(0.41, 0.41, 0.41, 1.00)
  style.Colors[imgui.Col.Header]                 = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.HeaderHovered]          = imgui.ImVec4(0.20, 0.20, 0.20, 1.00)
  style.Colors[imgui.Col.HeaderActive]           = imgui.ImVec4(0.47, 0.47, 0.47, 1.00)
  style.Colors[imgui.Col.Separator]              = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.SeparatorHovered]       = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.SeparatorActive]        = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.ResizeGrip]             = imgui.ImVec4(1.00, 1.00, 1.00, 0.25)
  style.Colors[imgui.Col.ResizeGripHovered]      = imgui.ImVec4(1.00, 1.00, 1.00, 0.67)
  style.Colors[imgui.Col.ResizeGripActive]       = imgui.ImVec4(1.00, 1.00, 1.00, 0.95)
  style.Colors[imgui.Col.Tab]                    = imgui.ImVec4(0.12, 0.12, 0.12, 1.00)
  style.Colors[imgui.Col.TabHovered]             = imgui.ImVec4(0.28, 0.28, 0.28, 1.00)
  style.Colors[imgui.Col.TabActive]              = imgui.ImVec4(0.30, 0.30, 0.30, 1.00)
  style.Colors[imgui.Col.TabUnfocused]           = imgui.ImVec4(0.07, 0.10, 0.15, 0.97)
  style.Colors[imgui.Col.TabUnfocusedActive]     = imgui.ImVec4(0.14, 0.26, 0.42, 1.00)
  style.Colors[imgui.Col.PlotLines]              = imgui.ImVec4(0.61, 0.61, 0.61, 1.00)
  style.Colors[imgui.Col.PlotLinesHovered]       = imgui.ImVec4(1.00, 0.43, 0.35, 1.00)
  style.Colors[imgui.Col.PlotHistogram]          = imgui.ImVec4(0.90, 0.70, 0.00, 1.00)
  style.Colors[imgui.Col.PlotHistogramHovered]   = imgui.ImVec4(1.00, 0.60, 0.00, 1.00)
  style.Colors[imgui.Col.TextSelectedBg]         = imgui.ImVec4(1.00, 0.00, 0.00, 0.35)
  style.Colors[imgui.Col.DragDropTarget]         = imgui.ImVec4(1.00, 1.00, 0.00, 0.90)
  style.Colors[imgui.Col.NavHighlight]           = imgui.ImVec4(0.26, 0.59, 0.98, 1.00)
  style.Colors[imgui.Col.NavWindowingHighlight]  = imgui.ImVec4(1.00, 1.00, 1.00, 0.70)
  style.Colors[imgui.Col.NavWindowingDimBg]      = imgui.ImVec4(0.80, 0.80, 0.80, 0.20)
  style.Colors[imgui.Col.ModalWindowDimBg]       = imgui.ImVec4(0.00, 0.00, 0.00, 0.70)
end

imgui.OnInitialize(function()
  imgui.Theme()
end)

-- Weather & Time by MonetLoader
local WeatherAndTime = {
  weather = new.int(0),
  time = new.int(0),
  locked_time = 0,
  new_time = false,
  thread = nil
}

--MP3 CORE

-- MP3 Player Variables
local mp3Files = {}
local radio = nil
local mp3_status = nil  -- nil, "Enabled", "Paused", "Finished"
local currentFile = nil

-- Load MP3 files from Music directory
for file in lfs.dir("Music") do
    if file:match("%.mp3$") then
        table.insert(mp3Files, file)
    end
end
table.sort(mp3Files)




-- === Sensitivity + Aspect system (OSPx-style integrated) ===
local memory = require 'memory'
local ffi = require 'ffi'
local hook = require 'monethook'
local shared = require 'SAMemory.shared'
shared.require 'RenderWare'

-- === Config helper ===
local cf = (function()
    local sep = '/'
    if MONET_VERSION == nil then sep = '\\' end
    local function deepcopy(t)
        if type(t) ~= 'table' then return t end
        local r = {}
        for k,v in pairs(t) do r[k] = deepcopy(v) end
        return r
    end
    local function merge(a,b)
        for k,v in pairs(b) do
            if type(v)=='table' and type(a[k])=='table' then merge(a[k],v)
            else a[k]=v end
        end
    end
    local function load_cfg(defaults, name)
        local path = getWorkingDirectory()..sep.."config"..sep..name
        local f = io.open(path,"r")
        if not f then return deepcopy(defaults) end
        local data = f:read("*a"); f:close()
        local ok, decoded = pcall(decodeJson, data)
        if ok and decoded then merge(defaults, decoded) end
        return defaults
    end
    local function save_cfg(tbl, name)
        local path = getWorkingDirectory()..sep.."config"..sep..name
        createDirectory(getWorkingDirectory()..sep.."config"..sep)
        local f = io.open(path,"w"); if not f then return end
        local ok, enc = pcall(encodeJson, tbl)
        if ok then f:write(enc) end
        f:close()
    end
    return { load = load_cfg, save = save_cfg }
end)()

-- === Sensitivity + Aspect core ===
local sens_addr = MONET_GTASA_BASE + 0x6A9F30
local function setSensitivity(v)
    memory.setfloat(sens_addr, 0.001 + v / 3000.0)
end

ffi.cdef[[
    typedef struct RwRect RwRect;
    typedef struct RwCamera RwCamera;
    void _Z10CameraSizeP8RwCameraP6RwRectff(RwCamera *camera, RwRect *rect, float unk, float aspect);
]]
local gta = ffi.load('GTASA')

local aspectHook
local function aspectHook_fn(camera, rect, unk, aspect)
    if cfg.aspectratio == nil or cfg.aspectratio == 0 then
        return aspectHook(camera, rect, unk, aspect)
    end
    return aspectHook(camera, rect, unk, cfg.aspectratio)
end
aspectHook = hook.new(
    'void(*)(RwCamera *camera, RwRect *rect, float unk, float aspect)',
    aspectHook_fn,
    ffi.cast('uintptr_t', ffi.cast('void*', gta._Z10CameraSizeP8RwCameraP6RwRectff))
)

-- === Config & variables ===
local cfg_defaults = { sensitivity = 100.0, aspectratio = 2.0 }
cfg = cf.load(cfg_defaults, "MultiCheatSet.json")

-- apply loaded
local sensitivity = imgui.new.float(cfg.sensitivity)
local aspect_ratio = imgui.new.float(cfg.aspectratio)
setSensitivity(sensitivity[0])

local function saveSettings()
    cfg.sensitivity = sensitivity[0]
    cfg.aspectratio = aspect_ratio[0]
    cf.save(cfg, "MultiCheatSet.json")
end

-- auto-save on exit
function onScriptTerminate(script, quitGame)
    if script == thisScript() then
        saveSettings() -- from your sensitivity settings
        
        if radio then
            setAudioStreamState(radio, 0)
            releaseAudioStream(radio)
        end
    end
end
-- === End core ===


-- Calculator state
local currentInput = "0"
local shouldResetInput = false

-- === Calculator logic functions ===
local function addToInput(value)
    if shouldResetInput then
        currentInput = ""
        shouldResetInput = false
    end
    if currentInput == "0" and value ~= "," then
        currentInput = ""
    end
    currentInput = currentInput .. value
end

local function clearInput()
    currentInput = "0"
    shouldResetInput = false
end

local function backspace()
    if #currentInput > 0 then
        currentInput = currentInput:sub(1, -2)
        if #currentInput == 0 then
            currentInput = "0"
        end
    end
end

local function calculate()
    local expression = currentInput:gsub(",", ".")
    local chunk = loadstring("return " .. expression)
    if chunk then
        local success, result = pcall(chunk)
        if success then
            currentInput = tostring(result):gsub("%.", ",")
            shouldResetInput = true
        else
            currentInput = "ERROR"
        end
    else
        currentInput = "ERROR"
    end
end

-- engine function
function EnableEngine()
    if isCharInAnyCar(PLAYER_PED) then
        local car = storeCarCharIsInNoSave(PLAYER_PED)
        switchCarEngine(car, true)
    end
end



-- load the paths table
local pathfact = getWorkingDirectory() .. "/resource/paths/factions.lua"
local preset_locationsfaction = dofile(pathfact)
local pathcity = getWorkingDirectory() .. "/resource/paths/city.lua"
local preset_locationscity = dofile(pathcity)
local pathcustom = getWorkingDirectory() .. "/resource/paths/custom.lua"
local preset_locationscustom = dofile(pathcustom)
-- Menu
imgui.OnFrame(function() return window_state[0] end,
  function(player)
    imgui.SetNextWindowSize(imgui.ImVec2(imgui.GetFontSize() * 70, imgui.GetFontSize() * 50), imgui.Cond.FirstUseEver)
    imgui.Begin(u8'', window_state)
    
    imgui.SetWindowFontScale(window_scale[0])
    imgui.SliderFloat(u8'Window Scale', window_scale, 1 / MONET_DPI_SCALE, 3.0)
    if imgui.BeginTabBar('Tabs') then

if imgui.BeginTabItem(u8'Settings') then
        if imgui.Button(u8'Set') then
          forceWeatherNow(WeatherAndTime.weather[0])
        end
        imgui.SameLine()
        imgui.SetNextItemWidth(imgui.GetFontSize() * 7)
        if imgui.InputInt(u8'Set Weather', WeatherAndTime.weather, 1, 10) then
          if WeatherAndTime.weather[0] < 0 then
            WeatherAndTime.weather[0] = 0
          end
          if WeatherAndTime.weather[0] > 45 then
            WeatherAndTime.weather[0] = 45
          end
        end
    imgui.Text(u8"Sensitivity")
    imgui.SetNextItemWidth(imgui.GetFontSize() * 15)
    if imgui.SliderFloat(u8"##sens", sensitivity, 0.1, 200.0) then
        setSensitivity(sensitivity[0])
        saveSettings()
    end

    imgui.Text(u8"Aspect Ratio")
    imgui.SetNextItemWidth(imgui.GetFontSize() * 10)
    if imgui.SliderFloat(u8"##aspect", aspect_ratio, 0.5, 3.0, string.format("%.2f", aspect_ratio[0])) then
        cfg.aspectratio = aspect_ratio[0]
        saveSettings()
    end
    imgui.EndTabItem() -- ✅ this was missing
end

if imgui.BeginTabItem(u8'Music Player') then  

    -- Controls on top
    imgui.BeginChild("##MusicControls", imgui.ImVec2(-1, 100), true)  -- fixed height for controls
    
    if imgui.Button('Play') then  
        if currentFile and not radio then  
            mp3_status = "Playing"  
            radio = loadAudioStream('Music/'..currentFile)  
            setAudioStreamState(radio, 1)  
            setAudioStreamVolume(radio, 1)  
        elseif mp3_status == "Playing" and radio then  
            return  
        end  
    end  
    
    imgui.SameLine()  
    
    if imgui.Button('Pause') then  
        if mp3_status == "Playing" and radio then  
            mp3_status = "Paused"  
            setAudioStreamState(radio, 2)  
        end  
    end  
    
    imgui.SameLine()  
    
    if imgui.Button('Resume') then  
        if mp3_status == "Paused" and radio then  
            mp3_status = "Playing"  
            setAudioStreamState(radio, 3)  
        end  
    end  
    
    imgui.SameLine()  
    
    if imgui.Button('Stop') then  
        if radio then  
            mp3_status = nil  
            setAudioStreamState(radio, 0)  
            releaseAudioStream(radio)  
            radio = nil  
        end  
    end  
    
    imgui.Text("Current: " .. (currentFile or "None"))    
    
    imgui.EndChild()  

    -- Music list below
    imgui.BeginChild("##MusicList", imgui.ImVec2(-1, -1), true)  
    for i, Music in ipairs(mp3Files) do  
        if imgui.Button(Music) then  
            currentFile = Music  
            if radio then  
                if getAudioStreamState(radio) == -1 then  
                    setAudioStreamState(radio, 0)  
                    releaseAudioStream(radio)  
                    radio = nil  
                end  
            end	  
        end  
    end  
    imgui.EndChild()  

    imgui.EndTabItem()
end

-- Calculator state
local calc_input1 = imgui.new.float(0)
local calc_input2 = imgui.new.float(0)
local calc_result = imgui.new.float(0)
local calc_operation = imgui.new.int(1) -- 1=Add, 2=Subtract, 3=Multiply, 4=Divide



-- === IMGUi Tab ===
if imgui.BeginTabItem(u8"Calculator") then

    -- Display current input/result
    imgui.Text(u8(currentInput))
    imgui.Separator()

    local buttonSize = imgui.ImVec2(60, 60)
    local function Btn(label, func)
        if imgui.Button(u8(label), buttonSize) then
            func()
        end
    end

    -- Row 1
    Btn("C", clearInput); imgui.SameLine()
    Btn("del", backspace); imgui.SameLine()
    Btn("/", function() addToInput("/") end); imgui.SameLine()
    Btn("*", function() addToInput("*") end)

    -- Row 2
    Btn("7", function() addToInput("7") end); imgui.SameLine()
    Btn("8", function() addToInput("8") end); imgui.SameLine()
    Btn("9", function() addToInput("9") end); imgui.SameLine()
    Btn("-", function() addToInput("-") end)

    -- Row 3
    Btn("4", function() addToInput("4") end); imgui.SameLine()
    Btn("5", function() addToInput("5") end); imgui.SameLine()
    Btn("6", function() addToInput("6") end); imgui.SameLine()
    Btn("+", function() addToInput("+") end)

    -- Row 4
    Btn("1", function() addToInput("1") end); imgui.SameLine()
    Btn("2", function() addToInput("2") end); imgui.SameLine()
    Btn("3", function() addToInput("3") end); imgui.SameLine()
    Btn("=", calculate)

    -- Row 5
    Btn("0", function() addToInput("0") end); imgui.SameLine()
    Btn(",", function() addToInput(",") end)

    imgui.EndTabItem()
end
    imgui.EndTabBar() -- ✅ add this line before closing window
    end -- closes BeginTabBar
    imgui.End() -- closes Begin(window)
  end
)
function main()
    wait(2000)
    setSensitivity(cfg.sensitivity or 100.0)

    while true do
        -- First: Handle radar swipe detection
        if isWidgetSwipedRight(WIDGET_RADAR) then
            window_state[0] = not window_state[0]
        end
        
        -- Second: Display health and armor
        while not isPlayerPlaying(PLAYER_HANDLE) do 
            wait(0) 
        end
        
        useRenderCommands(true) -- use lua render
        setTextCentre(true) -- set text centered
        setTextScale(1.2, 1.5) -- x y size
        setTextColour(255--[[r]], 255--[[g]], 255--[[b]], 255--[[a]])
        setTextEdge(1--[[outline size]], 0--[[r]], 0--[[g]], 0--[[b]], 255--[[a]])
        displayTextWithNumber(663.0, 62.5, 'NUMBER', getCharHealth(PLAYER_PED))
        
        if getCharArmour(PLAYER_PED) > 0 then
            setTextCentre(true) -- set text centered
            setTextScale(1.2, 1.5) -- x y size
            setTextColour(255--[[r]], 255--[[g]], 255--[[b]], 255--[[a]])
            setTextEdge(1--[[outline size]], 0--[[r]], 0--[[g]], 0--[[b]], 255--[[a]])
            displayTextWithNumber(650.0, 78, 'NUMBER', getCharArmour(PLAYER_PED))
        end
        
        wait(0)
    end
end