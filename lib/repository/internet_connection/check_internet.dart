import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnection {
  const InternetConnection();

  Future<bool> checkInternet() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();

    if( result == ConnectivityResult.none){
      return false;
    }
    return true;
  }
}
