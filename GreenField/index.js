/**
 * @format
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import { NativeEventEmitter, NativeModules, AppRegistry } from "react-native";
import App from "./App";
import { name as appName } from "./app.json";
const { RNEventEmitter } = NativeModules;
const emitter = new NativeEventEmitter(RNEventEmitter);

const subscription = emitter.addListener("PushNotification", notification => {
  console.log(notification);
  alert(notification.string);
});
// Don't forget to unsubscribe, typically in componentWillUnmount
// subscription.remove();

AppRegistry.registerComponent(appName, () => App);
