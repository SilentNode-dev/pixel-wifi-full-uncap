#!/system/bin/sh
MODDIR=${0%/*}

# Wait for Android to finish booting
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done

# Wait for wifi service to be available
sleep 3

# Lock Regulatory Domain to US (FCC full 6GHz spectrum 5955-7095MHz & 30dBm max EIRP)
cmd wifi force-country-code enabled US

# Verify if driver country code has updated to US
DRIVER_CC=$(dumpsys wifi | grep "mDriverCountryCode:" | head -n 1 | awk '{print $2}')
if [ "$DRIVER_CC" != "US" ]; then
  # Re-cycle wifi once to force driver to adopt US regulatory table
  cmd wifi set-wifi-enabled disabled
  sleep 1
  cmd wifi set-wifi-enabled enabled
fi
