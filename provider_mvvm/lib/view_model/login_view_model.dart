import 'package:flutter/material.dart';
import 'package:provider_mvvm/repository/login_repo.dart';
import 'package:provider_mvvm/utils/routs/routs_name.dart';
import 'package:provider_mvvm/utils/utils.dart';

class LoginViewModel extends ChangeNotifier {
  LoginRepository loginRepository = LoginRepository();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    loginRepository.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutsName.home);
      Utils.showFlushbar(context, 'loginSucess', value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showToast(error.toString());
    });
  }
}
