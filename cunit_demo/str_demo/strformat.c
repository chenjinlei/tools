/* strformat.c --- 
 * 
 * Filename: strformat.c
 * Description: 字符串操作
 * Author: magc
 * Maintainer: 
 * Created: 一  8月 20 22:56:36 2012 (+0800)
 */

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>
#include "strformat.h"


string add_str(string word1 ,string word2){
	return (strcat(word1, word2));
}

string to_Upper(string word){
	int i;
	for(i = 0;word[i] !='\0' ;i++){
		if(word[i]<'z' && word[i]>'a'){
			word[i] -= 32;
		}
	}
	return word;

}

int string_lenth(string word){
	int i;
	for(i = 0 ;word[i] != '\0';i++){

	}
	return i;
}
