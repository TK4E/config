-- When a new file is loaded -> wait 0.5s, then displays the OSC for 5 seconds
local OSC_SECONDS = 2
mp.add_hook("on_preloaded", 100, function()
    mp.add_timeout(0.5, function()
        mp.command("script-message osc-visibility always no-osd")
        mp.add_timeout(OSC_SECONDS, function()
            mp.command("script-message osc-visibility auto no-osd")
        end)
    end)
end)
