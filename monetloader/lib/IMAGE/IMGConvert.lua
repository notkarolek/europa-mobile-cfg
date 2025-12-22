local imgConvert = {}
local imgui = require("mimgui")

function imgConvert.HexImg(bitHex)
    return imgui.CreateTextureFromFileInMemory(bitHex, #bitHex)
end

function imgConvert.Base85Font(bit85, rangefont)
    local BaseRange = imgui.GetIO().Fonts:GetGlyphRangesDefault()
    return imgui.GetIO().Fonts:AddFontFromMemoryCompressedBase85TTF(bit85, rangefont, _, BaseRange)
end
return imgConvert