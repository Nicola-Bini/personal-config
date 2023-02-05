print('test-window.lua loading 1 of 2')
print('test-window.lua loading 2 of 2')
local ui = vim.api.nvim_list_uis()[1]




local function unix_fallback_printing_system()

  -- TODO: check if printer_interface_command an accurate argument name?
  local function check_fallback_printing_support(printer_interface_command)

    check = vim.fn.system('command -v lpstat')

    if check ~= '' then
      return true
    else
      return false
    end
  end

  local function parse_raw_printer_list(lpstat_output)
    local printer_names = {}
    for match in string.gmatch(lpstat_output, " [^ /#]+: ") do
      local printer_name = string.sub(match, 2, -3)
      table.insert(printer_names, printer_name)
    end

    return printer_names
  end

  if check_fallback_printing_support then
    local raw_printer_list = vim.fn.system('lpstat -v')
    local parsed_printer_list = parse_raw_printer_list(raw_printer_list)
    print(parsed_printer_list)
    return parsed_printer_list
  else error("The system does not support fallback printing")
  end

end


--for i, printer in pairs(parsed_printers) d
--
--  vim.api.nvim_buf_set_text(print_buf, 0, 0, 0, 0, printer)
--  print(print_buf)
--end


local width = 160
local height = 30


local print_options = {'Printer', 'Copies', 'Color', 'paper_size', 'orientation', 'scale'}

local window_config = {
      relative = "editor",
      width = width,
      height = height,
      col = (ui.width - width) / 2,
      row = (ui.height - height) / 2,
      style = 'minimal',
      focusable =true,
      border = { "#", "═" ,"#", "║", "#", "═", "#", "║" }

    }

vim.api.nvim_create_user_command('TT', function(cmd) 

  local parsed_printers = unix_fallback_printing_system()
  local print_buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_lines(print_buf, 0, 0, false, parsed_printers)
  --vim.api.nvim_buf_set_text(print_buf, 0, 0, 0, 0, {parsed_printers})
  local win = vim.api.nvim_open_win(print_buf, false, window_config)
  --vim.api.nvim_win_set_cursor(win, {1,0})
  vim.api.nvim_set_current_win(win)
  --local win_id = vim.GeWinid()
  --vim.win_gotoid(win)

end, {desc = 'nb test command description', nargs = '?'})
