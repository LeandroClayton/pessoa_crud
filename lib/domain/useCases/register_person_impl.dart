import 'package:pessoa_crud/domain/model/person.dart';
import 'package:pessoa_crud/domain/repository/person.dart';
import 'package:pessoa_crud/domain/useCases/register_person.dart';

class RegisterPersonUseCaseImpl extends RegisterPersonUseCase{
  
  final RepositoryPerson repository;

  RegisterPersonUseCaseImpl({required this.repository});
  
  @override
  Future<void> execute(Person person) =>  repository.registerPerson(person);

}