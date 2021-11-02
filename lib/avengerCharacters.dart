import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class AvengersCharacters extends StatefulWidget {
  @override
  _AvengersCharactersState createState() => _AvengersCharactersState();
}

class _AvengersCharactersState extends State<AvengersCharacters> {
  ArCoreController arCoreController = ArCoreController(id: 0);

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    arCoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("AR Avengers"),
      //   centerTitle: true,
      // ),
      body: ArCoreView(
        onArCoreViewCreated: whenArCoreViewCreated,
        enableTapRecognizer: true,
      ),
    );
  }

  void whenArCoreViewCreated(ArCoreController arCoreController) {
    arCoreController = arCoreController;
    arCoreController.onPlaneTap = contolOnPlaneTap;
  }

  void contolOnPlaneTap(List<ArCoreHitTestResult> hitsResults) {
    final hit = hitsResults.first;

    ///adding characters
    print("blAAAA\n.\n.\n.\n.");
    addCharacters(hit);
  }

  Future addCharacters(ArCoreHitTestResult hit) async {
    print("inside");
    final bytes =
        (await rootBundle.load("assets/ironman.png")).buffer.asUint8List();
    final bytes1 =
        (await rootBundle.load("assets/powerarm.png")).buffer.asUint8List();
    print(bytes);
    final ArCoreNode characterPos = ArCoreNode(
      image: ArCoreImage(bytes: bytes, width: 100, height: 100),
      position: hit.pose.translation + vector.Vector3(0.0, 0.0, 0.0),
      rotation: hit.pose.rotation + vector.Vector4(0.0, 0.0, 0.0, 0.0),
    );
    print("......");
    print(characterPos.image!.width.toString());
    arCoreController.addArCoreNodeWithAnchor(characterPos, parentNodeName: "");
  }
}
