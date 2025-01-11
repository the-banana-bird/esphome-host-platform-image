# syntax=docker/dockerfile:1
FROM alpine:3.21.2

# install dependencies
RUN apk add --no-cache python3 py3-pip g++
RUN pip3 install --no-cache-dir --upgrade --break-system-packages esphome

# copy local files
COPY entrypoint.sh .

# final configuration
EXPOSE 6052
VOLUME /config
ENTRYPOINT ["sh", "-c", "./entrypoint.sh" ]