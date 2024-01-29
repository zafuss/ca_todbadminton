import 'package:ca_todbadminton/models/branch_model.dart';
import 'package:ca_todbadminton/services/remote_services.dart';
import 'package:get/get.dart';

class BranchController extends GetxController {
  var isLoading = true.obs;
  var branchList = <Branch>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchBranches();
    super.onInit();
  }

  Future<void> fetchBranches() async {
    isLoading(true);
    try {
      branchList.value = await RemoteService.fetchBranches();
      isLoading(false);
      // print(branches);
      // if (branches != []) branchList.value = branches;
    } catch (e) {
      Get.snackbar('Fetch Branches failed!', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
