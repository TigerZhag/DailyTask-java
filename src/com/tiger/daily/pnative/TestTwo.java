package com.tiger.daily.pnative;

/**
 * author: Tiger.zhang
 * date:   17-2-23.
 */
public class TestTwo {
    static {
        System.loadLibrary("testtwo");
    }

    public native void PrintTestTwo();
}
