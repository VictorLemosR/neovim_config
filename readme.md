# Windows installation (10/06/23)

1. install wezterm and place wezterm.lua from here[https://github.com/VictorLemosR/wezterm_lua/tree/main] into wezterm folder: https://wezfurlong.org/wezterm/installation.html
   1.1. Change PATH to your default opening folder
   1.2. If your pc does not have a gpu, like my pc from work, change in wezterm.lua ' config.front_end = "Software" ')
  
2. install SauceCodePro Nerd Font (ctrl+f: Source code pro) in folder "C:\windows\fonts\": https://www.nerdfonts.com/font-downloads

3. install neovim: https://github.com/neovim/neovim/releases/tag/stable.

4. Download ripgrep: https://github.com/BurntSushi/ripgrep/releases

5. Install C compiller for windows needed for treesitter (tips here https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support): https://www.mingw-w64.org/downloads/, chose "LLVM-MinGW"

6. install nvm for Windows: https://github.com/coreybutler/nvm-windows (https://github.com/coreybutler/nvm-windows/wiki#manual-installation)
Then run "nvm install latest" https://cloud.google.com/nodejs/docs/setup#installing_nvm

7. Download pt-utf8 and add it to folder: nvim\share\nvim\runtime\spell
https://ftp.nluug.nl/pub/vim/runtime/spell/

8. Add to your path nvim\bin, ripgrep folder, llvm-mingw\bin, nvm folder: which should be in
%USERPROFILE%\Appdata\Roaming\nvm\version\
	8.1. To install without admin privileges, run inside cmd: 
	setx PATH "%PATH%;C:\NEW\FOLDER\TO\PATH"

9. install git: https://git-scm.com/downloads

10. Install lua: https://github.com/rjpcomputing/luaforwindows/releases (needed for neorg). 
	10.1 https://vhyrro.github.io/posts/neorg-and-luarocks/#changing-the-configuration
	run :Lazy build luarocks.nvim and then :Lazy build neorg, in case there is some problem with luarocks

11. In case your homedrive is not in c:, create a HOME variable. Open cmd and type: setx HOME "C:". Needed for
	copilot-chat

12. For rust, install rust. Then 
	12.1) rustup component add rust-src
	12.2) rustup component add rust-analyzer


# Update
Just repeat steps 4 and 8
