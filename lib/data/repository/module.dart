import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pessoa_crud/data/repository/person_impl.dart';
import 'package:pessoa_crud/data/source/module.dart';
import 'package:pessoa_crud/domain/repository/person.dart';

final peopleProvider = Provider<RepositoryPerson>((ref) {
  return RepositoryPersonImpl(sqlConnection: ref.read(sqlProvider));
});