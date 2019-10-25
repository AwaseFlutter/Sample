import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sample_app/blocs/sign_in/sign_in_event.dart';
import 'package:sample_app/blocs/sign_in/sign_in_repository.dart';
import 'package:sample_app/blocs/sign_in/sing_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository _signInRepository;

  SignInBloc({@required SignInRepository signInRepository})
      : assert(signInRepository != null),
        _signInRepository = signInRepository;

  @override
  SignInState get initialState => SignInEmpty();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignInWithGoogleOnPressed) {
      yield* _mapSignInWithGoogleOnPressed();
    }
    if (event is SignInAnonymouslyOnPressed) {
      yield* _mapSignInAnonymouslyOnPressed();
    }
  }

  Stream<SignInState> _mapSignInWithGoogleOnPressed() async* {
    yield SignInLoading();
    try {
      await _signInRepository.signInWithGoogle();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }

  Stream<SignInState> _mapSignInAnonymouslyOnPressed() async* {
    yield SignInLoading();
    try {
      await _signInRepository.signInAnonymously();
      yield SignInSuccess();
    } catch (_) {
      yield SignInFailure();
    }
  }
}
