/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View, Alert,Button} from 'react-native';

import {NativeModules} from 'react-native';

import RN_MTAStatConfig_Module from './RN_MTAStatConfig_Module'
import RN_MTAStatService_Module from './RN_MTAStatService_Module'

if (Platform.OS === "ios") {
  var mtaModule = NativeModules.MTAModule;
  mtaModule.startWithAppkey("I2E3KXDU1E2W");
  var mtaErrorCode = mtaModule.trackError("testerror", "I2E3KXDU1E2W", true, (code) => {
    Alert.alert("trackError API: " + code);
  });
}

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
  android:
    'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});

type Props = {};
export default class App extends Component<Props> {
  render() {
    return (
        <View style={styles.container}>
            <Text style={styles.welcome}>[MTA]Android React Native示例</Text>
            <Text style={styles.instructions}>step1.对应原生MTAStatConfig类相关的调用</Text>
            <Button
                onPress={() => {

                    //开启调试日志
                    RN_MTAStatConfig_Module.setDebugEnable(true);

                    Alert.alert('初始化配置完毕');


                }}
                title="初始化配置"
            />
            <Text style={styles.instructions}>step2.对应原生MTAStatService类相关的调用</Text>
            <Button
                onPress={() => {

                    //启动MTA
                    RN_MTAStatService_Module.registerActivityLifecycleCallbacks();


                    Alert.alert('启动MTA完毕，请通过Logcat查看相关日志');
                }}
                title="启动MTA"
            />
            {/*<Text style={styles.instructions}>{instructions}</Text>*/}
        </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});
