#!/bin/bash

# Assuming that the version-and-release of a core/hab-launcher are
# present in the Buildkite metadata, promote that release to the
# release channel.
#
# If the metadata is not present, promote the stable release of the
# launcher to the release channel.

set -euo pipefail

resolve_latest() {
    local metadata_key="${1}"
    local target="${2}"

    if buildkite-agent meta-data exists "${metadata_key}"; then
        launcher=$(buildkite-agent meta-data get "${metadata_key}")
        launcher="core/hab-launcher/${launcher}"
    else
        local url="https://bldr.habitat.sh/v1/depot/channels/core/stable/pkgs/hab-launcher/latest?target=${target}"
        launcher=$(curl -s "${url}" | jq -r '.ident | .origin + "/" + .name + "/" + .version + "/" + .release')
    fi

    echo "${launcher}"
}

linux_launcher="$(resolve_latest linux-launcher x86_64-linux)"
windows_launcher="$(resolve_latest windows-launcher x86_64-windows)"

channel=$(buildkite-agent meta-data get "release-channel")

echo "--- :linux: :habicat: Promoting ${linux_launcher} for Linux to ${channel}"
hab pkg promote --auth="${HAB_TEAM_AUTH_TOKEN}" "${linux_launcher}" "${channel}"

echo "--- :windows: :habicat: Promoting ${windows_launcher} for Windows to ${channel}"
hab pkg promote --auth="${HAB_TEAM_AUTH_TOKEN}" "${windows_launcher}" "${channel}"
