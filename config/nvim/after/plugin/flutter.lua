local ok, flutterTools = pcall(require, "flutter-tools")
if not ok then
    vim.notify("Could not find flutter-tools");
    return
end

flutterTools.setup{}

