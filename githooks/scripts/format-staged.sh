#!/bin/sh

if ! command -v clang-format >/dev/null 2>&1; then
	echo "pre-commit: clang-format not found in PATH" >&2
	exit 1
fi

files=$(git diff --cached --name-only --diff-filter=ACMR -- '*.cpp' '*.h' '*.hpp')

[ -z "$files" ] && exit 0

partial=""

for f in $files; do
	if ! git diff --quiet -- "$f"; then
		partial="$partial $f"
	fi
done

if [ -n "$partial" ]; then
	echo "pre-commit: these files have unstaged changes, stage or stash them first:" >&2
	for f in $partial; do echo "  $f" >&2; done
	exit 1
fi

echo "$files" | xargs clang-format -i
echo "$files" | xargs git add
