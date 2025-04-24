import 'package:get/get.dart';

class BenefitsController extends GetxController {
  // ROI Calculator reactive variables
  var storeSize = 0.0.obs;
  var dailyCustomers = 0.0.obs;
  var checkoutLanes = 0.0.obs;
  var avgTransactionValue = 0.0.obs;

  // Update methods
  void updateStoreSize(double value) => storeSize.value = value;
  void updateDailyCustomers(double value) => dailyCustomers.value = value;
  void updateCheckoutLanes(double value) => checkoutLanes.value = value;
  void updateAvgTransactionValue(double value) => avgTransactionValue.value = value;

  void calculateROI() {
    // Add your ROI logic here
    print("ROI Calculated!");
  }
}
