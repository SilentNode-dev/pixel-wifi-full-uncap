#!/system/bin/sh
MODDIR=${0%/*}

# Systemless bind-mount for patched Broadcom BCM4398 TXCAP and Calibration files
for f in bcmdhd_txcap.blob_4398_d0 bcmdhd_txcap.blob_4398_c0 bcmdhd.cal_NA bcmdhd.cal_ROW; do
  SRC="$MODDIR/vendor/firmware/$f"
  DST="/vendor/firmware/$f"
  if [ -f "$SRC" ] && [ -f "$DST" ]; then
    chcon u:object_r:vendor_fw_file:s0 "$SRC"
    chmod 0644 "$SRC"
    mount --bind "$SRC" "$DST"
  fi
done
