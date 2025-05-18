FROM myorg/dependencies:1.0

WORKDIR /app
COPY . .
# domyślny entrypoint uruchamia testy
ENTRYPOINT ["sh", "-c", "npm test || exit 1"]
