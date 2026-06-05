import 'package:flutter/material.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Place Order")),
          SizedBox(height: 20),
          TextField(),
          SizedBox(height: 20),
          TextField(),
        ],
      ),
    );
  }
}
