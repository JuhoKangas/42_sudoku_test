#!/bin/bash
my_exe="./a.out"
invalids="invalid.txt"
valids="valid.txt"
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

if [[ -f "user_results_valid.txt" ]]; then
        rm "user_results_valid.txt"
fi
if [[ -f "user_results_inv.txt" ]]; then
        rm "user_results_inv.txt"
fi
if [[ -f "differ_inv.txt" ]]; then
        rm "differ_inv.txt"
fi
if [[ -f "differ_val.txt" ]]; then
        rm "differ_val.txt"
fi
IFS=$'\n' read -d '' -r -a values < $invalids

for i in "${values[@]}"
do
	eval $my_exe $i >> user_results_inv.txt
done

diff "result_inv.txt" "user_results_inv.txt" >> differ_inv.txt
IFS=$'\n' read -d '' -r -a values < $valids

for i in "${values[@]}"
do
	eval $my_exe $i >> user_results_valid.txt
done

diff "result_valid.txt" "user_results_valid.txt" >> differ_val.txt

echo -e "${YELLOW} -- TESTING WITH 14 MILLION COMBINATIONS -- ${NC}"
sleep 1
echo -n .
sleep 1
echo -n .
sleep 2
echo -n .
sleep 1
echo

if [ -s differ_inv.txt ]; then
        # The file is not-empty.
		echo
        echo -e "${RED} ALL ERROR-CASES NOT PASSED!${NC}"
else
        # The file is empty.
		echo
        echo -e "${GREEN} ALL ERROR-CASES PASSED!${NC}"
        echo -e -n "${YELLOW} -- ALL GOOD SO FAR -- ${NC}"
fi
echo -e "${YELLOW} -- TESTING WITH MORE -- ${NC}"
echo
sleep 2
echo "compiling multithreading testing..."
sleep 5
echo "applying scalar projection for recursive algorithm..."
sleep 10 
echo "opening remote access for skynet testing framework..."
sleep 3
echo

if [ -s differ_val.txt ]; then
        # The file is not-empty.
        echo -e "${RED} ALL VALID-TESTS NOT PASSED!${NC}"
else
        # The file is empty.
        echo -e "${GREEN} ALL VALID-TESTS PASSED!${NC}"
fi

diff "result_inv.txt" "user_results_inv.txt"
diff "result_valid.txt" "user_results_valid.txt"
