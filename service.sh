#!/system/bin/sh
MODDIR=${0%/*}

# Wait for Android to finish booting
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

# Wait for Wifi service to settle
sleep 4

# Force Regulatory Domain to GB (Enables 6GHz UNII-5 SoftAP/Hotspot, 59 6GHz client channels, 2.4GHz CH 1-13, and 5GHz UNII-1/3)
cmd wifi force-country-code enabled GB

# Brief cycle to ensure Broadcom driver loads GB regulatory channels
cmd wifi set-wifi-enabled disabled
sleep 1
cmd wifi set-wifi-enabled enabled
