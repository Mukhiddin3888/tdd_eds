


import 'failure.dart';

String mapFailureToMessage(Failure failure){
  switch (failure.runtimeType){
    case ServerFailure:
      return 'Server Failure';

    case CacheFailure:
      return "Cache Failure";

    default:
      return "UnExpected Error";
  }
}