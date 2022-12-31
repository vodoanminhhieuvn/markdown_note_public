import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../gen/assets.gen.dart';
import '../../../shared/base/base_page.dart';
import '../../../shared/util/hex_to_color.dart';
import '../provider/auth_provider.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  SignInViewState createState() => SignInViewState();
}

class SignInViewState extends BasePage<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#404258'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 140),
            Assets.icons.icons8Bookmark.svg(color: Colors.white),
            Text(
              'MARKDOWN NOTE',
              style: typoTheme.s20w700style(color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.all(60),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: translate.email_hint,
                      ),
                      controller: _emailController,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: translate.password_hint,
                      ),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        _widgetError(context),
                        const SizedBox(height: 20),
                        _widgetSignInButton(context),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetSignInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final email = _emailController.text;
          final password = _passwordController.text;
          ref.read(authProvider.notifier).login(email, password);
        },
        child: Text(translate.sign_in),
      ),
    );
  }

  Widget _widgetError(BuildContext context) {
    final authState = ref.watch(authProvider);

    return authState.maybeWhen(
      error: (error) {
        return error.maybeWhen(
          error: () {
            return Text(
              'Unexpected Error',
              style: typoTheme.s14w500style(color: Colors.red),
            );
          },
          errorWithMessage: (message) => Text(
            message,
            style: typoTheme.s14w500style(color: Colors.red),
          ),
          orElse: () {
            return Text(
              'Unexpected Error',
              style: typoTheme.s14w500style(color: Colors.red),
            );
          },
        );
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}
