import 'package:get/get.dart';

import 'language/ban.dart';
import 'language/eng.dart';

class Languages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
