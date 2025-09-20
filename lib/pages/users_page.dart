import 'package:flutter/material.dart';
import 'package:weatherappg13/models/user_model.dart';
import 'package:weatherappg13/services/user_api_services.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<UserModel> usersList = [];
  Future<void> getUsers() async {
    UserApiServices userApiServices = UserApiServices();
    usersList = await userApiServices.getUsers();
    setState(() {});
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(usersList[index].name),
              subtitle: Text(usersList[index].createdAt.toString()),
              leading: Image.network(
                usersList[index].avatar,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
