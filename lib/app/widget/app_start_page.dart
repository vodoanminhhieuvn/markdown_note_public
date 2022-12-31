import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feature/auth/view/sign_in_view.dart';
import '../../feature/home/view/home_view.dart';
import '../../shared/widget/connection_unvailable_widget.dart';
import '../../shared/widget/loading_widget.dart';
import '../provider/app_start_provider.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.when(
      initial: () => const LoadingWidget(),
      unauthenticated: SignInView.new,
      authenticated: (userInfo) => HomePage(
        userInfo: userInfo,
      ),
      internetUnavailable: Container.new,
    );
  }
}
