import 'package:pey/src/app.dart';
import 'package:pey/src/features/new_screen.dart';

typedef VoidCallback = void Function();

class RegistrationNotifier {
  static RegistrationNotifier? _instance;

  factory RegistrationNotifier() {
    _instance ??= RegistrationNotifier._();
    return _instance!;
  }

  RegistrationNotifier._();

  final List<VoidCallback> _listeners = [];

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (final listener in List.from(_listeners)) {
      listener();
    }
  }

  //! declare variables
  int _page = 1;
  String _firstName = '';
  String _lastName = '';
  String _dob = '';
  String _userName = '';
  bool _isRegistrationLoading = false;
  String _email = '';
  String _password = '';
  String _cpassword = '';

  //! getters
  int get page => _page;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get dob => _dob;
  String get username => _userName;
  bool get isRegistrationLoading => _isRegistrationLoading;
  String get email => _email;
  String get password => _password;
  String get cpassword => _cpassword;

  //! setters
  void setPage(int newPage) {
    _page = newPage;
    notifyListeners();
  }

  void setFirstName(String newFirstName) {
    _firstName = newFirstName;
    notifyListeners();
  }

  void setLastName(String newLastName) {
    _lastName = newLastName;
    notifyListeners();
  }

  void setDob(String newDob) {
    _dob = newDob;
    notifyListeners();
  }

  void setUsername(String newUsername) {
    _userName = newUsername;
    notifyListeners();
  }

  void startLoading() {
    _isRegistrationLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    _isRegistrationLoading = false;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void setcPassword(String newcPassword) {
    _cpassword = newcPassword;
    notifyListeners();
  }

  Future<void> navigateToNewScreen() async {
    if (password != cpassword) {
      return;
    }
    startLoading();
    //! perform API call to register user
    await Future.delayed(const Duration(milliseconds: 3000));

    stopLoading();
    PeyApp.PeyNav.currentState?.pushNamed(NewScreen.route);
  }
}
