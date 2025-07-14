local paths = {
    user_folder = os.getenv("USERPROFILE"),
    onedrive_folder = os.getenv("OneDrive"),
}

local computer_name = vim.fn.hostname()
local quest_computer = not (string.find(computer_name, "AZQW") == nil)

if quest_computer then
    paths.codes_folder = paths.onedrive_folder .. "/Trading/Codes"
    paths.notes_folder = paths.user_folder .. "/victor/notes"
    paths.personal_codes_folder = paths.user_folder .. "/victor/personal_codes"
elseif vim.fn.hostname() == "VICTOR-DESKTOP" then
    paths.codes_folder = paths.user_folder .. "/victor/codes"
    paths.notes_folder = paths.user_folder .. "/victor/notes"
    paths.personal_codes_folder = paths.user_folder .. "/victor/personal_codes"
    -- Any specific computer that shares my vim configuration, like my home computer
elseif vim.fn.hostname() == "" then
    paths.codes_folder = paths.onedrive_folder .. "/Trading/Codes"
    paths.notes_folder = paths.user_folder .. "/victor/notes"
    paths.personal_codes_folder = paths.user_folder .. "/victor/personal_codes"
end
paths.vim_folder = paths.user_folder .. "/appdata/local/nvim"
paths.python_file = paths.user_folder .. "/AppData/Local/Programs/Python/Python312/python.exe"

return paths
