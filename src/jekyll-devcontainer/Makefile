build:
	make -C ../../ Makefile version
	ver=$$(head -n 1 ../../.version 2> /dev/null || echo unknown); \
	verb=$$(echo $$ver | sed 's/\+.*//'); \
	echo "version: $$verb"; \
	BUILDKIT_PROGRESS=plain pnpm dlx @devcontainers/cli build --workspace-folder ./src --image-name "ghcr.io/nhsdigital/nhs-notify-client-config:$$verb"

publish:
	ver=$$(head -n 1 ../../.version 2> /dev/null || echo unknown); \
	verb=$$(echo $$ver | sed 's/\+.*//'); \
	echo "version: $$verb"; \
	docker image tag ghcr.io/nhsdigital/nhs-notify-client-config:$$verb ghcr.io/nhsdigital/nhs-notify-client-config:latest; \
	docker push "ghcr.io/nhsdigital/nhs-notify-client-config:$$verb"; \
	docker push "ghcr.io/nhsdigital/nhs-notify-client-config:latest"

debug:
	pnpm dlx @devcontainers/cli up --workspace-folder ./src
	pnpm dlx @devcontainers/cli exec --workspace-folder ./src ls -la ./.devcontainer
	pnpm dlx @devcontainers/cli exec --workspace-folder ./src cat ./.devcontainer/packages.txt
	pnpm dlx @devcontainers/cli exec --workspace-folder ./src ./.devcontainer/check.sh
