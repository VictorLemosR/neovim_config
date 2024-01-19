# Windows installation (10/06/23)

1. install wezterm and place wezterm.lua from here[https://github.com/VictorLemosR/wezterm_lua/tree/main] into wezterm folder: https://wezfurlong.org/wezterm/installation.html
   1.1. Change PATH to your default opening folder
   1.2. If your pc does not have a gpu, like my pc from work, change in wezterm.lua ' config.front_end = "Software" ')
  
3. install git: https://git-scm.com/downloads

4. install SauceCodePro Nerd Font (ctrl+f: Source code pro) in folder "C:\windows\fonts\": https://www.nerdfonts.com/font-downloads

5. install neovim: https://github.com/neovim/neovim/releases/tag/stable

6. Download ripgrep and add to path: https://github.com/BurntSushi/ripgrep/releases

7. Install C compiller for windows needed for treesitter (tips here https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support): https://www.mingw-w64.org/downloads/, chose "LLVM-MinGW" and add to path the \bin folder inside the .zip

8. install nvm for Windows: https://github.com/coreybutler/nvm-windows
Then run "nvm install latest" and add to path the new folder, which should be in
%USERPROFILE%\Appdata\Roaming\nvm\version\
https://cloud.google.com/nodejs/docs/setup#installing_nvm

9. Download pt-utf8 and add it to folder: nvim\share\nvim\runtime\spell
https://ftp.nluug.nl/pub/vim/runtime/spell/

# Update
Just repeat steps 4 and 8
