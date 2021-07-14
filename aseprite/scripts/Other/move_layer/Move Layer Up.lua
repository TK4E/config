local layer = app.activeLayer
if layer then
  if app.apiVersion >= 8 then
    layer.stackIndex = layer.stackIndex+1
  else
    -- This is because a bug before v1.2.16.3
    layer.stackIndex = layer.stackIndex+2
  end
end
