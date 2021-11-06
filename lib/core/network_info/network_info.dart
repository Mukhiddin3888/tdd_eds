


import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;


}

class NetworkInfoImpl extends NetworkInfo{

  @override
  Future<bool> get isConnected async {

    bool result = await InternetConnectionChecker().hasConnection;

    return result;
  }

}