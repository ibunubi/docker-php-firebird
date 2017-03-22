# PHP with Firebird module & Firebird Server Dockerfile

## Description

 Minimal PHP with Firebird module + nginx + Firebird server

### Exposed Ports

 * 80 
 * 3050

## Build Image
`./build.sh [tag-name]`

## Run
* `./run.sh [image tag/id]` access to port `8081`
* `./run-app.sh [image tag/id]` access to port `8082`


### Credits

this image is modified from [Almeida Hub](https://hub.docker.com/r/almeida/php-firebird/)