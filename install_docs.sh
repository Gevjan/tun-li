#!/bin/sh

if [ -z `which appledoc` ]; then
    echo "Unable to find appledoc. Consider installing it from source or Homebrew."
    exit 1
fi

VERSION=$( git tag | sort -r | sed -n '1p' )
echo "Creating new docs for $VERSION..."
echo

appledoc \
    --output /tmp/`uuidgen` \
    --project-name "MBXMapKit $VERSION" \
    --project-company Mapbox \
    --create-docset \
    --company-id com.mapbox \
    --ignore .m \
    --index-desc README.md \
    .