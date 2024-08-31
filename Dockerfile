FROM rust:1.80

WORKDIR /app
COPY rpi-screen-service/ .

RUN apt update && \
  apt install --no-install-recommends --assume-yes \
    protobuf-compiler \
    libprotobuf-dev \
    libssl-dev && \
  cargo install --bin screen-server --features="server" --path .

# This is taken care of by the compose file's `command` line.
#CMD ["screen-server", "-c" "config.json"]
