import 'package:chatgpt/core.dart';

class LoginViewModel with ChangeNotifier {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _myRepo = AuthRepository();

  bool loading = false;

  setLoading(isLoading){
    loading = isLoading;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data) async {
    setLoading(true);

    var response = await _myRepo.login(data);

    response.fold((failure) => Utils.flushBarErrorMessage(failure.message),
        (loginResponse) async {
      final userPreference = Provider.of<UserViewModel>(
          navigatorKey.currentContext!,
          listen: false);
      userPreference.saveUser(loginResponse);

      Utils.snackBar('${loginResponse.message}');
      Navigator.pushNamed(navigatorKey.currentContext!, RoutesName.home);
    });
    setLoading(false);
    notifyListeners();
  }

  void disposeData(){
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
