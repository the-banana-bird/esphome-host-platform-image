#/bin/sh
if [[ -z "$DEVICE_CONFIG" ]]; then
    echo "Missing DEVICE_CONFIG environment variable!"
    sleep 10
elif [[ ! -e "$DEVICE_CONFIG" ]]; then
    echo "Missing DEVICE_CONFIG file: $DEVICE_CONFIG"
    sleep 10
else
    echo $DEVICE_CONFIG
fi