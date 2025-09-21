# Yabai and SKHD Management Guide

## Stop Services (without disabling auto-start)
```bash
# Stop yabai
launchctl stop com.koekeishiya.yabai

# Stop skhd
launchctl stop com.koekeishiya.skhd
```

## Disable Auto-start (unload launch agents)
```bash
# Stop yabai and disable auto-start
launchctl unload ~/Library/LaunchAgents/com.koekeishiya.yabai.plist

# Stop skhd and disable auto-start
launchctl unload ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
```

## Enable Auto-start (load launch agents)
```bash
# Re-enable yabai auto-start
launchctl load ~/Library/LaunchAgents/com.koekeishiya.yabai.plist

# Re-enable skhd auto-start
launchctl load ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
```

## Start Services Manually
```bash
# Start yabai manually
yabai --start-service

# Start skhd manually
skhd --start-service
```

## Alternative Manual Start (using brew services)
```bash
# Start yabai
brew services start yabai

# Start skhd
brew services start skhd
```

## Complete Uninstallation

### 1. Stop and disable services first
```bash
# Stop and disable yabai
launchctl unload ~/Library/LaunchAgents/com.koekeishiya.yabai.plist

# Stop and disable skhd
launchctl unload ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
```

### 2. Uninstall packages
```bash
# Uninstall yabai
brew uninstall yabai

# Uninstall skhd
brew uninstall skhd
```

### 3. Clean up configuration files (optional)
```bash
# Remove yabai config
rm ~/.yabairc

# Remove skhd config
rm ~/.skhdrc

# Remove any remaining launch agents
rm ~/Library/LaunchAgents/com.koekeishiya.yabai.plist
rm ~/Library/LaunchAgents/com.koekeishiya.skhd.plist
```

## Re-enable System Integrity Protection (if disabled for yabai)
If you disabled SIP specifically for yabai and want to re-enable it:

1. Boot into Recovery Mode (hold Cmd+R during startup)
2. Open Terminal from Utilities menu
3. Run: `csrutil enable`
4. Restart your Mac

## Quick Reference

| Action | Command |
|--------|---------|
| Stop without disabling | `launchctl stop com.koekeishiya.yabai` |
| Disable auto-start | `launchctl unload ~/Library/LaunchAgents/com.koekeishiya.yabai.plist` |
| Enable auto-start | `launchctl load ~/Library/LaunchAgents/com.koekeishiya.yabai.plist` |
| Start manually | `yabai --start-service` |
| Uninstall | `brew uninstall yabai` |

Replace `yabai` with `skhd` for skhd-specific commands.
