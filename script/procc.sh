python cut.py
python color.py
cd selected
mkdir bw
cp *leveled.png ./bw/
cd bw
find . -name '*_leveled.png' -exec bash -c ' mv $0 ${0/\_cropped_leveled/}' {} \;
for f in *.png;do tesseract -l eng "$f" "$(basename "$f" .png)";done
#for i in ./*.txt; do echo $(cat $i); done > wew.txt
#ls ./*.png > filename.txt
#paste filename.txt wew.txt filename.txt > fin.txt
#awk 'FNR==NR{a[$1]=$2;next} ($1 in a) {print $1,a[$1],$3,$2}' outputyolo.txt outputlatlon.txt > resultmerged.txt
