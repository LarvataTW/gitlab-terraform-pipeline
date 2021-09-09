# Using bash
SHELL := /bin/bash

# One worker at the time
MAKEFLAGS = --jobs=1

# Terraform version
TF_VERSION = 0.13.5

.PHONY: docker
docker: ## 模擬 Gitlab CI/CD 時的 container 環境
	docker run --rm -it -v $(PWD):/builds --entrypoint /bin/sh -w /builds hashicorp/terraform:$(TF_VERSION)

# Absolutely awesome: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
