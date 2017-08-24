tput setaf 1;
echo "------------\n (1/3) building\n---------------"
npm run build
tput setaf 1;
#echo "------------\n (2/3) uploading to dschool computer\n---------------"
#tput setaf 7;
#scp -r ~/projects/dschoolcourses/dist/* design@140.112.179.89:~/dschoolcourses
#tput setaf 1;
echo "------------\n (3/3) uploading to http://dschool.ntu.edu.tw/2017/\n---------------"
#tput setaf 7;
#ssh design@140.112.179.89 "scp -P 20022 -r ~/dschoolcourses dsadmin@dschool.ntu.edu.tw:/var/www/html/2017"
#tput setaf 1;

scp -r ./dist/* dschool:/var/www/html/2017/zashare
#/var/www/html/2017
echo "deploy complete"

#ssh design@140.112.179.89
#scp -r ~/projects/dschoolcourses/dist/* root@monoame.com:/var/www/dschooldemo
