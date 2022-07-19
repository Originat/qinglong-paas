podman run -dit \
  --network bridge \
  -v $PWD/ql:/ql/data \
  -p 5700:5700 \
  --name qinglong \
  --hostname qinglong \
  --restart unless-stopped \
  docker.io/whyour/qinglong:latest
