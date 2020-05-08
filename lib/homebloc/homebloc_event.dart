import 'package:btmmall/models/addproduct_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeblocEvent extends Equatable{
  HomeblocEvent([List props = const []]) : super(props);
}

class HomeBlocLoadEvent extends HomeblocEvent{

  HomeBlocLoadEvent([List props = const[]]) : super(props);

  @override
  String toString() {
    // TODO: implement toString
    return 'HomeBlocLoadEvent';
  }
}

class HomeBlocAddEvent extends HomeblocEvent {

  final AddCartModel addCartModel;

  HomeBlocAddEvent(this.addCartModel) : super([addCartModel]);

  @override
  String toString() => 'HomeBlocAddEvent{addCartModel: $addCartModel}';

}

class HomeBlocRemoveEvent extends HomeblocEvent {

  final String addCartModel;

  HomeBlocRemoveEvent(this.addCartModel): super([addCartModel]);

  @override
  String toString() => 'HomeBlocRemoveEvent {addCartModel: $addCartModel}';

}