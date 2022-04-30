---------------------------
-- Default awesome theme --
---------------------------

local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = require("beautiful.xresources").get_current_theme()
local gfs = require("gears.filesystem")
local bling = require("module.bling")
--Theme stuff
local themes_path = gfs.get_themes_dir()
local theme = dofile(themes_path .. "default/theme.lua")
local theme_assets = require("beautiful.theme_assets")

local bling_theme_path = "~/.config/awesome/module/bling/icons/layouts/"

local theme = {}

theme.wallpaper = "~/Pictures/wallpaper.png"
--Colors
theme.black0 = "#161320"
theme.black1 = "#1A1826"
theme.black2 = "#1E1E2E"
theme.black3 = "#302D41"

theme.grey = "#6E6C7E"
theme.white = "#D9E0EE"

theme.flamingo = "#F2CDCD"
theme.mauve = "#DDB6F2"
theme.pink = "#F5C2E7"
theme.maroon = "#E8A2AF"
theme.red = "#F28FAD"
theme.peach = "#F8BD96"
theme.green = "#ABE9B3"
theme.teal = "#B5E8E0"
theme.blue = "#96CDFB"
theme.sky = "#96CDFB"
theme.transparent = "#00000000"

theme.font_name = "JetBrains Mono Nerd Font "
theme.font = theme.font_name .. "8"
theme.icon_font_name = "Material Design Icons Desktop "
theme.icon_font = theme.icon_font_name .. "18"
theme.font_taglist = theme.icon_font_name .. "14"

theme.xbackground = xrdb.background --Black
theme.xforeground = xrdb.foreground --White
theme.xcolor0 = xrdb.color0 --Dark Grey
theme.xcolor1 = xrdb.color1 --Red
theme.xcolor2 = xrdb.color2 --Green
theme.xcolor3 = xrdb.color3 --Yellow
theme.xcolor4 = xrdb.color4 --Blue
theme.xcolor5 = xrdb.color5 --Mauve
theme.xcolor6 = xrdb.color6 --Pink
theme.xcolor7 = xrdb.color7 --Dark white
theme.xcolor8 = xrdb.color8 --Light grey
theme.xcolor9 = xrdb.color9 --Red
theme.xcolor10 = xrdb.color10 --Green
theme.xcolor11 = xrdb.color11 --Yellow
theme.xcolor12 = xrdb.color12 --Blue
theme.xcolor13 = xrdb.color13 --Mauve
theme.xcolor14 = xrdb.color14 --Pink
theme.xcolor15 = xrdb.color15 --White

theme.bg_normal = theme.xbackground
theme.bg_focus = theme.mauve
theme.bg_urgent = theme.red
theme.bg_minimize = theme.white
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.white
theme.fg_focus = theme.xbackground
theme.fg_urgent = theme.red
theme.fg_minimize = theme.white

theme.useless_gap = dpi(5)
theme.border_width = dpi(2)
theme.border_radius = dpi(5)
theme.border_color_normal = theme.black3
theme.border_color_active = theme.mauve
theme.border_color_marked = theme.red

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- Wibar
theme.wibar_width = dpi(50)
theme.wibar_bg = theme.black2
theme.wibar_widget_bg = theme.black3
theme.wibar_position = "left"

--Bling stuff
-- bling.module.flash_focus.enable()
-- Tabs
-- theme.mstab_bar_height = dpi(60)
-- theme.mstab_bar_padding = dpi(0)
-- theme.mstab_border_radius = dpi(6)
-- theme.tabbar_disable = true
-- theme.tabbar_style = "modern"
-- theme.tabbar_bg_focus = theme.xbackground
-- theme.tabbar_bg_normal = theme.xcolor0
-- theme.tabbar_fg_focus = theme.xcolor0
-- theme.tabbar_fg_normal = theme.xcolor15
-- theme.tabbar_position = "bottom"
-- theme.tabbar_AA_radius = 0
-- theme.tabbar_size = 40
-- theme.mstab_bar_ontop = true


-- You can use your own layout icons like this:
theme.layout_centered = bling_theme_path .. "centered.png"
-- theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
-- theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
-- theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
-- theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
-- theme.layout_max = themes_path.."default/layouts/maxw.png"
-- theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
-- theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
-- theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "default/layouts/tilew.png"
-- theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "default/layouts/spiralw.png"
-- theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
-- theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
-- theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
-- theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
-- theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal("request::rules", function()
  rnotification.append_rule({
    rule = { urgency = "critical" },
    properties = { bg = theme.red, fg = theme.white },
  })
end)

return theme
