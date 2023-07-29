#!/bin/bash

is_natural_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] || [ $1 -le 0 ]; then
        return 1
    fi

    return 0
}

gcd() {
    if (( $2 == 0 )); then
       echo $1
    else
       echo $(gcd $2 $(( $1 % $2 )))
    fi
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

