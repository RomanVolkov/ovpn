# ovpn

This is a rebuild of https://github.com/jpetazzo/dockvpn that works with new version of OpenVPN iOS app (with updated OpenSSL usage)


How to use it. 

Step with `DOCKER_DEFAULT_PLATFORM` is optional and it helped me to force required platform at Digital Ocean droplet.


Once you run all command you will see some address like https://1.1.1.1:8080/


You need to open it and download .ovpn config file.


To fix issue for new iOS version you need to open .ovpn file and remove `<dh>` `</dh>` section fully

If you prefer to build you own image from it just replace `romanvolkov/vpn` with your docker hub image id. 

How to build:

`docker buildx build --platform linux/arm64 -t <tag>`


`docker buildx build --platform linux/amd64 -t <tag>`


`docker buildx build --platform linux/arm/v7 -t <tag>`


then replace `romanvolkov/vpn` with your `<tag>` 

```
apt-get update && apt-get install
apt install -y docker
apt install -y docker.io
export DOCKER_DEFAULT_PLATFORM=linux/amd64
CID=$(docker run -d --privileged -p 1194:1194/udp -p 443:443/tcp romanvolkov/vpn)
docker run -t -i -p 8080:8080 --volumes-from $CID romanvolkov/vpn
docker run -t -i -p 8080:8080 --volumes-from $CID romanvolkov/vpn serveconfig
```
