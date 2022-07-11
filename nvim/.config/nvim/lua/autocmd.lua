local autocmd = {}
local events = {}

function autocmd:register(event, callback)
  if event == nil then error 'event cannot be nil' end
  if callback == nil then error 'callback cannot be nil' end
  local lookup = events[event]
  if lookup == nil then
    lookup = {}
    events[event] = lookup
    vim.cmd(table.concat {
      'au ',
      event,
      ' * lua require "autocmd":trigger("',
      event,
      '", vim)'
    })
  end
  table.insert(lookup, callback)
end

function autocmd:trigger(event, vim)
  for index, callback in ipairs(events[event]) do
    callback(vim)
  end
end

return autocmd
