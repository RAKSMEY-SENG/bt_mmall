import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CheckoutState extends Equatable{

  CheckoutState([List props = const[]]) : super(props);
}

class LoadingCheckoutState extends CheckoutState {

  @override
  String toString() {
    return 'LoadingCheckoutState';
  }
}

class ItemsLoadedState extends CheckoutState{
  Map<String, dynamic> itemCart = Map<String, dynamic>();

  ItemsLoadedState({this.itemCart}) : super([itemCart]);

  @override
  String toString() {
    // TODO: implement toString
    return 'ItemsLoadedState';
  }
}