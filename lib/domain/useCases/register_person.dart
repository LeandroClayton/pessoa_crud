import 'package:pessoa_crud/domain/model/person.dart';

abstract class RegisterPersonUseCase{

  Future<void> execute(Person person);
}