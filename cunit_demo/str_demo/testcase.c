/* testcase.c --- 
 * 
 * Filename: testcase.c
 * Description: 测试实例 
 * Author: magc
 * Maintainer: 
 * Created: 一  8月 20 23:08:53 2012 (+0800)
 */

/* Commentary:
 * 当前文件用来定义测试方法，suite，及registry信息，若测试方法有变化，只需要修改当前文件即可。
 * 第一步：书写测试函数的代码，建议以"test_"为前缀。
 * 第二步：将测试方法归类，即将相似功能的测试方法放到一个数组里，以便把它们指定给一个suite
 * 第三步：创建suite，可按功能或模块，生成多个test suite,
 * 第四步：书写测试方法的总调用方法，AddTests(),用来统一启动测试方法。
 */

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>

#include <CUnit/Basic.h>
#include <CUnit/Console.h>
#include <CUnit/CUnit.h>
#include <CUnit/TestDB.h>
#include "strformat.h"

void test_string_lenth(void){
	string test = "Hello";
	int len = string_lenth(test);
	CU_ASSERT_EQUAL(len,5);
}

void test_to_Upper(void){
	char test[] = "Hello";
	CU_ASSERT_STRING_EQUAL(to_Upper(test),"HELLO");

}

void test_add_str(void){
	char test1[] = "Hello!";
	char test2[] = "MGC";
	CU_ASSERT_STRING_EQUAL(add_str(test1,test2),"Hello!MGC");

}

// CU_TestInfo是Cunit内置的一个结构体，它包括测试方法及描述信息
CU_TestInfo testcase[] = {
	{"test_for_lenth:",test_string_lenth    },
	{"test_for_add:",test_add_str    },
	CU_TEST_INFO_NULL
};

CU_TestInfo testcase2[] = {
	{"test for Upper :",test_to_Upper    },
	CU_TEST_INFO_NULL
};

int suite_success_init(void){
	return 0;

}

int suite_success_clean(void){
	return 0;
}

//定义suite数组，包括多个suite，每个suite又会包括若干个测试方法。
CU_SuiteInfo suites[] = {
	{"testSuite1",suite_success_init,suite_success_clean,testcase},
	{"testsuite2",suite_success_init,suite_success_clean,testcase2},
	CU_SUITE_INFO_NULL
};

void AddTests(){
	assert(NULL != CU_get_registry());
	assert(!CU_is_test_running());

	if(CUE_SUCCESS != CU_register_suites(suites)){
		exit(EXIT_FAILURE);

	}
}

int RunTest() {
	if(CU_initialize_registry()){
		fprintf(stderr, " Initialization of Test Registry failed. ");
		exit(EXIT_FAILURE);
	}else{
		AddTests();
		/****  Automated Mode *****************
		  CU_set_output_filename("TestMax");
		  CU_list_tests_to_file();
		  CU_automated_run_tests();
		 ************************************/

		  CU_basic_set_mode(CU_BRM_VERBOSE);
		  CU_basic_run_tests();
		/***** Basice Mode *******************
		 ************************************/

		/*****Console Mode ********************
		  CU_console_run_tests();
		 ************************************/

		CU_cleanup_registry();

		return CU_get_error();

	}

}

int main(int argc, char * argv[])
{
	return  RunTest();

}
