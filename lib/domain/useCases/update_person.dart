import 'package:pessoa_crud/domain/model/person.dart';

abstract class UpdatePersonUseCase{

  Future<void> execute(int id, Person person);
}