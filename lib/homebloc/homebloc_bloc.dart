import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:btmmall/models/storeData.dart';
import 'package:flutter/material.dart';

import 'homebloc_event.dart';
import 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {

  StoreData _storeData = StoreData();
  @override
  HomeblocState get initialState => HomeBlocStateLoading();

  @override
  Stream<HomeblocState> mapEventToState(
    HomeblocEvent event,
  ) async* {

    if(event is HomeBlocAddEvent)
      {
        yield* _mapAddEventToAddState(event);
      }
    else if(event is HomeBlocRemoveEvent)
      {
        yield*_mapRemoveEventToRemoveState(event);
      }
    else
      {
        yield HomeBlocStateLoading();
      }

  }

  Stream<HomeblocState> _mapRemoveEventToRemoveState(event)
  async* {
    yield HomeBlocStateLoading();

//    Logic to remove the addCartModel
    _storeData.removeItemCartDetails(event.addCartModel);
    yield HomeBlocRemoved();
  }

  Stream<HomeblocState> _mapAddEventToAddState(event)
  async*{
    yield HomeBlocStateLoading();
    print("Add Event");
    //    Logic to save the addCartModel
    _storeData.storeItemCartDetails(event.addCartModel.name, event.addCartModel.price, event.addCartModel.image);

    yield HomeBlocAdded();
  }
}
