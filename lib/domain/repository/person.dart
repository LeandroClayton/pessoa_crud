import 'package:pessoa_crud/domain/model/people.dart';
import 'package:pessoa_crud/domain/model/person.dart';

abstract class RepositoryPerson{

  Future<void> registerPerson(Person pessoa);

  Future<People?> listPeople();

  Future<void> updatePerson(int id, Person pessoa);

  Future<void> deletePerson(int id);


}