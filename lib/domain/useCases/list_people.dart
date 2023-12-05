import 'package:pessoa_crud/domain/model/people.dart';

abstract class ListPeopleUseCase{
  
  Future<People?> execute();

}