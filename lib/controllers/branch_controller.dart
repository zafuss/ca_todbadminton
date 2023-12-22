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

  void fetchBranches() async {
    isLoading(true);
    try {
      var branches = await RemoteService.fetchBranches();
      if (branches != []) branchList.value = branches;
    } finally {
      isLoading(false);
    }
  }
}
