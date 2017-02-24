#include "TestJni.h"

JNIEXPORT void JNICALL Java_com_tiger_daily_pnative_TestJni_forTest
  (JNIEnv *env, jobject obj){
  printf("this is the first test jni");
  }
