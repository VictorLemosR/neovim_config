# Windows installation (10/06/23)

1. install wezterm and place wezterm.lua from here into wezterm folder: https://wezfurlong.org/wezterm/installation.html
(If your pc does not have a gpu, like my pc from work, change in wezterm.lua 
' config.front_end = "Software" ')

2. install git: https://git-scm.com/downloads

3. install SauceCodePro Nerd Font in folder "C:\windows\fonts\": https://www.nerdfonts.com/font-downloads

4. install neovim: https://github.com/neovim/neovim/releases/tag/stable

5. Download ripgrep and add to path: https://github.com/BurntSushi/ripgrep/releases

6. Install C compiller for windows needed for treesitter (tips here https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support): https://www.mingw-w64.org/downloads/, chose "LLVM-MinGW" and add to path the \bin folder inside the .zip

7. In case there is an error with 'module tslib' after using ':MarkdownPreview' (can check the error using :mess after the command)
https://github.com/iamcco/markdown-preview.nvim/issues/148
7.1. install nvm for Windows: https://github.com/coreybutler/nvm-windows

8. Download pt-utf8 and add it to folder: nvim\share\nvim\runtime\spell
https://ftp.nluug.nl/pub/vim/runtime/spell/

