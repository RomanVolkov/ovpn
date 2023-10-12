build:
	 docker buildx build --platform linux/amd64 -t romanvolkov/vpn .
	 docker push romanvolkov/vpn
