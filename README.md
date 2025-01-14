# esphome-host-platform-image
Alpine docker image running a single host platform device in esphome. Mount your persistent config folder to the /config volume, then specify a file such as /config/host-platform.yaml with the DEVICE_CONFIG environment variable. The container will call `esphome run $DEVICE_CONFIG` automatically to start the host platform device.

To build the image locally, run `docker build -t esphome-host-platform .`

Example docker-compose script:
```
services:
  esphome:
    container_name: esphome-optoma-uhd30
    image: esphome-host-platform
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
