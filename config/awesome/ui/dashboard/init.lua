-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Widget library
local wibox = require("wibox")

-- rubato
local rubato = require("module.rubato")

-- Helpers
local helpers = require("helpers")

-- Aesthetic Dashboard
-------------------------
local panel_visible = false

awful.screen.connect_for_each_screen(function(s)
  dashboard = wibox({
    type = "dock",
    screen = s,
    height = awful.screen.focused().geometry.height - 19,
    width = dpi(620),
    x = 56,
    bg = beautiful.transparent,
    ontop = true,
    visible = false,
  })
  local anim_length = 0.7
  -- Gears Timer so awestore_compat can go
  local slide_end = gears.timer({
    single_shot = true,
    timeout = anim_length + 0.1, --so the panel doesnt disappear in the last bit
    callback = function()
      dashboard.visible = not dashboard.opened
    end,
  })
  -- Rubato
  local slide = rubato.timed({
    pos = -dashboard.height,
    rate = 60,
    duration = anim_length,
    intro = anim_length / 2,
    easing = rubato.linear,
    subscribed = function(pos)
      dashboard.y = pos
    end,
  })
  -- Make toogle button
  local dashboardShow = function()
    dashboard.visible = true
    slide.target = dpi(10)
    dashboard:emit_signal("opened")
  end

  local dashboardHide = function()
    slide_end:again()
    slide.target = -dashboard.height
    dashboard:emit_signal("closed")
  end

  function dashboard:toggle()
    self.opened = not self.opened
    if self.opened then
      dashboardHide()
    else
      dashboardShow()
    end
  end
  local cpu = wibox.widget({
      value = 0,
      thickness = dpi(4),
      color = beautiful.mauve,
      bg = beautiful.dashboard_widget_bg,
      widget = wibox.container.accchart,
  })

  dashboard:setup({
    cpu,
    bg = beautiful.dashboard_bg,
    shape = helpers.rrect(beautiful.notif_center_radius),
    widget = wibox.container.background,
  })
end)
