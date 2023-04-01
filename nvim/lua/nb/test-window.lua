print('test-window.lua loading 1 of 2')
print('test-window.lua loading 2 of 2')
local ui = vim.api.nvim_list_uis()[1]



------------------------------------------------------------------------------------------------------------------------------------------


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

local print_options = {'Printer', 'Copies', 'Color', 'paper_size', 'orientation', 'scale'}

local width = 40
local height = 20

local config_win_printers = {
      relative = "editor",
      width = width,
      height = height,
      col = (ui.width/2) - width - 2,
      row = (ui.height - height) / 2,
      style = 'minimal',
      focusable =true,
      border = { "#", "═" ,"#", "║", "#", "═", "#", "║" }
    }

local config_win_num_copies = {
      relative = "editor",
      width = 40,
      height = 2,
      col = (ui.width/2),
      row = (ui.height - height) / 2,
      style = 'minimal',
      focusable =true,
      border = { "#", "═" ,"#", "║", "#", "═", "#", "║" }

    }

local config_win_toggle_line_num = {
      relative = "editor",
      width = width,
      height = 2,
      col = (ui.width/2),
      row = config_win_num_copies['height'] + config_win_num_copies['row'] + 1,
      style = 'minimal',
      focusable =true,
      border = { "#", "═" ,"#", "║", "#", "═", "#", "║" }

    }

local config_win_orientation = {
      relative = "editor",
      width = width,
      height = 2,
      col = (ui.width/2),
      row = config_win_toggle_line_num['height'] + config_win_toggle_line_num['row'] + 1,
      style = 'minimal',
      focusable =true,
      border = { "#", "═" ,"#", "║", "#", "═", "#", "║" }

    }


    -- selecting the printer, 
    -- the number of copies, toggling the line numbering and eventually orientation would be enough, maybe tonight o

vim.api.nvim_create_user_command('T', function(cmd)

  local direction = 0
  local position=0
  
  local buf = vim.api.nvim_create_buf(false, true)
    
  -- Is nice to prevent user from editing interface, so
  -- we should enabled it before updating view and disabled after it.
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)

  position = position + direction
  if position < 0 then position = 0 end

  local result = vim.fn.systemlist('git diff-tree --no-commit-id --name-only -r  HEAD~'..position)
  print(result)
  for k,v in pairs(result) do
    result[k] = '  '..result[k]
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
      'What have i done?',
      'HEAD~'..position,
      ''
  })
  vim.api.nvim_buf_set_lines(buf, 3, -1, false, result)

  vim.api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
  vim.api.nvim_buf_add_highlight(buf, -1, 'whidSubHeader', 1, 0, -1)

  vim.api.nvim_buf_set_option(buf, 'modifiable', false)

  vim.api.nvim_open_win(buf, true, config_win_printers)
  
end, {})

vim.api.nvim_create_user_command('TT', function(cmd) 
  local ns  = vim.api.nvim_create_namespace('print-window')

  local parsed_printers = unix_fallback_printing_system()
  local printers_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(printers_buf, 'modifiable', true)
  vim.api.nvim_buf_attach(printers_buf, false, {})
  vim.api.nvim_buf_add_highlight(printers_buf, -1, 'printer_choice', 0, 0, -1)
  vim.api.nvim_buf_set_lines(printers_buf, 0, 0, false, parsed_printers)
  local printers_win = vim.api.nvim_open_win(printers_buf, true, config_win_printers)

  local num_copies_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(num_copies_buf, 0, 0, false, {'Copies: '})
  local num_copies_win = vim.api.nvim_open_win(num_copies_buf, false, config_win_num_copies)
  --vim.api.nvim_buf_set_text(print_buf, 0, 0, 0, 0, {parsed_printers})
 
  local toggle_line_num_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(toggle_line_num_buf, 0, 0, false, {'Toggle line number: '})
  local toggle_line_num = vim.api.nvim_open_win(toggle_line_num_buf, false, config_win_toggle_line_num)
  
  local orinetation_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(orinetation_buf, 0, 0, false, {'Orientation: '})
  local orinetation = vim.api.nvim_open_win(orinetation_buf, false, config_win_orientation)

  --local printers_win = vim.api.nvim_open_win(print_buf, false, config_win_printers)
  --vim.api.nvim_win_set_cursor(win, {1,0})
  --vim.api.nvim_set_current_win(printers_win)
  --local win_id = vim.GeWinid()
  --vim.win_gotoid(win)

end, {})

local api = vim.api

local function show_dropdown_menu()
  local items = {'Item 1', 'Item 2', 'Item 3'}
  local options = table.concat(items, '\n')
  local selected_item = api.nvim_call_function('input', {options})
  api.nvim_command('echo "Selected item: ' .. selected_item .. '"')
end

api.nvim_command('command! DropdownMenu lua require("dropdown_menu").show_dropdown_menu()')
