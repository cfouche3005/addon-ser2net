#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Ser2net
# Configures Ser2net
# ==============================================================================

readonly CONFIG_FILE=/etc/ser2net/ser2net.yaml

# Create config directory if it doesn't exist
mkdir -p /etc/ser2net

# Write the raw config directly
bashio::config "config" > "${CONFIG_FILE}"

bashio::log.info "Ser2net configuration written"