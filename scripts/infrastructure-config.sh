#!/usr/bin/env bash

# AWS common configuration, for use in infrastructure-up & infrastructure-test and whatever else

# Dependencies... JUST for this particular script (and not consumer's dependencies)
DEPENDENCIES=(aws python3)
for required_executable in "${DEPENDENCIES[@]}" ; do
  if ! which "${required_executable}" > /dev/null ; then
    echo "❌ required executable \"${required_executable}\" is not defined"
    exit 1
  fi
done

# NO www. in website name!
export WEBSITE_NAME=${WEBSITE_NAME:-virtualarcadebar.com}
if echo -n "${WEBSITE_NAME}" | grep -q 'www\.' ; then
  echo "❌ Website name should NOT include www."
  exit 1
fi

export REGION_ID=$(aws configure get region)
export WEBSITE_BUCKET="${WEBSITE_BUCKET:-${WEBSITE_NAME}}"
export WEBSITE_BUCKET_ACCESS_LOGS="${WEBSITE_BUCKET}-access-logs"
export WEBSITE_WWW_BUCKET="${WEBSITE_WWW_BUCKET:-www.${WEBSITE_NAME}}"
export WEBSITE_WWW_BUCKET_ACCESS_LOGS="${WEBSITE_WWW_BUCKET}-access-logs"
export WEBSITE_SRC_DIR="${WEBSITE_SRC_DIR:-static}"
export BUCKET_OWNER_ID="$(aws s3api list-buckets --query 'Owner.ID')"
