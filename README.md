# Flight

Local HTTPS development proxy, powered by [Traefik](https://traefik.io) and Docker.

Flight runs a single Traefik container that routes `*.flght.dev` to your project
containers over HTTPS, using a locally trusted wildcard certificate.

## Requirements

- Docker with the Compose plugin
- [mkcert](https://github.com/FiloSottile/mkcert) (`mkcert.exe` when running under WSL)

## Installation

```bash
mkdir -p ~/.local/bin
curl -fsSL https://raw.githubusercontent.com/sitepilot/flight-bash/2.x/bin/flight -o ~/.local/bin/flight
chmod +x ~/.local/bin/flight
```

Make sure `~/.local/bin` is in your `PATH`. Alternatively, clone this repository
and add its `bin` directory to your `PATH`.

The Compose file is read straight from this repository, so the script is the only
file you need.

## Usage

```bash
flight up        # start the proxy, generating a certificate when missing
flight down      # stop the proxy
flight restart   # recreate the proxy containers
flight secure    # regenerate the wildcard certificate and restart
flight help      # show all commands
```

Any other command is passed through to `docker compose`:

```bash
flight ps
flight logs -f traefik
```

The Traefik dashboard is available at `https://traefik.flght.dev`.

## Configuration

Settings live in `~/.config/flight/.env`, which is created on first run.

| Variable             | Default                 | Description                    |
| -------------------- | ----------------------- | ------------------------------ |
| `FLIGHT_DOMAIN`      | `flght.dev`             | Wildcard domain for the proxy  |
| `FLIGHT_HTTP_PORT`   | `80`                    | Host port bound to HTTP        |
| `FLIGHT_HTTPS_PORT`  | `443`                   | Host port bound to HTTPS       |
| `FLIGHT_DOCKER_SOCK` | `/var/run/docker.sock`  | Docker socket                  |

Every `*.$FLIGHT_DOMAIN` hostname needs to resolve to `127.0.0.1`. Run
`flight secure` after changing `FLIGHT_DOMAIN` to issue a matching certificate.

## Exposing a project

Attach your service to the `traefik` network and label it:

```yaml
services:
  app:
    networks:
      - default
      - traefik
    labels:
      traefik.enable: true
      traefik.http.routers.myapp.rule: "Host(`myapp.flght.dev`)"
      traefik.http.services.myapp.loadbalancer.server.port: 80

networks:
  traefik:
    external: true
```
