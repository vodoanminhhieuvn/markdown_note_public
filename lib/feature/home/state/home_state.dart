import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/model/model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loggedOut() = _LoggedOut;
}
