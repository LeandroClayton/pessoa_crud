import 'package:pessoa_crud/domain/repository/person.dart';
import 'package:pessoa_crud/domain/useCases/delete_person.dart';

class DeletePersonUseCaseImpl extends DeletePersonUseCase{
  
  final RepositoryPerson repository;

  DeletePersonUseCaseImpl({required this.repository});
  
  @override
  Future<void> execute(int id) => repository.deletePerson(id);
}