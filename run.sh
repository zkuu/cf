sed -i '1d' result.csv
cut -d, --complement -f2,3,4,5 result.csv > temp.csv && mv temp.csv result.csv
cp -f result.csv ips-v4.txt
cp -f result.csv ips-v6.txt
./cfnat -colo 
