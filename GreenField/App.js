/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 * @lint-ignore-every XPLATJSCOPYRIGHT1
 */

import React, { Component } from "react";
import {
  Platform,
  Alert,
  StyleSheet,
  Text,
  View,
  NativeModules,
  NativeEventEmitter
} from "react-native";

const { RNEventEmitter } = NativeModules;
const emitter = new NativeEventEmitter(RNEventEmitter);

type Props = { initialRoute: String };
export default class App extends Component<Props> {
  componentDidMount() {
    this.subscription = emitter.addListener(
      "PushNotification",
      notification => {
        alert(notification.message);
      }
    );
  }
  componentWillUnmount() {
    subscription.remove();
  }
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.header}>Welcome to the Greenfield!</Text>
        <Text style={styles.info}>Route: {this.props.initialRoute}</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center"
  },
  header: {
    fontSize: 30,
    textAlign: "center",
    marginBottom: 10
  },
  info: {
    textAlign: "center",
    color: "#333333",
    marginBottom: 5
  }
});
