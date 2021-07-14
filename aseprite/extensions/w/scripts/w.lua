function init(plugin)
    plugin:newCommand{
        id="toUpdateAll2",
        title="w",
        group="layer_popup_new",
        onclick=UpdateAll2
    }
end
function exit(plugin)
end



function UpdateAll2()
    -- run something
    app.refresh()
end
