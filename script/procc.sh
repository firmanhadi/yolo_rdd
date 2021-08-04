#awk 'FNR==NR{a[$1]=$2;next} ($1 in a) {print $1,a[$1],$3,$2}' outputyolo.txt outputlatlon.txt > resultmerged.txt

while getopts ":bt" o; do
    case "${o}" in
        b)
            python ./script/cut.py
            python ./script/color.py
            cd output
            mkdir bw
            cp *leveled.png ./bw/
            cd bw
            find . -name '*_leveled.png' -exec bash -c ' mv $0 ${0/\_cropped_leveled/}' {} \;
            for f in *.png;do tesseract -l eng "$f" "$(basename "$f" .png)";done
            for i in ./*leveled.txt; do echo $(cat $i); done > wew.txt
            ls *.png > file.txt
            sed 's/_leveled.png/.png/g' file.txt > filename.txt
            paste filename.txt wew.txt  > /content/yolo_rdd/tesseractresult.txt
            rm -rf /content/yolo_rdd/output/bw
            ;;
        t)
            python ./script/cuttop.py
            python ./script/color.py
            cd output
            mkdir bw
            cp *leveled.png ./bw/
            cd bw
            find . -name '*_leveled.png' -exec bash -c ' mv $0 ${0/\_cropped_leveled/}' {} \;
            for f in *.png;do tesseract -l eng "$f" "$(basename "$f" .png)";done
            for i in ./*leveled.txt; do echo $(cat $i); done > wew.txt
            ls *.png > file.txt
            sed 's/_leveled.png/.png/g' file.txt > filename.txt
            paste filename.txt wew.txt  > /content/yolo_rdd/tesseractresult.txt
            rm -rf /content/yolo_rdd/output/bw
            ;;
        *)
            echo 'wrong command, use -b for bottom and -t for top'
            ;;
    esac
done
