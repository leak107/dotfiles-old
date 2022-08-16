local document_color_status, document_color = pcall(require, 'document_color')

if not document_color_status then
  return
end

document_color.setup {
  mode = "background"
}
