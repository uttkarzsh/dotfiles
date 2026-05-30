return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.header = [[
       _   _   _                      _                    _           
 _   _| |_| |_| | ____ _ _ __ _______| |__      _ ____   _(_)_ __ ___  
| | | | __| __| |/ / _` | '__|_  / __| '_ \    | '_ \ \ / / | '_ ` _ \ 
| |_| | |_| |_|   < (_| | |   / /\__ \ | | |  _| | | \ V /| | | | | | |
 \__,_|\__|\__|_|\_\__,_|_|  /___|___/_| |_| (_)_| |_|\_/ |_|_| |_| |_|
      ]]
    end,
  },
}
