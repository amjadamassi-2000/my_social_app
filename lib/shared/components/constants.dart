import 'package:my_social_app/modules/LoginScreen/login_screen.dart';
import 'package:my_social_app/shared/Network/local/sharedPreferences.dart';
import 'components.dart';



String token = '';
var uId;
void signOut(context) {
  CacheHelper.removeData(
    key: 'uId',
  ).then((value) {
    if (value) {
      navigateAndFinsh(
        context,
        LoginScreen(),
      );
    }
  });
}
