#!/command/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Ser2net
# Configures Ser2net
# ==============================================================================

readonly CONFIG_FILE=/etc/ser2net/ser2net.yaml

# Create config directory if it doesn't exist
mkdir -p /etc/ser2net

# Start building the YAML config
{
    echo ""
} > "${CONFIG_FILE}"

# Add connections
for connection in $(bashio::config "connections|keys"); do
    name=$(bashio::config "connections[${connection}].name")
    port=$(bashio::config "connections[${connection}].port")
    device=$(bashio::config "connections[${connection}].device")
    baud=$(bashio::config "connections[${connection}].baud")
    parity=$(bashio::config "connections[${connection}].parity")
    stopbits=$(bashio::config "connections[${connection}].stopbits")
    databits=$(bashio::config "connections[${connection}].databits")

    # Build the connector string
    connector="serialdev,${device},${baud}${databits}${parity:0:1}${stopbits}"

    {
        echo "connection: &${name}"
        echo "  accepter: tcp,${port}"
        echo "  connector: ${connector}"
        echo "  options:"
        if bashio::config.true "connections[${connection}].kickolduser"; then
            echo "    kickolduser: true"
        fi
        if bashio::config.has_value "connections[${connection}].max_connections"; then
            max_conn=$(bashio::config "connections[${connection}].max_connections")
            echo "    max-connections: ${max_conn}"
        fi
        echo ""
    } >> "${CONFIG_FILE}"
done

bashio::log.info "Ser2net configuration generated"