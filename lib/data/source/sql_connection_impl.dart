import 'package:pessoa_crud/data/source/sql_connection.dart';
import 'package:sqlite3/sqlite3.dart';


class SqlHelperImpl extends SqlHelper{


  @override
  Future<Database> createConnection()async{

    return sqlite3.open("./db/database.sqlite");
  }
}
