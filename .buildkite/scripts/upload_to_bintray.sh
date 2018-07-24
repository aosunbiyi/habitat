#!/bin/bash

# We need to upload (but not publish) artifacts to Bintray right now.

set -euo pipefail

# TODO: bintray user = chef-releng-ops!

channel=$(buildkite-agent meta-data get "release-channel")

# TODO (CM): extract set_hab_binary function to a common library and
# use it here

echo "--- :habicat: Installing core/hab-bintray-publish from '${channel}' channel"
sudo hab pkg install \
     --channel="${channel}" \
     core/hab-bintray-publish

# TODO (CM): determine artifact name for given hab identifier
#            could save this as metadata, or just save the artifact in
#            BK directly

echo "--- :habicat: Uploading core/hab to Bintray"

# TODO (CM): Continue with this approach, or just grab the artifact
# that we built out of BK?
#
# If we use `hab pkg install` we know we'll get the artifact for our
# platform.
#
# If we use Buildkite, we can potentially upload many different
# platform artifacts to Bintray from a single platform (e.g., upload
# Windows artifacts from Linux machines.)
sudo hab pkg install core/hab --channel="${channel}"

hab_artifact=$(buildkite-agent meta-data get "hab-artifact")

# We upload to the stable channel, but we don't *publish* until
# later.
#
# -s = skip publishing
# -r = the repository to upload to
sudo -E HAB_BLDR_CHANNEL="${channel}" \
                hab pkg exec core/hab-bintray-publish \
                publish-hab \
                -s \
                -r stable \
                "/hab/cache/artifacts/${hab_artifact}"

source results/last_build.env
shasum=$(awk '{print $1}' "results/${pkg_artifact:?}.sha256sum")
cat << EOF | buildkite-agent annotate --style=success --context=bintray-hab
<h3>Habitat Bintray Binary (${pkg_target:?})</h3>
Artifact: <code>${pkg_artifact}</code>
<br/>
SHA256: <code>${shasum}</code>
EOF

echo "--- :habicat: Uploading core/hab-studio to Bintray"
# again, override just for backline
sudo -E HAB_BLDR_CHANNEL="${channel}" \
CI_OVERRIDE_CHANNEL="${channel}" \
                hab pkg exec core/hab-bintray-publish \
                publish-studio \
                -r stable

# The logic for the creation of this image is spread out over soooo
# many places :/
source results/last_image.env
cat << EOF | buildkite-agent annotate --style=success --context=docker-studio
<h3>Docker Studio Image (Linux)</h3>
<ul>
  <li><code>${docker_image:?}:${docker_image_version:?}</code></li>
  <li><code>${docker_image:?}:${docker_image_short_version:?}</code></li>
  <li><code>${docker_image:?}:latest</code></li>
</ul>
EOF
