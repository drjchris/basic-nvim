local function is_vscode()
    return os.getenv("VSCODE_IPC_HIDDEN_ENVIRONMENT") ~= nil
end

if is_vscode() then
    require('general')
    require('vscode')
else
    require('general')
    require('terminal')
end
