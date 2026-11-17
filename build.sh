#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTPUT="${DIR}/Pixel_Wi-Fi_Full_Uncap.zip"

rm -f "${OUTPUT}"

cd "${DIR}"
zip -r9 "${OUTPUT}" \
  module.prop \
  customize.sh \
  post-fs-data.sh \
  service.sh \
  vendor

echo "Successfully built: ${OUTPUT}"
