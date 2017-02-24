package com.tiger.daily.pnative;

/**
 * author: Tiger.zhang
 * date:   17-2-23.
 */
public class TestJni {
    static {
        System.loadLibrary("TestJni");
    }

    public native void forTest();

    public static void main(String[] args) {
        System.out.println(System.getProperty("java.library.path"));
        new TestJni().forTest();
        new TestTwo().PrintTestTwo();
    }
}
