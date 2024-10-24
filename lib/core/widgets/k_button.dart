import '../utils/app_color.dart';
import '../utils/app_style.dart';
import 'k_button_custom.dart';

class KButton extends KButtonCustom {
  const KButton({
    super.key,
    required super.text,
    required super.onTap,
    super.width = double.infinity,
    super.textStyle = styleButton,
    super.height = 45,
    super.color = kbuttonColor,
  });
}
