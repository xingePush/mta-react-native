package com.mtareactnativeexample;

import com.facebook.react.ReactNativeHost;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.tencent.stat.StatService;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class RN_MTAStatService_Module extends ReactContextBaseJavaModule {

    public RN_MTAStatService_Module(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RN_MTAStatService_Module";
    }

    @Override
    public Map<String, Object> getConstants() {
        Map<String, Object> contants = new HashMap<>();


        return contants;
    }

    @ReactMethod
    public void registerActivityLifecycleCallbacks() {
        StatService.registerActivityLifecycleCallbacks(getCurrentActivity().getApplication());
    }

}
