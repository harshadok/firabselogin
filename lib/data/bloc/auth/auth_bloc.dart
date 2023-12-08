import 'package:api_fech/data/bloc/auth/auth_event.dart';
import 'package:api_fech/data/bloc/auth/auth_state.dart';
import 'package:api_fech/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _repository = AuthenticationRepository();
  AuthBloc() : super(AuthStateInitiate()) {
    on<AuthRequest>((event, emit) async {
      if (event.Login) {
        var loginResponse =
            await _repository.Login(event.email, event.password);
        emit(LoginResponseState(loginResponse));
      } else {
        var SignupResponse = await _repository.Register(
            event.email, event.password, event.Confirmpassword);
        emit(SignUpResponseState(SignupResponse));
      }
    });
  }
}
