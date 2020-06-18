# Container image that runs your code
FROM alpine:3.11

# Install dependencies
RUN apk update
## pass these flags to make the image smaller
RUN apk --no-cache --virtual add bash wget

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
