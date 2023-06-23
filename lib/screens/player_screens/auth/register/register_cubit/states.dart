
abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}
class ChangeStartPage extends RegisterStates{}
class ChangeSuffixIconState extends RegisterStates{}
class ChangeSuffixIconState2 extends RegisterStates{}
class UploadSuccessState extends RegisterStates{}
class UploadLoadingState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{
  // final RegisterModel registerModel;
  // RegisterSuccessState(this.registerModel);
}
class RegisterErrorState extends RegisterStates{
  final String error ;
  RegisterErrorState(this.error);
}


