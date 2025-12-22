local notification = {}

local imgui = require("mimgui")
local DPI = MONET_DPI_SCALE
local resX, resY = getScreenResolution()
local kkkk = 250 * DPI
local velocidade = 1.35

local faicons = require('fAwesome6')

local icones = {
    error = "circle_xmark",
    info = "circle_question",
    msg = "circle_check",
}
notification.icones = icones

-- CONFIGS >>
local msg = _
local title = _
local icon = _
local tamanhoX = _

function contar_letras(texto)
    local caracteres = 0
    local space = 0
    for i = 1, #texto do
        local byte = string.byte(string.sub(texto, i))
        if byte == 32 then
            space = space + 1
        end
        caracteres = caracteres + 1
    end
    return caracteres - space
end

local ui_meta = {
    __index = function(self, v)
        if v == "switch" then
            local switch = function()
                if self.process and self.process:status() ~= "dead" then
                    return false
                end
                self.timer = os.clock()
                self.state = not self.state

                self.process = lua_thread.create(function()
                    local bringFloatTo = function(from, to, start_time, duration)
                        local timer = os.clock() - start_time
                        if timer >= 0.00 and timer <= duration then
                            local count = timer / (duration / 100)
                            return count * ((to - from) / 100)
                        end
                        return (timer > duration) and to or from
                    end

                    while true do wait(0)
                        local a = bringFloatTo(0.00, 1.00, self.timer, self.duration)
                        self.alpha = self.state and a or 1.00 - a
                        if a == 1.00 then break end
                    end
                end)
                return true
            end
            return switch
        end

        if v == "alpha" then
            return self.state and 1.00 or 0.00
        end
    end
}

local menu = { state = false, duration = 0.70 }
setmetatable(menu, ui_meta)

function notification.init()
    imgui.OnInitialize(function()
        imgui.GetIO().IniFilename = _
        local config = imgui.ImFontConfig()
        config.MergeMode = true
        config.PixelSnapH = true
        iconRanges = imgui.new.ImWchar[3](faicons.min_range, faicons.max_range, 0)
        imgui.GetIO().Fonts:AddFontFromMemoryCompressedBase85TTF(faicons.get_font_data_base85('solid'), 35 * DPI, config, iconRanges)
        imgui.GetIO().IniFilename = _
        imgui.GetStyle():ScaleAllSizes(DPI)
        local config = imgui.ImFontConfig()
        config.PixelSnapH = true
        local fds = imgui.GetIO().Fonts:GetGlyphRangesDefault()
        font1 = imgui.GetIO().Fonts:AddFontFromFileTTF(getWorkingDirectory() .. "/lib/samp/0_3_7-R1/hg/.Roboto-Black.ttf", 18 * DPI, _, fds)
    end)
end

lua_thread.create(function()
    notif = imgui.OnFrame(
        function() return menu.alpha > 0.00 end,
        function(self)
            self.HideCursor = not menu.state
            imgui.PushStyleVarFloat(imgui.StyleVar.Alpha, menu.alpha)
            imgui.SetNextWindowPos(imgui.ImVec2(210 * DPI, 300 * DPI), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
            imgui.SetNextWindowSize(imgui.ImVec2(tamanhoX, 95 * DPI), imgui.Cond.Always)
            imgui.Begin("", _, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoMove + imgui.WindowFlags.NoInputs)
            
            local style = imgui.GetStyle(
            )
            style.Colors[imgui.Col.WindowBg] = imgui.ImVec4(0.105, 0.135, 0.170, 1.0)
            
            style.FramePadding = imgui.ImVec2(4.5, 4.5)
            style.FrameRounding = 10
            style.ChildRounding = 14
            style.WindowBorderSize = 0
            style.ChildBorderSize = 0
            style.PopupBorderSize = 1
            style.FrameBorderSize = 0
            style.TabBorderSize = 1
            style.WindowRounding = 9 * DPI
            
            imgui.SetCursorPosX(65 * DPI)
            imgui.SetCursorPosY(12 * DPI)
            imgui.PushFont(font1)
            imgui.Text(title)
            imgui.PopFont()

            imgui.SetCursorPos(imgui.ImVec2(- 5 * DPI, 86 * DPI)
            )
            kkkk = kkkk + velocidade
            linha(6 * DPI, kkkk, cordocirculook, 3 * DPI)
            linhaporra(
            )
            imgui.SetCursorPos(imgui.ImVec2(10 * DPI, 49 * DPI)
            )
            imgui.PushStyleColor(imgui.Col.Text, cordocirculook)
            imgui.Text(faicons(icon)
            )
            imgui.PopStyleColor(
            )
            imgui.SameLine(
            )
            --// imgui.SetCursorPos(imgui.ImVec2(tamanhoXVIDEOS * DPI, 36 * DPI))
            local HgChupaRola = imgui.GetCursorPosX(
            )
            imgui.SetCursorPosY(38 * DPI)
            imgui.SetCursorPosX(HgChupaRola + 11.5 * DPI)
            imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1.0, 1.0, 1.0, 0.45)
            )
            imgui.Text(msg)
            imgui.PopStyleColor(
            )
            imgui.End()
        end
    )
end)

function linha(tamanho, comprimento, color, espessura)
    local cur = imgui.GetCursorScreenPos()
    local dl = imgui.GetWindowDrawList()
    tamanho = tamanho or 25
    comprimento = comprimento or 100
    color = color or cordocirculook
    espessura = espessura or 3 * DPI
    
    local ponto_inicial = cur + imgui.ImVec2(tamanho, tamanho)
    local ponto_final = ponto_inicial + imgui.ImVec2(comprimento, 0)
    
    dl:PathLineTo(ponto_inicial)
    dl:PathLineTo(ponto_final)
    dl:PathStroke(imgui.ColorConvertFloat4ToU32(color), false, espessura)
end

function notification.exibir(titulo, texto, iconne, tamanho_x)
    lua_thread.create(function()
        kkkk = 250 * DPI
        title = titulo
        msg = texto
        icon = iconne
        tamanhoX = tamanho_x
        HgDaABunda(iconne)
        menu.switch()
        lua_thread.create(function()
            while true do
                wait(0)
                if menu.state then
                    wait(3000)
                    menu.switch()
                end
            end
        end)
    end)
end

function linhaporra()
    if kkkk > 0 then
        kkkk = kkkk - velocidade
        if kkkk < 0 then
            kkkk = 0
        end
    end
    linha(6 * DPI, kkkk, cordocirculook, 3 * DPI)
end

function HgDaABunda(iconne)
    if iconne == icones.error then
        cordocirculook = imgui.ImVec4(1.0, 0.0, 0.0, 1.0)
    elseif iconne == icones.info then
        cordocirculook = imgui.ImVec4(0.0, 0.478, 1.0, 1.0)
    elseif iconne == icones.msg then
        cordocirculook = imgui.ImVec4(0.086, 0.859, 0.086, 1.0)
    end
end

lua_thread.create(function()
    while true do
        wait(0)
        if kkkk > 0 then
            kkkk = kkkk - velocidade
        end
    end
end)

return notification