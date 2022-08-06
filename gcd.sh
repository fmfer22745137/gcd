#!/bin/bash
#

##
# 課題4　最大公約数　シェルスクリプト
# 名前：FABIAN　MARCELO FERNANDEZ　
# 学修番号：22745137
##

# Param check

if [[ $# != 2 ]]; then
  echo "Wrong parameter count. Use: gcd.sh <integer> <integer>"
  exit 1
fi

if [[ -z "$(echo $1 $2 | grep -P '^[0-9]+ [0-9]+$')" ]]; then
  echo "Parameters must be two natural numbers"
  exit 1
fi

# Math

# パラメータを絶対値に変換
a=$(( $1 < 0 ? -($1) : $1 ))
b=$(( $2 < 0 ? -($2) : $2 ))

# aとbから一番小さいものを選ぶ
smaller=$(( a < b ? a : b ))

if [[ $smaller -eq 0 ]]; then
  gcd=0 # どちらかが0だった場合、GCD=1
else
  # aとbを一番小さい数字で割る（i）
  # あまりがあれば、さらに小さくし、また割ってみる
  # あまりが無ければ、GCDとする。
  for i in $(seq 1 $smaller | sort -n -r); do
    mods=$(( (a % i) + (b % i) )) # aとbをiで割って、あまりの合計を求める
    if [[ mods -eq 0 ]]; then # あまりの合計が0というのは、両方のあまりが0ということ
      gcd=$i # 降順に割っていくため、ここであまりが0だったら、これは最大公約数である
      break
    fi
  done
fi

echo $gcd
