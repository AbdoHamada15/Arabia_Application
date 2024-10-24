import 'package:arabia_applicaltion/core/utils/app_color.dart'; // استبدل بالمسار الصحيح
import 'package:arabia_applicaltion/views/motor/owner_information.dart';
import 'package:arabia_applicaltion/views/motor/vehicle_info.dart';

import 'category.dart';

class CategoryData {
  static final List<Category> categories = [
    const Category(
      name: "Motor",
      image: "assets/motor.png",
      backgroundColor: kcategoryColor,
      title: "Third Party Liability",
      route: OwnerInformation(),
    ),
    const Category(
      name: "Motor",
      image: "assets/motor.png",
      backgroundColor: kcategoryColor,
      title: "Comprehensive",
      route: VehicleInfo(),
    ),
    const Category(
      name: "Medical",
      image: "assets/medical.png",
      backgroundColor: kcategoryColor2,
      title: "SME",
    ),
    const Category(
      name: "Medical",
      image: "assets/medical.png",
      backgroundColor: kcategoryColor2,
      title: "Visa Extension ",
    ),
  ];
}
