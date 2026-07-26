-- Quick and simple hyprland configuration
-- Nice to have commands
-- sudo nmcli connection modify "WIFI-NAME" connection.autoconnect yes

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
})
hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@144",
    position = "-1920x0",
    scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "alacritty"
local menu = "rofi -show drun -theme ~/.config/rofi/themes/custom_hyprland.rasi"
local fileManager = "thunar"

-------------------
---- AUTOSTART ----
-------------------

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("mako")
    hl.exec_cmd("waybar")
    -- hl.exec_cmd("blueman-applet")
    -- hl.exec_cmd("sh -c \"sleep 10 && sudo mount -a\"")
    -- hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1") -- pole pre heslo v apkach
    hl.exec_cmd("/usr/libexec/hyprpolkitagent")
    hl.exec_cmd("pipewire")
    hl.exec_cmd("pipewire-pulse")
    hl.exec_cmd("wireplumber")
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland")
    hl.exec_cmd("sleep 1 && /usr/libexec/xdg-desktop-portal")
    --hl.exec_cmd("/usr/local/bin/power-profile-watch.sh &")	
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")

-- potrebujes ale subor v /etc/modprobe.d/nvidia-power.conf  s = options nvidia NVreg_DynamicPowerManagement=0x02

hl.env("NVD_BACKEND", "direct")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
--hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")





-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = { enforce_permissions = true },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 2,

        col = {
            active_border = "rgba(1a1a1aff)",
            inactive_border = "rgba(0f0f0fff)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 1,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true, -- bolo "yes, please :)" v starom configu
    },
})

-- Default curves, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1} } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1} } })

-- Default animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only" - odkomentuj ak chces pouzivat
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding = 0,
-- })
-- hl.window_rule({
--     name = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
hl.config({
    master = {
        new_status = "master",
    },
})

----------------
---- MISC ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background
        disable_splash_rendering = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "sk",
        kb_variant = "",
        kb_model = "",
        kb_options = "caps:none",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
        },

        -- MIGRATION_NOTE: nie som 100% isty, ci tablet patri presne takto pod input
        -- v aktualnej Lua syntaxi - over na https://wiki.hypr.land/Configuring/Variables/#tablet
        tablet = {
            output = "current", -- alebo nazov monitoru napr. "HDMI-A-1"
        },
    },
})

hl.device({
    name = "asue120a:00-04f3:319b-touchpad",
    accel_profile = "adaptive",
    sensitivity = 0,
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

-- MIGRATION_NOTE: "epic-mouse-v1" je ten povodny placeholder z default Hyprland
-- configu - ak nemas naozaj zariadenie s tymto nazvom (over cez `hyprctl devices`),
-- tento blok nerobi nic a mozes ho zmazat.
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- MIGRATION_NOTE: exit dispatcher (hl.dsp.exit()) je rovnaky efekt ako stare "exit",
-- ale Hyprland teraz odporuca pri uwsm session pouzivat "uwsm stop" namiesto priameho exitu.
hl.bind(mainMod .. " + M", hl.dsp.exit())

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))
hl.bind("VoidSymbol", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("rofi -show filebrowser -theme ~/.config/rofi/themes/custom_hyprland.rasi"))

-- ROG G15 Strix (2021) Specific binds
hl.bind("code:156", hl.dsp.exec_cmd("rog-control-center")) -- ASUS Armory crate key
hl.bind("code:211", hl.dsp.exec_cmd("asusctl profile -n; pkill -SIGRTMIN+8 waybar")) -- Fan Profile key switch between power profiles
hl.bind("code:121", hl.dsp.exec_cmd("pamixer -t")) -- Speaker Mute FN+F1
hl.bind("code:122", hl.dsp.exec_cmd("pamixer -d 5")) -- Volume lower key
hl.bind("code:123", hl.dsp.exec_cmd("pamixer -i 5")) -- Volume Higher key
hl.bind("code:256", hl.dsp.exec_cmd("pamixer --default-source -t")) -- Mic mute key
hl.bind("code:232", hl.dsp.exec_cmd("brightnessctl set 10%-")) -- Screen brightness down FN+F7
hl.bind("code:233", hl.dsp.exec_cmd("brightnessctl set 10%+")) -- Screen brightness up FN+F8

hl.bind("code:237", hl.dsp.exec_cmd("brightnessctl -d asus::kbd_backlight set 33%-")) -- Keyboard brightness down FN+F2
hl.bind("code:238", hl.dsp.exec_cmd("brightnessctl -d asus::kbd_backlight set 33%+")) -- Keyboard brightness up FN+F3
hl.bind("code:210", hl.dsp.exec_cmd("asusctl led-mode -n")) -- Switch keyboard RGB profile FN+F4

-- Moje bindy
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("flatpak run net.waterfox.waterfox"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pkill waybar && waybar"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("/home/kristian/.local/bin/power-menu-rofi.sh")) -- Power managment
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("/home/kristian/.local/bin/power-menu-rofi.sh")) -- Power managment
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("flatpak run dev.vencord.Vesktop")) -- Discord launch
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("steam")) -- Steam launch
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("flatpak run net.lutris.Lutris"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region output -o ~/Pictures"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("flatpak run com.github.iwalton3.jellyfin-media-player")) -- Jellyfin
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("flatpak run io.github.dweymouth.supersonic")) -- Supersonic hudba
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("flatpak run com.ticktick.TickTick")) -- TickTick
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd('WINEPREFIX="$HOME/.affinity" wine "$HOME/.affinity/drive_c/Program Files/Affinity/Photo 2/Photo.exe"')) hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
-- Move focus with mainMod + arrow keys (povodne pismena na SK layoute)
hl.bind(mainMod .. " + ocircumflex", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9] (SK layout znaky)
hl.bind(mainMod .. " + plus", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + lcaron", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + scaron", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + ccaron", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + tcaron", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + zcaron", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + yacute", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + aacute", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + plus", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + lcaron", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + scaron", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + ccaron", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + tcaron", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + zcaron", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + yacute", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + aacute", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Example special workspace (scratchpad) - nepouzivane, povodne tiez zakomentovane
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    -- Ignore maximize requests from all apps
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})
