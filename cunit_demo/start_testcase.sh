# this script is used for debug or run a unit test based on CUnit.
# you can revise the variables blow to change the default behavior.

# usage 
# $: unittest {-b} 
# if -b is identified, the script will only do the build work . By default, it will not be identified.

#if you donot want the process to be printed on shell, use 'set +x'
set +x

################################
# declaration of variables
################################
# current location
CURRENT_DIR=`pwd`

# directiorys installing CUnit, which is indicated by '--prefix' when using './configure ...' to install CUnit
CUNIT_ROOT_DIRS=/usr/local/Cellar/cunit/2.1-3/

# directions for CUnit include files
CUNIT_INCLUDE_FILES_DIR=$CUNIT_ROOT_DIRS/include 

# directions for CUnit lib files
CUNIT_LIB_FILES_DIR=$CUNIT_ROOT_DIRS/lib 

# extra include files
# should be like '-I/path/name -I/path/name2'
INCLUDE_FILES_DIR=
#extra lib files
# should be like '-L/path/name -L/path/name2'
LIB_FILES_DIR=

######################################
# check parameters
######################################
NEED_RUN=1

while getopts 'b' OPT; do
	case $OPT in
		b)
			NEED_RUN=0;;

		?)
			echo "Unknown parameters"
	esac
done

##################################
# find all the .h and .c, which will later join the building process 
##################################
gcc  -o test  -I$CUNIT_INCLUDE_FILES_DIR $INCLUDE_FILES_DIR  -L$CUNIT_LIB_FILES_DIR $LIB_FILES_DIR -lcunit `ls *\.c` 

###################################
# if gvim has been closed, restore the old vimrc
###################################
if [ "$NEED_RUN" -eq "1" ]; then
	export LD_LIBRARY_PATH=$CUNIT_ROOT_DIRS/lib
	./test
fi
