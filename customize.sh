SKIPUNZIP=0

ui_print "- Installing Pixel Wi-Fi 6E/7 & Max Power Unlock"
ui_print "- Device: Google Pixel 8 / 8 Pro (Tensor G3)"
ui_print "- Wi-Fi: Broadcom BCM4398"

set_perm_recursive "$MODPATH" 0 0 0755 0644
set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755

ui_print "- Installation complete! Reboot to apply."
