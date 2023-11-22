import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String barcode = "";
  @override
  void initState() {
    super.initState();
  }

  void initializeBarcode() async {
    var result = await BarcodeScanner.scan();
    barcode = result.rawContent;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Barcode: $barcode"),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: initializeBarcode, child: const Text("Scan"))
        ],
      ),
    );
  }
}
