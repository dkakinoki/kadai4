#!/bin/bash

# シェルスクリプトのパス
script_path="./gcd.sh"

# 正しい挙動のテストケース
echo "正しい入力のテスト:"
$script_path 2 4 && echo "正常に終了: 最大公約数は2です。" || { echo "エラー: 正しい挙動のテストに失敗しました。"; exit 1; }
$script_path 100 25 && echo "正常に終了: 最大公約数は25です。" || { echo "エラー: 正しい挙動のテストに失敗しました。"; exit 1; }
$script_path 7 13 && echo "正常に終了: 最大公約数は1です。" || { echo "エラー: 正しい挙動のテストに失敗しました。"; exit 1; }
$script_path 24 36 && echo "正常に終了: 最大公約数は12です。" || { echo "エラー: 正しい挙動のテストに失敗しました。"; exit 1; }

# 引数の数が少ない場合のテスト
echo "引数の数が少ない場合のテスト:"
$script_path 2 && { echo "エラー: 自然数2つを指定してください。"; exit 1; }

# 引数の数が多い場合のテスト
echo "引数の数が多い場合のテスト:"
$script_path 2 4 6 && { echo "エラー: 自然数2つを指定してください。"; exit 1; }

# 負の数が指定された場合のテスト
echo "負の数が指定された場合のテスト:"
$script_path -2 4 && { echo "エラー: 自然数を指定してください。"; exit 1; }

# 小数が指定された場合のテスト
echo "小数が指定された場合のテスト:"
$script_path 2.5 4 && { echo "エラー: 自然数を指定してください。"; exit 1; }

# 大きな数値が指定された場合のテスト
echo "大きな数値が指定された場合のテスト:"
$script_path 1000000000 2000000000 && echo "正常に終了: 最大公約数は1000000000です。" || { echo "エラー: 正しい挙動のテストに失敗しました。"; exit 1; }

