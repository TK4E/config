mp.register_event("file-loaded", function()
    local hasvid = mp.get_property_osd("video") ~= "no"
    mp.commandv("script-message", "osc-visibility", (hasvid and "auto" or "always"), "no-osd")
    --force-window=yes
    --如果它真的很复杂，则可以将其放入lua脚本中，并按以下方式调用它：
    --ctrl+c script_message my-command
    -- remove the next line if you don't want to affect the osd-bar config
    mp.commandv("set", "options/osd-bar", (hasvid and "yes" or "no"))
end)
