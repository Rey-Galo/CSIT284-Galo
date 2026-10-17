import 'package:flutter/material.dart';
import 'package:meals/theme/midnight_kitchen.dart';
import 'package:meals/screens/tabs.dart';
import 'package:device_frame/device_frame.dart';

final theme = buildMidnightKitchenTheme();

void main() {
  runApp(const App());
}

class PhonePreview extends StatelessWidget {
  const PhonePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 29, 30, 31),
        body: Center(
          child: DeviceFrame(
            device: Devices.ios.iPhone15Pro,
            isFrameVisible: true,
            orientation: Orientation.portrait,
            screen: const App(),
          ),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
