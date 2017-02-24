#include "TestTwo.h"

JNIEXPORT void JNICALL Java_com_tiger_daily_pnative_TestTwo_PrintTestTwo
  (JNIEnv *env, jobject obj){
  printf("this is test two jni");
  }