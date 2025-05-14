import theme

# load your autoconfig, use this, if the rest of your config is empty!
config.load_autoconfig()

c.colors.webpage.darkmode.enabled = True
c.url.start_pages = "https://app.daily.dev"
c.url.default_page = "https://app.daily.dev"

theme.setup(c, "mocha", True)
