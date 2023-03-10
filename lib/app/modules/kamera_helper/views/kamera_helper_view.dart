import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kamera_helper_controller.dart';

class KameraHelperView extends GetView<KameraHelperController> {
  const KameraHelperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KameraHelperView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KameraHelperView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
