---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi
local xrdb = require("beautiful.xresources").get_current_theme()
local gfs = require("gears.filesystem")
local bling = require("module.bling")
local themes_path = "/usr/share/awesome/theme"

local theme = {}
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



theme.font          = "JetBrains Mono Nerd Font 8"
theme.font_name = "JetBrains Mono Nerd Font"


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

theme.bg_normal     = theme.xbackground
theme.bg_focus      = theme.mauve
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.white
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.white
theme.fg_focus      = theme.xbackground
theme.fg_urgent     = theme.red
theme.fg_minimize   = theme.white

theme.useless_gap = dpi(5)
theme.border_width = dpi(2)
theme.border_radius = dpi(52)
theme.border_color_normal = theme.black3
theme.border_color_active = theme.mauve
theme.border_color_marked = theme.xcolor1


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = theme.red

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Wibar
theme.wibar_width = dpi(50)
theme.wibar_bg = theme.black2
theme.wibar_widget_bg = theme.black3
theme.wibar_position = "left"


--Bling stuff
-- bling.module.flash_focus.enable()
-- Define the image to load
--
--
--
--
--

theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = "~/Pictures/wallpaper.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme

