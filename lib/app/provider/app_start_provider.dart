import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feature/auth/provider/auth_provider.dart';
import '../../feature/auth/state/auth_state.dart';
import '../../feature/home/provider/home_provider.dart';
import '../../feature/home/state/home_state.dart';
import '../../shared/repository/token_repository.dart';
import '../state/app_start_state.dart';

final appStartProvider =
    StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  final authState = ref.watch(authProvider);
  final homeState = ref.watch(homeProvider);

  late AppStartState appStartState;
  appStartState = authState is AuthError
      ? const AppStartState.unauthenticated()
      : const AppStartState.initial();

  return AppStartNotifier(
    appStartState,
    ref,
    authState,
    homeState,
  );
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
    super.appStartState,
    this._reader,
    this._authState,
    this._homeState,
  ) {
    _init();
  }

  late final TokenRepository _tokenRepository =
      _reader.read(tokenRepositoryProvider);
  final Ref _reader;
  final AuthState _authState;
  final HomeState _homeState;

  Future<void> _init() async {
    _authState.maybeWhen(
      loggedIn: (userInfo) => state = AppStartState.authenticated(userInfo),
      orElse: () {
        if (state == const AppStartState.unauthenticated()) {
          return;
        }
      },
    );

    _homeState.maybeWhen(
      loggedOut: () => state = const AppStartState.unauthenticated(),
      orElse: () {},
    );

    final token = await _tokenRepository.fetchToken();
    final userInfo = await _tokenRepository.fetchUser();

    if (token != null && userInfo != null) {
      if (mounted) {
        state = AppStartState.authenticated(userInfo);
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
