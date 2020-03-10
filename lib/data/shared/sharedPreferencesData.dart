import 'package:shared_preferences/shared_preferences.dart';
import 'package:sound/views/Worker/chooseWorker.dart';

Future<bool> chkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('counter') == null){
      prefs.setInt('counter', 0);
      return false;
    } else {
      if (prefs.getInt('counter') > 0) {
        return true;
      } else {
        return false;
      }
    }
}

void setPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('counter', 1);
}