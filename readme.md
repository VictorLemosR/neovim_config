# Neovim in windows without admin rights
For the below items, if you don't have admin rights, just download the zip file for each one and extract wherever you want. In case you do have admin rights, you can go with the .exe

1. install [wezterm](https://wezfurlong.org/wezterm/installation.html) and place wezterm.lua from [here](https://github.com/VictorLemosR/wezterm_lua/tree/main) inside wezterm folder: 
	- Inside the "wezterm.lua" file, there are some shortcuts to change and also change PATH to your default opening folder
		- I usually like to put my opening folder where my codes are
	- If your pc does not have a gpu, like my pc from work, change in wezterm.lua 'config.front_end = "Software"'
  
2. Install [SauceCodePro Nerd Font](https://www.nerdfonts.com/font-downloads) (ctrl+f: Source code pro) in folder "C:\windows\fonts\"
	- Make sure you extract the fonts before pasting inside the folder

3. Install [neovim](https://github.com/neovim/neovim/releases/tag/stable)
	- Download "nvim-win64.zip"

4. Download [ripgrep](https://github.com/BurntSushi/ripgrep/releases)
	- ripgrep-{xx.x.x}-x86_64-pc-windows-msvc.zip

5. Install [C compiller for windows](https://www.mingw-w64.org/downloads/), choose "LLVM-MinGW".
	- Needed for treesitter

6. Install [git](https://git-scm.com/downloads)
	- Windows -> 64-bit git for windows setup
		- You can accept all default choices

7. Install [nvm for Windows](https://github.com/coreybutler/nvm-windows) following this [guide][https://github.com/coreybutler/nvm-windows/wiki#manual-installation] then open cmd, change directory to nvm installation folder and run "nvm install latest" 
	- To configure environment variable without admin rights, open cmd and type:\
	setx NVM_HOME "path\to\nvm"\
	setx NVM_SYMLINK "C:\Program Files\nodejs"\
		(NVM_SYMLINK has to be on program files, no matter where you installed, the folder doesn't even need to exist)\
	setx PATH "%NVM_HOME%;%NVM_SYMLINK%"
		- Careful when setting PATH this way, because you might lose old modifications to path. One way to keep old modifications:\
		  setx PATH "%PATH%;%NVM_HOME%;%NVM_SYMLINK%", but will double the core path and might go over 1000 characters
		  limitation
	- Tips: https://cloud.google.com/nodejs/docs/setup#installing_nvm

8. Add to your path nvim\bin, ripgrep folder, llvm-mingw\bin, nvm folder (which should be in %USERPROFILE%\Appdata\Roaming\nvm\{version}\)
	- To install without admin privileges, run inside cmd: setx PATH "C:\NEW\FOLDER\TO\PATH". For example, for me:\
	setx PATH\
	"%NVM_HOME%;%NVM_SYMLINK%;%USERPROFILE%\victor\neovim\bin;%USERPROFILE%\victor\ripgrep;%USERPROFILE%\victor\llvm-mingw-20240619-ucrt-x86_64\bin;%USERPROFILE%\appdata\roaming\nvm\v22.6.0;%USERPROFILE%\victor\lua\5.1;"
		- You need to put all the extra variables for path, hence NVM_HOME and NVM_SYMLINK again. Also included future
		  paths here, which is not a problem if you decide not to install

9. At this point, finally Neovim configuration can be installed:
	- Download this repo and put into %USERPROFILE%\appdata\local\nvim\

# Extras

10. To be able to use the debugger with python:
	- install debugpy (pip install debugpy)
	- change python folder inside

11. To use copilotchat, define a home variable in cmd: setx HOME "%USERPROFILE%"

12. For python, install pynvim and pyright:\
pip install pynvim\
pip install pyright

13. For rust:
	- Installation: https://www.rust-lang.org/tools/install
	- Input on cmd:
		- rustup component add rust-src
		- rustup component add rust-analyzer

14. Manually, type into neovim ":Mason" and install linters and formatters. For current config, you must install
	"black", "isort", "prettier", "stylua". If new ones are added, configure on /lua/plugins/none_ls.lua

15. Adjust your paths used by neovim in "/lua/victor/paths.lua"

16. Adjust hotkeys used for plugins in "lua/victor/hotkeys_plugins.lua"

17. For portuguese people, download pt-utf8 from [vim site](https://ftp.nluug.nl/pub/vim/runtime/spell/) and add it to neovim installation folder: nvim\share\nvim\runtime\spell

18. To be able to run rust tests with <space>rt:
	- cargo install cargo-nextest --locked
	- cargo +stable install cargo-llvm-cov --locked

# Update
1. To update neovim configuration to my latest, just repeat step 8
2. To update neovim application, just download latest version and substitute old folder with new
