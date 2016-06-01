/* strformat.h --- 
 * 
 * Filename: strformat.h
 * Description: 字符串操作头文件
 * Author: magc
 * Created: 一  8月 20 22:57:19 2012 (+0800)
 */


#ifndef _strformat_h
#define _strformat_h

typedef char * string;

int string_lenth(string word);
string to_Upper(string word);
string add_str(string word1 ,string word2);

#endif
