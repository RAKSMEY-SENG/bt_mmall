import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:btmmall/models/storeData.dart';
import './bloc.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  StoreData _storeData = StoreData();
  @override
  CheckoutState get initialState => LoadingCheckoutState();

  @override
  Stream<CheckoutState> mapEventToState(CheckoutEvent event,) async* {

    if(event is LoadItemsEvent)
      {
        yield* _mapLoadEventToState(event);
      }
  }

  Stream<CheckoutState> _mapLoadEventToState(event) async*{
    yield LoadingCheckoutState();
//    Load all the items from the StoreData class and place it in the Map

  Map<String, dynamic> items = _storeData.retrieveItemCartDetails();
  Map<String, dynamic> cartItems = Map<String, dynamic>();
  items.forEach((k,v)=>cartItems[k]=v);
  yield ItemsLoadedState(itemCart:cartItems);
  }
}
