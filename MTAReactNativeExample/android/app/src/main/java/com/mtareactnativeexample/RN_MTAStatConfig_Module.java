package com.mtareactnativeexample;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tencent.stat.StatConfig;

import java.util.HashMap;
import java.util.Map;

public class RN_MTAStatConfig_Module extends ReactContextBaseJavaModule {

    public RN_MTAStatConfig_Module(ReactApplicationContext reactContext) {
        super(reactContext);
    }


    @Override
    public String getName() {
        return "RN_MTAStatConfig_Module";
    }

    @Override
    public Map<String, Object> getConstants() {
        Map<String, Object> contants = new HashMap<>();


        return contants;
    }

    @ReactMethod
    public void setDebugEnable(boolean debugEnable) {
        StatConfig.setDebugEnable(debugEnable);
    }


}
