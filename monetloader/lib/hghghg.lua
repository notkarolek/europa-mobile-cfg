local mennnu = {}

local imgui = require "mimgui"
local hg = imgui.new.bool()

imgui.OnFrame(
     function()
         return hg[0]
     end,
     function()
         imgui.Begin("MENU",hg)
         imgui.End()
     end
)

function main()
     sampRegisterChatCommand(
             "basek",
     function()
             hg[0] = not hg[0]
         end
     )
     while true do
         wait(0)
     end
end

return mennnu