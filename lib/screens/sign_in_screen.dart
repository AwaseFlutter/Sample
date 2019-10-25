import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_app/blocs/authentication/authentication_bloc.dart';
import 'package:sample_app/blocs/authentication/authentication_event.dart';
import 'package:sample_app/blocs/sign_in/sign_in_bloc.dart';
import 'package:sample_app/blocs/sign_in/sign_in_event.dart';
import 'package:sample_app/blocs/sign_in/sing_in_state.dart';
import 'package:sample_app/repositories/firebase_sign_in_repository.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signInBloc = SignInBloc(signInRepository: FirebaseSignInRepository());
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: BlocBuilder<SignInBloc, SignInState>(
          bloc: signInBloc,
          builder: (context, state) {
            if (state is SignInLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is SignInSuccess) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Success"),
                  RaisedButton(
                    onPressed: () {
                      authenticationBloc.dispatch(LoggedIn());
                    },
                    child: Text('StartApp'),
                  )
                ],
              ));
            }

            if (state is SignInFailure) {
              return Center(
                child: Text("Failure"),
              );
            }

            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RaisedButton.icon(
                      onPressed: () {
                        signInBloc.dispatch(SignInAnonymouslyOnPressed());
                      },
                      icon: Icon(Icons.account_circle),
                      label: Text("Guest Login")),
                  RaisedButton.icon(
                      onPressed: () {
                        signInBloc.dispatch(SignInWithGoogleOnPressed());
                      },
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      label: Text("Login With Google",
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            );
          }),
    );
  }
}
