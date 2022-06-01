#!/usr/bin/env bash


declare website_urls=("http://localhost:8668" "http://virtualarcadebar.com" "https://aallbrig.github.io/virtual-arcade-bar")

for website_url in "${website_urls[@]}" ; do
  IFS=":"
  read -ra pair <<< "${website_url}"
  website_name=$(echo -n "${pair[1]//\/\//}" | sed 's./._.g' | sed 's/\./_/g')
  protocol="${pair[0]}"
  echo "ℹ️ website_name: ${website_name}"
  echo "ℹ️ website_url: ${website_name}"
  echo "ℹ️ website_protocol: ${protocol}"

  if qrencode -s 200 "${website_url}" -o ./static/media/qr-codes/"${website_name}".png ; then
    echo "✅ QR code generation complete"
  else
    echo "❌ QR generation incomplete"
  fi
done
