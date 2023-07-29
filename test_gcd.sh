#!/bin/bash

script_path="./gcd.sh"

echo "正常系:"
output=$($script_path 2 4 2>&1)
expected_output="最大公約数: 2"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了: $expected_output"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 100 25 2>&1)
expected_output="最大公約数: 25"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了: $expected_output"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 7 13 2>&1)
expected_output="最大公約数: 1"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了: $expected_output"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 24 36 2>&1)
expected_output="最大公約数: 12"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了: $expected_output"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 1000000000 2000000000 2>&1)
expected_output="最大公約数: 1000000000"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了: $expected_output"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

echo "異常系:"
# 引数の数が少ない
output=$($script_path 2 2>&1)
expected_output="エラー: 2つの自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 引数の数が多い
output=$($script_path 2 4 6 2>&1)
expected_output="エラー: 2つの自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 負の数が指定された
output=$($script_path -2 4 2>&1)
expected_output="エラー: 自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 小数が指定された
output=$($script_path 2.5 4 2>&1)
expected_output="エラー: 自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "正常終了"
else
    echo "エラー"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

