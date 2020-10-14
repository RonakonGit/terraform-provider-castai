default: build

init-examples:
	@echo "==> Creating symlinks for example/ projects to terraform-provider-castai binary"
	@for tfproject in examples/* ; do \
        TF_PROVIDER_FILENAME=terraform-provider-castai; \
		TF_PROJECT_PLUGIN_PATH="$${tfproject}/.terraform/plugins/registry.terraform.io/hashicorp/castai/0.0.1/darwin_amd64"; \
		echo "creating $${TF_PROVIDER_FILENAME} symlink to $${TF_PROJECT_PLUGIN_PATH}/$${TF_PROVIDER_FILENAME}"; \
		mkdir -p "${PWD}/$${TF_PROJECT_PLUGIN_PATH}"; \
		ln -sf "${PWD}/terraform-provider-castai" "$${TF_PROJECT_PLUGIN_PATH}"; \
	done

generate-sdk:
	@echo "==> Generating castai sdk client"
	go generate castai/sdk/generate.go

build: init-examples
build: generate-sdk
build:
	@echo "==> Building terraform-provider-castai"
	go build

test:
	@echo "==> Running tests"
	go test -i $$(go list ./...) || exit 1
	go test $$(go list ./...) -timeout=1m -parallel=4

testacc:
	@echo "==> Running acceptance tests"
	TF_ACC=1 go test $(TEST) -v $(TESTARGS) -timeout 120m