import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pessoa_crud/data/source/sql_connection.dart';
import 'package:pessoa_crud/data/source/sql_connection_impl.dart';

final sqlProvider = Provider<SqlHelper>((ref) {
  return SqlHelperImpl();
});