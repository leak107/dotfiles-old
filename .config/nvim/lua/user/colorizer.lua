local colorizer_status, colorizer = pcall(require, 'colorizer')

if not colorizer_status then
  return
end

colorizer.setup {
  'css';
  'vue';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
