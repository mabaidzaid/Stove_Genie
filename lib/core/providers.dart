import 'package:flutter/material.dart'; // ✅ needed for Widget
import 'package:provider/provider.dart';

MultiProvider initProviders({required Widget child}) {
  return MultiProvider(
    providers: [
      // ChangeNotifierProvider(create: (_) => CheckBoxProvider()),
      // ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      // ChangeNotifierProvider(create: (_) => CategoryProvider()),
    ],
    child: child,
  );
}
