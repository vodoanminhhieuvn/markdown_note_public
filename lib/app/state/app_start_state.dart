import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/model/model.dart';

part 'app_start_state.freezed.dart';

@freezed
class AppStartState with _$AppStartState {
  const factory AppStartState.initial() = _Initial;
  const factory AppStartState.unauthenticated() = _Unauthenticated;
  const factory AppStartState.internetUnavailable() = _InternetUnavailable;
  const factory AppStartState.authenticated(UserModel userInfo) =
      AppAuthenticated;
}
