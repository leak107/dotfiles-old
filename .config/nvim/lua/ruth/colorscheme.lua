local colorscheme = 'ayu-mirage'

if string.find(colorscheme, 'ayu') then
    vim.o.fillchars = 'eob: '
elseif string.find(colorscheme, 'gruv') then
    vim.o.background = 'dark'
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
