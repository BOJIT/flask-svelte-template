# flask-svelte-template
Template for lightweight applications with a Python backend (Flask) and a Svelte frontend

## Build Containers
```bash
docker-compose --profile dev build
docker-compose --profile prod build
```

## Run Development Server (Front and Backend)

The dev server runs the static frontend dev server on port `9090`, and Flask on port `8080`.

```bash
docker-compose --profile dev up
```

## Build Production Bundle
```bash
docker-compose --profile prod up
```

## Example Deployment (Debian, Raspberry Pi)
```bash
scp -r dist/app pi@192.168.1.203:/home/pi/
# ssh pi@HOSTNAME -f 'chmod +x ./dist/install.sh && ./dist/install.sh'
```

Note that the `app.service` file and `install.sh` are set up for deploying on a Raspberry Pi. Every other part of the `dist/` output is platform-agnostic
