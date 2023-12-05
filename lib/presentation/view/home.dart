import 'package:flutter/material.dart';
import 'package:pessoa_crud/data/repository/person_impl.dart';
import 'package:pessoa_crud/data/source/sql_connection.dart';
import 'package:pessoa_crud/data/source/sql_connection_impl.dart';
import 'package:pessoa_crud/domain/model/people.dart';
import 'package:pessoa_crud/domain/model/person.dart';
import 'package:pessoa_crud/domain/repository/person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();  

}

class _HomeState extends State<Home> {

    People? people;
    static SqlHelper sqlConnection = SqlHelperImpl();
    RepositoryPerson personRepository = RepositoryPersonImpl(sqlConnection: sqlConnection);
    bool isLoading = true;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    void refreshData()async{
        final newPeople = await personRepository.listPeople();
        setState(() {
          people = newPeople;
          isLoading = false;
        });

    }

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  Future<void> registerPerson(DateTime date) async{

    Person person = new Person( name: nameController.text,
                                email: emailController.text,
                                telefone: phoneController.text,
                                birthDate: date);
                                
    person.id = await personRepository.registerPerson(person);
    refreshData();
  }

  Future<void> updatePerson(int id, Person person) async{
    await personRepository.updatePerson(id, person);
    refreshData();
  }

  Future<void> deletePerson(int id) async{
    await personRepository.deletePerson(id);
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('CRUD de Pessoas'),
      ),
      body: people == null ? 
        FloatingActionButton(onPressed: () =>
        showBottomSheet(context: context, builder: builder))
      :
      isLoading ? 
      const Center(child: CircularProgressIndicator(),) : 
      ListView.builder(
        itemCount: people?.people.length,
        itemBuilder: (context, index) =>Card(
          margin: const EdgeInsets.all(15),
          child: const ListTile(
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(people.people.elementAt(index).name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              ),
              
          ),
        ),);
  }
  


}