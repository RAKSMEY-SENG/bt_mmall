import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeblocState extends Equatable{
  HomeblocState([List props = const []]) : super(props);
}

class HomeBlocStateLoading extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateLoading';
}

class HomeBlocAdded extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateAdded';
}

class HomeBlocRemoved extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateRemoved';
}