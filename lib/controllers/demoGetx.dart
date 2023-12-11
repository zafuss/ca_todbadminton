import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    home: Demo(),
  ));
}

class TestGetx extends GetxController {
  var demoText = 'aaaaaaaaaaaaaaaaa'.obs;

  void updateText(Branch branch) {
    demoText.value = branch.branchName.obs.value;
  }
}

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestGetx());
    return Scaffold(
      body: Center(
        child: Column(children: [
          Obx(() => Text(
                controller.demoText.value,
                style: TextStyle(color: Colors.red),
              )),
          ElevatedButton(
              onPressed: () {
                controller.updateText(Branch.branches.first);
              },
              child: Text('Update'))
        ]),
      ),
    );
  }
}
