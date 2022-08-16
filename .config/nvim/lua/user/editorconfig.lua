local editor_config_status, editor_config = pcall(require, "editorconfig")

if not editor_config_status then
  return
end
