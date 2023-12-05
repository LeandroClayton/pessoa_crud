import 'package:pessoa_crud/domain/model/people.dart';
import 'package:pessoa_crud/domain/repository/person.dart';
import 'package:pessoa_crud/domain/useCases/list_people.dart';

class ListPeopleUseCaseImpl extends ListPeopleUseCase{
  
  final RepositoryPerson repository;

  ListPeopleUseCaseImpl({required this.repository});

  
  @override
  Future<People?> execute() => repository.listPeople();

}