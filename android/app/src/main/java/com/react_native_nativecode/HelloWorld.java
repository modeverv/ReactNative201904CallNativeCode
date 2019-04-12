package com.react_native_nativecode;

import android.widget.Toast;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

public class HelloWorld extends ReactContextBaseJavaModule {

    private static final String DURATION_SHORT_KEY = "SHORT";
    private static final String DURATION_LONG_KEY = "LONG";

    public HelloWorld(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "HelloWorld";
    }

    @ReactMethod
    public void say() {
        Toast.makeText(getReactApplicationContext(), "HelloWorld", Toast.LENGTH_LONG).show();
    }
}

