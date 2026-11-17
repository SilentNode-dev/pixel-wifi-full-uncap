#!/system/bin/sh
MODDIR=${0%/*}

# Wait for Android to finish booting
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

# Wait for Wifi service to settle
sleep 4

# Force Regulatory Domain to US (FCC full 6GHz spectrum 5955-7095MHz & 30dBm max EIRP)
cmd wifi force-country-code enabled US

# Brief cycle to ensure Broadcom driver loads US regulatory channels
cmd wifi set-wifi-enabled disabled
sleep 1
cmd wifi set-wifi-enabled enabled
