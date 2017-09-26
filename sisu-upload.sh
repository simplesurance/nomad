#!/bin/bash

set -eu

s3_bucket="sisu-resources"
s3_path="public/nomad"
bin="pkg/linux_amd64/nomad"
ver=$($bin version|awk '{ print $2 }')
zip="nomad-$ver.zip"

rm -f "$zip"
zip -j "$zip" "$bin"
aws s3 cp "$zip" "s3://$s3_bucket/$s3_path/$zip"
