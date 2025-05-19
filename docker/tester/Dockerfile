FROM rafal206/dependencies:1.0

WORKDIR /workspace

# Copy everything
COPY . .

# Ensure that go is istalled
RUN if [ -f go.mod ]; then go mod download; fi

# Logs collection
CMD ["sh", "-c", "mkdir -p output && make test > output/test_log.log 2>&1; cat output/test_log.log"]
