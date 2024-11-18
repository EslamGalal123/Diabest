
import 'package:diiabest/core/Database/cache/cache_helper.dart';
import 'package:diiabest/core/services/service_locator.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}