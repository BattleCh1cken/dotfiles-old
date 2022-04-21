-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Widget library
local wibox = require("wibox")

local helpers = require("helpers")
--Helping
local wrap_widget = function(widget)
  return {
    widget,
    margins = dpi(6),
    widget = wibox.container.margin,
  }
end

awful.screen.connect_for_each_screen(function(s)
  -- Launcher
  -------------

  local awesome_icon = wibox.widget({
    {
      widget = wibox.widget.imagebox,
      image = beautiful.awesome_logo,
      resize = true,
    },
    margins = dpi(4),
    widget = wibox.container.margin,
  })

  mymainmenu = awful.menu({
    items = {
      { "awesome", myawesomemenu, beautiful.awesome_icon },
      { "open terminal", terminal },
    },
  })

  mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

  -- Battery
  -------------

  local charge_icon = wibox.widget({
    bg = beautiful.xcolor8,
    widget = wibox.container.background,
    visible = false,
  })

  local batt = wibox.widget({
    charge_icon,
    max_value = 100,
    value = 50,
    thickness = dpi(4),
    padding = dpi(2),
    start_angle = math.pi * 3 / 2,
    color = { beautiful.xcolor2 },
    bg = beautiful.black2,
    widget = wibox.container.arcchart,
  })

  local batt_last_value = 100
  local batt_low_value = 40
  local batt_critical_value = 20
  awesome.connect_signal("signal::battery", function(value)
    batt.value = value
    batt_last_value = value
    local color

    if charge_icon.visible then
      color = beautiful.xcolor6
    elseif value <= batt_critical_value then
      color = beautiful.xcolor1
    elseif value <= batt_low_value then
      color = beautiful.xcolor3
    else
      color = beautiful.xcolor2
    end

    batt.colors = { color }
    batt.bg = color .. "44"
  end)

  awesome.connect_signal("signal::charger", function(state)
    local color
    if state then
      charge_icon.visible = true
      color = beautiful.xcolor6
    elseif batt_last_value <= batt_critical_value then
      charge_icon.visible = false
      color = beautiful.xcolor1
    elseif batt_last_value <= batt_low_value then
      charge_icon.visible = false
      color = beautiful.xcolor3
    else
      charge_icon.visible = false
      color = beautiful.xcolor2
    end

    batt.colors = { color }
    batt.bg = color .. "44"
  end)

  -- Time
  ----------

  local hour = wibox.widget({
    font = beautiful.font_name .. "bold 14",
    format = "%H",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock,
  })

  local min = wibox.widget({
    font = beautiful.font_name .. "bold 14",
    format = "%M",
    align = "center",
    valign = "center",
    widget = wibox.widget.textclock,
  })

  local clock = wibox.widget({
    {
      {
        hour,
        min,
        spacing = dpi(5),
        layout = wibox.layout.fixed.vertical,
      },
      top = dpi(5),
      bottom = dpi(5),
      widget = wibox.container.margin,
    },
    bg = beautiful.wibar_widget_bg,
    shape = helpers.rrect(beautiful.widget_radius),
    widget = wibox.container.background,
  })
  -- Stats
  -----------

  local stats = wibox.widget({
    {
      wrap_widget(batt),
      clock,
      spacing = dpi(5),
      layout = wibox.layout.fixed.vertical,
    },
    bg = beautiful.wibar_widget_bg,
    shape = helpers.rrect(beautiful.widget_radius),
    widget = wibox.container.background,
  })

  local mylayoutbox = awful.widget.layoutbox({
    screen = s,
    -- Add buttons, allowing you to change the layout
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(-1)
      end),
    },
  })

  --Taglist
  --------
  local taglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
  })
  -- Create the wibar
  s.mywibar = awful.wibar({
    type = "dock",
    position = "left",
    screen = s,
    height = awful.screen.focused().geometry.height - dpi(50),
    width = beautiful.wibar_width,
    bg = beautiful.transparent,
    ontop = true,
    visible = true,
  })
  -- Remove wibar on full screen
  local function remove_wibar(c)
    if c.fullscreen or c.maximized then
      c.screen.mywibar.visible = false
    else
      c.screen.mywibar.visible = true
    end
  end

  -- Remove wibar on full screen
  local function add_wibar(c)
    if c.fullscreen or c.maximized then
      c.screen.mywibar.visible = true
    end
  end

  client.connect_signal("property::fullscreen", remove_wibar)

  client.connect_signal("request::unmanage", add_wibar)

  -- Create the taglist widget

  s.mywibar:setup({
    {
      {
        layout = wibox.layout.align.vertical,
        expand = "none",
        { -- top
          mylauncher,
          taglist,
          spacing = dpi(10),
          layout = wibox.layout.fixed.vertical,
        },
        -- middle
        nil,
        { -- bottom
          stats,
          mylayoutbox,
          spacing = dpi(8),
          layout = wibox.layout.fixed.vertical,
        },
      },
      margins = dpi(8),
      widget = wibox.container.margin,
    },
    bg = beautiful.wibar_bg,
    shape = helpers.rrect(beautiful.border_radius),
    widget = wibox.container.background,
  })

  -- wibar position
  s.mywibar.x = dpi(25)
end)
