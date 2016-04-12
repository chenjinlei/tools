### Service shutdown, boot with specific service name
### This file intends to copy(scp) late service from user `zxjser`.
### Author: chenjinlei
### Date: 2015/12/22

### Version 2.0
### This script can deal with multiple services at a time.

if [ $# -lt 1 ]
then
	echo "Usage: \"$0 {service_name}+\". Services separated with spaces."
else
	for service in $@
	do
		tmshutdown -s $1;scp zxjser@192.168.60.109:~/zxj4ser/bin/$1 ./;tmboot -s $1;
		###debug info
		#echo "HELLO WORLD!"
	done
fi	

### Version 1.0
### This script can only accept one servcie at a time.
#if [ ! $1 ]
#then
#	echo "Usage: ./svrchg_zxj.sh service_name. (with at leaset one parameter)"
#else
#	tmshutdown -s $1;scp zxjser@192.168.60.109:~/zxj4ser/bin/$1 ./;tmboot -s $1;
#fi
