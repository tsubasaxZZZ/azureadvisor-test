export GO111MODULE=on

.PHONY: build
build:
	go generate
	go build -v .

.PHONY: test
test: ## go test
	go test -v -cover .

.PHONY: clean
clean: ## go clean
	rm -rf ./statik
	go clean -cache -testcache

.PHONY: analyze
analyze: ## do static code analysis
	goimports -l -w .
	go vet ./...
	golint ./...

.PHONY: all
all: test build
