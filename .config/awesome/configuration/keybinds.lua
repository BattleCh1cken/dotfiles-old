local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")


local beautiful = require("beautiful")

local bling = require("module.bling")
local playerctl = bling.signal.playerctl.lib()
modkey = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"


--Launchers
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey },            "d",     function () awful.spawn("rofi -show drun") end,
              {description = "run prompt", group = "launcher"}),
    awful.key({modkey,}, "Tab", function() awful.spawn("rofi -show window") end,
      {description = "switch windows", group = "launcher"}),
   
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
           })
-- Focus related keybinds
awful.keyboard.append_global_keybindings({
    awful.key({modkey}, "j", function()
        awful.client.focus.bydirection("down")
    end,
    {description = "focus down", group = "client"}),

    awful.key({modkey}, "k", function()
        awful.client.focus.bydirection("up")
    end,
    {description = "focus up", group = "client"}),
    awful.key({modkey}, "h", function()
        awful.client.focus.bydirection("left")
    end,
    {description = "focus left", group = "client"}),
    awful.key({modkey}, "l", function()
        awful.client.focus.bydirection("right")
    end,
    {description = "focus right", group = "client"}),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, alt         }, ".",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey, alt        }, ",",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
              
    awful.key({ modkey, "Shift"   }, ",",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
              
    awful.key({ modkey, "Shift"   }, ".",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
              
    awful.key({ modkey, "Control" }, ",",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
              
    awful.key({ modkey, "Control" }, ".",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
              
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
              
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
})


--Move Clients around
awful.keyboard.append_global_keybindings({
    awful.key({modkey, "Shift"}, "j", function()
        awful.client.swap.byidx(1)
    end,
    {description = "swap with next client by index", group = "client"}),

    awful.key({modkey, "Shift"}, "k", function()
        awful.client.swap.byidx(-1)
    end,
    {description = "swap with previous client by index", group = "client"}),

    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})
--hotkeys
awful.keyboard.append_global_keybindings({
    -- Brightness Control
    awful.key({}, "XF86MonBrightnessUp", function() 
        awful.spawn("brightnessctl set 5%+ -q") 
    end,
    {description = "increase brightness", group = "hotkeys"}),
    awful.key({}, "XF86MonBrightnessDown", function() 
        awful.spawn("brightnessctl set 5%- -q") 
    end,
    {description = "decrease brightness", group = "hotkeys"}),

    -- Volume control
    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +05%")
    end,
    {description = "increase volume", group = "hotkeys"}),
    awful.key({}, "XF86AudioLowerVolume", function()
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -05%")
    end,
    {description = "decrease volume", group = "hotkeys"}),
    awful.key({}, "XF86AudioMute", function()
        helpers.volume_control(0)
    end,
    {description = "mute volume", group = "hotkeys"}),

    -- Music
    awful.key({}, "XF86AudioPlay", function()
        playerctl:play_pause()
    end,
    {description = "toggle music", group = "hotkeys"}),

    awful.key({}, "XF86AudioPrev", function()
        playerctl:previous()
    end,
    {description = "previous music", group = "hotkeys"}),

    awful.key({}, "XF86AudioNext", function()
        playerctl:next()
    end,
    {description = "next music", group = "hotkeys"}),

    awful.key({modkey, shift }, "s", function()
       awful.spawn("flameshot gui")
    end,
    {description = "screenshot", group = "hotkeys"}),
    -- awful.key({ modkey, },"S" function()
    --   awful.spawn("flameshot gui")
    -- end,
    -- {description = "take screenshot", group = "hotkeys"}),

})
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            {description = "toggle fullscreen", group = "client"}),
        awful.key({ modkey,}, "q",      function (c) c:kill()                         end,
                {description = "close", group = "client"}),

        awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
                {description = "toggle floating", group = "client"}),

        awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                {description = "move to master", group = "client"}),

        awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
                {description = "move to screen", group = "client"}),

        awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
                {description = "toggle keep on top", group = "client"}),

        awful.key({ modkey,           }, "n",
            function (c)
                -- The client currently has the input focus, so it cannot be
                -- minimized, since minimized clients can't have the focus.
                c.minimized = true
            end ,
            {description = "minimize", group = "client"}),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            {description = "(un)maximize", group = "client"}),
        awful.key({ modkey, "Control" }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            {description = "(un)maximize vertically", group = "client"}),
        awful.key({ modkey, "Shift"   }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            {description = "(un)maximize horizontally", group = "client"}),
    })
end)

--Mouse Bindings
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)
