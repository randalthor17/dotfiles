return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
                     _       _ _   _                __   ______
                    | |     | | | | |              /  | |___  /
 _ __ __ _ _ __   __| | __ _| | |_| |__   ___  _ __`| |    / / 
| '__/ _` | '_ \ / _` |/ _` | | __| '_ \ / _ \| '__|| |   / /  
| | | (_| | | | | (_| | (_| | | |_| | | | (_) | |  _| |_./ /   
|_|  \__,_|_| |_|\__,_|\__,_|_|\__|_| |_|\___/|_|  \___/\_/    
                                                               
                                    Powered by LazyVim
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files hidden=true <CR>"),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }
    return dashboard
  end,
}
