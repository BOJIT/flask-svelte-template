# flask-svelte-template
Template for lightweight applications with a Python backend (Flask) and a Svelte frontend

## Build Container
```bash
    docker-compose --profile dev build
    docker-compose --profile prod build
```

## Run Development Server (Front and Backend)

The dev server runs the static frontend dev server on port 9090, and Flask on port 8080.

```bash
    docker-compose --profile dev up
```

## Build Production Bundle
```bash
    docker-compose --profile prod up
```
