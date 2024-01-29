import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  var isLoading = true.obs;
  var branchList = <Branch>[].obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    await fetchBranches();
    super.onInit();
  }

  Future<void> fetchBranches() async {
    isLoading(true);
    try {
      branchList.value = await RemoteService.fetchBranches();
      // print(branches);
      if (branchList != []) isLoading(false);
    } catch (e) {
      Get.snackbar('Fetch Branches failed!', e.toString());
    }
  }
}
