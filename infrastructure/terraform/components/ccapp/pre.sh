echo Running pre.sh

repo_root="$(git rev-parse --show-toplevel)"

pnpm --dir "$repo_root" install --frozen-lockfile

echo About to build lambdas
pnpm --dir "$repo_root" run build-lambda
