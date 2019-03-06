# hello-world-dotnet-core-2.1
Hello World application (.net core 2.1, console)

## Docker Compose

### Development

#### Up all containers

```sh
docker-compose up -d
```

#### Watch Run

```sh
docker-compose exec --user=workspace app dotnet watch run
```

## Docker

### Production

#### Build

```sh
docker build -t hello-world-dotnet-core2.1:latest -f Dockerfile.alpine-x64-globalization .
```

#### Running

```sh
docker run --rm -it hello-world-dotnet-core2.1:latest
```