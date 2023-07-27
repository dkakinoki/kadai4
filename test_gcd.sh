#!/bin/bash

# シェルスクリプトのパス
script_path="./gcd.sh"

# 正しい挙動のテストケース
echo "正しい入力のテスト:"
output=$($script_path 2 4 2>&1)
expected_output="最大公約数: 2"
if [ "$output" = "$expected_output" ]; then
    echo "正常に終了: $expected_output"
else
    echo "エラー: 正しい挙動のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 100 25 2>&1)
expected_output="最大公約数: 25"
if [ "$output" = "$expected_output" ]; then
    echo "正常に終了: $expected_output"
else
    echo "エラー: 正しい挙動のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 7 13 2>&1)
expected_output="最大公約数: 1"
if [ "$output" = "$expected_output" ]; then
    echo "正常に終了: $expected_output"
else
    echo "エラー: 正しい挙動のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 24 36 2>&1)
expected_output="最大公約数: 12"
if [ "$output" = "$expected_output" ]; then
    echo "正常に終了: $expected_output"
else
    echo "エラー: 正しい挙動のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

output=$($script_path 1000000000 2000000000 2>&1)
expected_output="最大公約数: 1000000000"
if [ "$output" = "$expected_output" ]; then
    echo "正常に終了: $expected_output"
else
    echo "エラー: 正しい挙動のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# エラーケースのテスト
echo "エラーケースのテスト:"
# 引数の数が少ない場合のテスト
output=$($script_path 2 2>&1)
expected_output="エラー: 2つの自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "引数の数が少ない場合のテストに成功しました。"
else
    echo "エラー: 引数の数が少ない場合のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 引数の数が多い場合のテスト
output=$($script_path 2 4 6 2>&1)
expected_output="エラー: 2つの自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "引数の数が多い場合のテストに成功しました。"
else
    echo "エラー: 引数の数が多い場合のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 負の数が指定された場合のテスト
output=$($script_path -2 4 2>&1)
expected_output="エラー: 自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "負の数が指定された場合のテストに成功しました。"
else
    echo "エラー: 負の数が指定された場合のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

# 小数が指定された場合のテスト
output=$($script_path 2.5 4 2>&1)
expected_output="エラー: 自然数を指定してください。"
if [ "$output" = "$expected_output" ]; then
    echo "小数が指定された場合のテストに成功しました。"
else
    echo "エラー: 小数が指定された場合のテストに失敗しました。"
    echo "期待される出力: $expected_output"
    echo "実際の出力: $output"
    exit 1
fi

