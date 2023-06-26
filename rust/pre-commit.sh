#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

cd "$(dirname "$0")"

main() {
  echo "Running pre-commit hook"

  (
    cd "../../" &&
      echo "Running cargo fmt" && cargo fmt --all -- --check &&
      echo "Running cargo clippy" && cargo clippy -- -D warnings &&
      echo "Running cargo build" && cargo build &&
      echo "Running cargo test" && cargo test &&
      echo "Running cargo audit" && cargo audit
  )

  echo "Finished pre-commit hook"
}

main "$@"
