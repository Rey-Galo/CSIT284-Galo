import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals2/screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: PhonePreview()));
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
            device: Devices.ios.iPhone16Pro,
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
