import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pessoa_crud/data/repository/module.dart';
import 'package:pessoa_crud/domain/useCases/delete_person.dart';
import 'package:pessoa_crud/domain/useCases/delete_person_impl.dart';
import 'package:pessoa_crud/domain/useCases/list_people.dart';
import 'package:pessoa_crud/domain/useCases/list_people_impl.dart';
import 'package:pessoa_crud/domain/useCases/register_person.dart';
import 'package:pessoa_crud/domain/useCases/register_person_impl.dart';
import 'package:pessoa_crud/domain/useCases/update_person.dart';
import 'package:pessoa_crud/domain/useCases/update_person_impl.dart';


final getTodosProvider = Provider<ListPeopleUseCase>((ref) {
  return ListPeopleUseCaseImpl(repository:ref.read(peopleProvider));
});

final getTodoProvider = Provider<RegisterPersonUseCase>((ref) {
  return RegisterPersonUseCaseImpl(repository:ref.read(peopleProvider));
});

final saveTodoProvider = Provider<DeletePersonUseCase>((ref) {
  return DeletePersonUseCaseImpl(repository:ref.read(peopleProvider));
});

final deleteTodoProvider = Provider<UpdatePersonUseCase>((ref) {
  return UpdatePersonUseCaseImpl(repository:ref.read(peopleProvider));
});