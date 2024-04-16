local paths =
{
    user_folder = os.getenv("USERPROFILE"),
}

local computer_name = vim.fn.hostname()
local quest_computer = not (string.find(computer_name, "AZQW") == nil)

if quest_computer then
    paths.codes_folder = paths.user_folder .. '/OneDrive - QUEST INVESTIMENTOS LTDA/Trading/Python_codes'
    paths.notes_folder = 'C:/Victor/notes/az_quest'
elseif vim.fn.hostname() == "" then
    paths.codes_folder = 'C:/Victor/codes'
    paths.notes_folder = 'C:/Victor/Notes'
else
    paths.codes_folder = 'C:/Victor/codes'
    paths.notes_folder = 'C:/Victor/Notes'
end
paths.vim_folder = paths.user_folder .. "/appdata/local/nvim"
paths.python_file = paths.user_folder .. "/AppData/Local/Programs/Python/Python312/python.exe"

return paths
