import 'package:sqlite3/sqlite3.dart';

abstract class SqlHelper{
  Future<Database> createConnection();
}