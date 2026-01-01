#!/bin/bash

usage="Usage: $(basename "$0") [-v | --version]<version in semver format> [-c|--codePath]<root path to code> [-r|--releasenotes]<releasenotes>)"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -v|--version) version="$2"; shift ;;
        -c|--codePath) codePath="$2"; shift;;
        -r|--releasenotes) relNotes="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; echo $usage; exit 1 ;;
    esac
    shift
done

if [[ -z "${version}" ]] || [[ -z "${codePath}" ]] || [[ -z "${relNotes}" ]]; then
  echo "Not all required parameters passed!"; echo $usage; exit 1 ;
fi

appPath="$codePath/honeywellhomeapp.groovy"
thermDriverPath="$codePath/honeywellhomedriver.groovy"
sensorDriverPath="$codePath/honeywellremotesensordriver.groovy"

echo "Version: $version"
echo "CodePath: $codePath"
echo "AppPath: $appPath"
echo "ThermDriverPath: $thermDriverPath"
echo "SensorDriverPath: $sensorDriverPath"
echo "ReleaseNotes: $relNotes"

./hpm manifest-modify-driver --id 6973163c-9331-43f3-ac9a-12d0e17367c8 --version=$version --location $thermDriverPath honeywellManifest.json
./hpm manifest-modify-driver --id 69cdfa49-2e58-4db5-8d4a-add69976bfa8 --version=$version --location $sensorDriverPath honeywellManifest.json
./hpm manifest-modify-app --id b249b2d7-a5e2-4e6a-819c-9361c3f5c4cf --version=$version --location $appPath honeywellManifest.json
./hpm manifest-modify --releasenotes="$relNotes" --version=$version honeywellManifest.json