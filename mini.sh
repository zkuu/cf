sed -i '1d' result.csv && sed -i '51,5000d' result.csv && cut -d, --complement -f2,3,4,5 result.csv > temp.csv && mv temp.csv result.csv && cp -f result.csv /sdcard/name.txt
