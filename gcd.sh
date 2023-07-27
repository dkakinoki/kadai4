#!/bin/bash

# 引数が自然数かどうかをチェックする関数
is_natural_number() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        return 1
    fi

    if [ $1 -le 0 ]; then
        return 1
    fi

    return 0
}

# 最大公約数を計算する関数
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

# 引数の数が2つでない場合はエラー終了
if [ $# -ne 2 ]; then
    echo "エラー: 2つの自然数を指定してください。" >&2
    exit 1
fi

# 自然数でない引数が指定された場合はエラー終了
if ! is_natural_number $1 || ! is_natural_number $2; then
    echo "エラー: 自然数を指定してください。" >&2
    exit 1
fi

# 最大公約数を計算して表示
result=$(gcd $1 $2)
echo "最大公約数: $result"

