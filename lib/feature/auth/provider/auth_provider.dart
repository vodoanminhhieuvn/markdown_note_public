import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';
import '../state/auth_state.dart';

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider(ref);
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(this._reader) : super(const AuthState.initial());

  final Ref _reader;
  late final AuthRepository _authRepository =
      _reader.read(authRepositoryProvider);

  Future<void> login(String email, String password) async {
    state = await _authRepository.login(email, password);
  }

  Future<void> register(String name, String email, String password) async {
    state = await _authRepository.signUp(name, email, password);
  }
}
