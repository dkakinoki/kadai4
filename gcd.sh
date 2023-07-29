#!/bin/bash

is_natural_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] || [ $1 -le 0 ]; then
        return 1
    fi

    return 0
}

gcd() {
    local a=$1
    local b=$2

    while [ $b -ne 0 ]; do
        local remainder=$((a % b))
        a=$b
        b=$remainder
    done

    echo $a
}

if [ $# -ne 2 ]; then
    echo "エラー: 2つの自然数を指定してください。" >&2
    exit 1
fi

if ! is_natural_number $1 || ! is_natural_number $2; then
    echo "エラー: 自然数を指定してください。" >&2
    exit 1
fi

result=$(gcd $1 $2)
echo "最大公約数: $result"

