local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
    print('Colorizer is not installed')
    return
end

colorizer.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}
