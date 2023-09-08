import 'package:get/get.dart';
import 'package:pfr/data/session_data_provider.dart';
import 'package:pfr/routes/app_routes.dart';

class CheckAuthController extends GetxController {
  @override
  Future<void> onInit() async {
    final uid = await SessionDataProvider().getSessionId();

    if (uid == null) {
      Get.offAllNamed(Routes.auth);
    } else {
      Get.offAllNamed(Routes.dashboard);
    }

    super.onInit();
  }
}
