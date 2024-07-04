abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState{}

final class SignupSuccessState extends SignupState{}

final class SignupErrorState extends SignupState{}