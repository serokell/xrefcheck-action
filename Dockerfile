# Container image that runs your code
FROM alpine:3.11

# Install dependencies
RUN apk update
RUN apk --no-cache --virtual add wget

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
