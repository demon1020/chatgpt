import 'package:chatgpt/core.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', user.data!.userId.toString());
    notifyListeners();
    return true;
  }

  Future<bool> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');

    return (userId == null || userId == "") ? false : true;
  }

  Future<bool> remove() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    return true;
  }

  void checkAuthentication() async {
    getUser().then((value) async {
      if (kDebugMode) {
        print(value.toString());
      }

      if (!value) {
        Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.login);
      } else {
        Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.login);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
