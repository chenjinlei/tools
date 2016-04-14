### Service shutdown, boot with specific service name
### This file intends to copy(scp) late service from user `zxjser`.
### Author: chenjinlei
### Date: 2015/12/22

### Version 3.0
### This script can deal with multiple services at a time.
### fix the bug that only one service can be accepted. 2016/02/23
### extra...you don't have to input password any more, thus can be applied to
### processing numbers of files without manual interference. 2016/03/28
if [ $# -lt 1 ]
then
	echo "Usage: \"$0 {service_name}+\". Services separated with spaces."
else
	passwd=zxjser
	for service in $@
	do
		tmshutdown -s $service;
		expect -c "
			spawn scp zxjser@192.168.60.109:~/zxj4ser/bin/$service ./
			expect {
					\"*password\" {set timeout 300; send \"$passwd\r\";}
					\"yes/no\" {send \"yes\r\"; exp_continue;}
			}
			expect eof";
		tmboot -s $service;
		###debug info
		echo ">>> $service transfer finished."
	done
fi	

### Version 2.0
### This script can deal with multiple services at a time.
### fix the bug that only one service can be accepted. 2016/02/23

#if [ $# -lt 1 ]
#then
#	echo "Usage: \"$0 {service_name}+\". Services separated with spaces."
#else
#	for service in $@
#	do
#		tmshutdown -s $service;scp zxjser@192.168.60.109:~/zxj4ser/bin/$service ./;tmboot -s $service;
#		###debug info
#		#echo "HELLO WORLD!"
#	done
#fi	

### Version 1.0
### This script can only accept one servcie at a time.
#if [ ! $1 ]
#then
#	echo "Usage: ./svrchg_zxj.sh service_name. (with at leaset one parameter)"
#else
#	tmshutdown -s $1;scp zxjser@192.168.60.109:~/zxj4ser/bin/$1 ./;tmboot -s $1;
#fi
