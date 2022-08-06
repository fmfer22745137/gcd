## Utils

##
# パラメータ：
#　1：テスト項目名
#　2：期待される結果
#　3：実際の結果
#　4：期待される終了戻り値
#　4：実際の終了戻り値
##
function assert {
  echo -n "$1: " 
  if [[ "$2" == "$3" ]]; then
    echo -n "$3 [OK]"
  else
    echo -e "NG!\n > Expected: [$2]\n >   Actual: [$3]"
    exit 1
  fi

  echo -n " [ExitCode $5: "
  if [[ $5 -eq $4 ]]; then
    echo "OK]"
  else
    echo -e "NG!]\n > Expected: $4\n >   Actual: $5"
    exit 1
  fi
}

## Test

############################################################
echo -e "\n# Math test\n"

test_case_list=(
'0,0,1'
'100,0,1'
'0,100,1'
'2,4,2'
'15,10,5'
'100,10,10'
'100,26,2'
'100,25,25'
'100,30,10'
'1024,768,256'
'65535,8092,17'
)

for test_case in ${test_case_list[@]}; do
  a=$(echo $test_case | cut -f1 -d,)
  b=$(echo $test_case | cut -f2 -d,)
  expected=$(echo $test_case | cut -f3 -d,)
  actual=$(./gcd.sh $a $b)
  assert "Tested $a $b" "$expected" "$actual" 0 $?
done

############################################################
echo -e "\n# Error test\n"

test_case_list=(
'-2,4'
'2,-4'
'-2,-4'
'0.0,0'
'100,0.0'
'0,2.5'
'-10.0,26'
'1.5,-10'
'-2,-4.1'
'xxx,yyy'
'1,a'
'b,2'
)

for test_case in ${test_case_list[@]}; do
  a=$(echo $test_case | cut -f1 -d,)
  b=$(echo $test_case | cut -f2 -d,)
  expected="Parameters must be two natural numbers"
  actual=$(./gcd.sh $a $b)
  assert "Tested $a $b" "$expected" "$actual" 1 $?
done

expected="Wrong parameter count. Use: gcd.sh <integer> <integer>"
actual=$(./gcd.sh 3)
assert "One arg" "$expected" "$actual" 1 $?

# expected same as above
actual=$(./gcd.sh 3 3 3)
assert "Three args" "$expected" "$actual" 1 $?
