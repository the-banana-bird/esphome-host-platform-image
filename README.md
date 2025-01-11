# esphome-host-only-image
Alpine docker image running a single host-only device in esphome. Mount your persistent config folder to the /config volume, then specify a file such as /config/host-only.yaml with the DEVICE_CONFIG environment variable. The container will call `esphome run $DEVICE_CONFIG` automatically to start the host-only device.

Example docker-compose script for an RS232-USB integration for an Optoma projector:
```
services:
  esphome:
    container_name: esphome-optoma-uhd30
    image: esphome-host-only
    volumes:
      - /root/config:/config
      - /etc/localtime:/etc/localtime:ro
    devices:
      - /dev/ttyUSB0:/dev/ttyUSB0
    restart: always
    privileged: true
    network_mode: host
    environment:
      DEVICE_CONFIG: "/config/optoma-uhd30.yaml"
```