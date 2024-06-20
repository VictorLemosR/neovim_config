local paths =
{
    user_folder = os.getenv("USERPROFILE"),
}

local computer_name = vim.fn.hostname()
local quest_computer = not (string.find(computer_name, "AZQW") == nil)

if quest_computer then
    paths.codes_folder = paths.user_folder .. '/OneDrive - QUEST INVESTIMENTOS LTDA/Trading/Codes'
    paths.notes_folder = 'C:/Victor/Notes'
    paths.personal_codes_folder = 'C:/Victor/Algorithms'

-- Any specific computer that shares my vim configuration, like my home computer
elseif vim.fn.hostname() == "" then
    paths.codes_folder = 'C:/Victor/Codes'
    paths.notes_folder = 'C:/Victor/Notes'
    paths.personal_codes_folder = 'C:/Victor/Algorithms'
else
    paths.codes_folder = 'C:/Victor/Codes'
    paths.notes_folder = 'C:/Victor/Notes'
    paths.personal_codes_folder = 'C:/Victor/Algorithms'
end
paths.vim_folder = paths.user_folder .. "/appdata/local/nvim"
paths.python_file = paths.user_folder .. "/AppData/Local/Programs/Python/Python312/python.exe"

return paths
