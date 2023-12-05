import 'package:pessoa_crud/domain/model/person.dart';
import 'package:pessoa_crud/domain/repository/person.dart';
import 'package:pessoa_crud/domain/useCases/update_person.dart';

class UpdatePersonUseCaseImpl extends UpdatePersonUseCase{
  
  final RepositoryPerson repository;

  UpdatePersonUseCaseImpl({required this.repository});
  
  @override
  Future<void> execute(int id, Person person) => repository.updatePerson(id, person);

}