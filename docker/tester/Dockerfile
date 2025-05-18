# bazujemy na obrazie, w którym są już Go, git, make itd.
FROM dependencies:1.0

# ustalamy katalog roboczy wewnątrz kontenera
WORKDIR /workspace

# kopiujemy z kontekstu całe źródła i Makefile
# Uwaga: budując obraz, musisz podać za kontekst katalog projektowy (root repo)
COPY . .

# (opcjonalnie) pobieramy zależności Go, żeby cache’ować warstwę
RUN if [ -f go.mod ]; then go mod download; fi

# domyślny entrypoint uruchamia testy i wypisuje logi
CMD ["sh", "-c", "mkdir -p output && make test > output/test_log.log 2>&1; cat output/test_log.log"]
