import 'package:ar_avengers/avengerCharacters.dart';
import 'package:flutter/material.dart';

void main() {
  /// ensure that the binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AvengersCharacters(),
    );
  }
}
