# Build & push
`docker buildx build --push --tag renkosteenbeek/apache:latest --platform linux/arm64,linux/amd64 .`

# Build only
`docker buildx build --tag renkosteenbeek/apache:latest --platform linux/arm64,linux/amd64 .`