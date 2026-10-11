#!/usr/bin/env bash
# Read-only final-state verification for the supplied lab.
# This script does not create, delete, modify, or repair anything.

set -u

BASE="/home/agent007/mission"
INTEL="$BASE/intel"
BACKUP="$BASE/ops/backup"
TARGET="$INTEL/targets.txt"

pass=0
fail=0

check_dir() {
    if [[ -d "$1" ]]; then
        printf '[PASS] Directory exists: %s\n' "$1"
        ((pass+=1))
    else
        printf '[FAIL] Missing directory: %s\n' "$1"
        ((fail+=1))
    fi
}

check_file() {
    if [[ -f "$1" ]]; then
        printf '[PASS] File exists: %s\n' "$1"
        ((pass+=1))
    else
        printf '[FAIL] Missing file: %s\n' "$1"
        ((fail+=1))
    fi
}

check_absent() {
    if [[ ! -e "$1" ]]; then
        printf '[PASS] File is absent: %s\n' "$1"
        ((pass+=1))
    else
        printf '[FAIL] File should be absent: %s\n' "$1"
        ((fail+=1))
    fi
}

check_dir "$BASE"
check_dir "$INTEL"
check_dir "$BASE/ops"
check_dir "$BACKUP"

check_file "$INTEL/targets.txt"
check_file "$INTEL/routes.txt"
check_file "$INTEL/listing1.txt"
check_file "$INTEL/listing2.txt"
check_file "$INTEL/listing3.txt"
check_file "$BACKUP/routes.txt"

check_absent "$INTEL/keys.txt"

if [[ -f "$TARGET" ]]; then
    mode="$(stat -c '%a' "$TARGET" 2>/dev/null || true)"
    if [[ "$mode" == "640" ]]; then
        printf '[PASS] targets.txt mode is 640\n'
        ((pass+=1))
    else
        printf '[FAIL] targets.txt mode is %s (expected 640)\n' "${mode:-unknown}"
        ((fail+=1))
    fi

    owner="$(stat -c '%U:%G' "$TARGET" 2>/dev/null || true)"
    if [[ "$owner" == "root:root" ]]; then
        printf '[PASS] targets.txt ownership is root:root\n'
        ((pass+=1))
    else
        printf '[FAIL] targets.txt ownership is %s (expected root:root)\n' "${owner:-unknown}"
        ((fail+=1))
    fi
fi

printf '\nFinal verification: %d passed, %d failed.\n' "$pass" "$fail"

if (( fail > 0 )); then
    exit 1
fi
