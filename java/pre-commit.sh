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

  dirs=()
  while IFS='' read -r line; do dirs+=("$line"); done < \
    <((
      cd ../../ && git diff --name-only --staged | # extract names of staged files
        grep -E '.*/src/main/.*\.java' |           # match java files that are in src/main dir
        sed -E 's/(.*)/src/main/.*/\1/g' |         # keep only top level directory name, that is, project name
        sort |                                     # sort so we can filter out duplicates
        uniq
    ))

  for dir in "${dirs[@]}"; do
    (cd "../../$dir" && echo "Running Checkstyle in $dir" && ./gradlew checkstyleMain)
  done

  echo "Finished pre-commit hook"
}

main "$@"
