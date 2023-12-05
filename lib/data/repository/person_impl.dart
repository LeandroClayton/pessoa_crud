import 'package:pessoa_crud/data/source/sql_connection.dart';
import 'package:pessoa_crud/domain/model/people.dart';
import 'package:pessoa_crud/domain/model/person.dart';
import 'package:pessoa_crud/domain/repository/person.dart';
import 'package:sqlite3/sqlite3.dart';

class RepositoryPersonImpl extends RepositoryPerson{

  final SqlHelper sqlConnection;

  RepositoryPersonImpl({required this.sqlConnection});



  @override
  Future<void> deletePerson(int id)async{
    Database db = await sqlConnection.createConnection();   
    db.prepare("Delete from Person where id = ?");
    db.execute("$id");
    db.dispose();
  }

  @override
  Future<People?> listPeople()async{
    List<Person?> people = [];
    Database db = await sqlConnection.createConnection();
    ResultSet? resultado = db.select("Select * from Person");

    for (Row row in resultado) {
      Person person = Person( id: row.columnAt(1), 
                              name: row.columnAt(2), 
                              email: row.columnAt(3), 
                              telefone: row.columnAt(4), 
                              birthDate: row.columnAt(5));
      people.add(person);
    }
    People retPeople = People(people: people);
    db.dispose();
    return retPeople;

  }

  @override
  Future<void> registerPerson(Person pessoa)async {

    Database db = await sqlConnection.createConnection();   
    db.prepare("insert into Person(name, email, telefone, birthDate) values(?, ?, ?)");
    db.execute('[${pessoa.name}, ${pessoa.email}, ${pessoa.telefone},${pessoa.birthDate}]');
    db.dispose();
  }

  @override
  Future<void> updatePerson(int id, Person pessoa)async {
    Database db = await sqlConnection.createConnection();   
    db.prepare("Update table Person Set name = ?, email = ?, telefone = ?, birthDate = ?");
    db.execute('[${pessoa.name}, ${pessoa.email}, ${pessoa.telefone},${pessoa.birthDate}]');
  }

}