import 'package:flutter/material.dart';
import 'package:weatherappg13/models/user_model.dart';
import 'package:weatherappg13/services/api_services.dart';
import 'package:weatherappg13/services/user_api_services.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UserApiServices userApiServices = UserApiServices();
  List<UserModel> usersList = [];
  Future<void> getUsers() async {
    // UserApiServices userApiServices = UserApiServices();
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () async {
                        UserModel userUpdated = UserModel(
                          id: usersList[index].id,
                          createdAt: usersList[index].createdAt,
                          name: "Nombre editado",
                          avatar: usersList[index].avatar,
                        );
                        print("..................");
                        print(userUpdated.id);
                        await userApiServices.updateUser(userUpdated);
                        getUsers();
                        setState(() {});
                      },
                      icon: Icon(Icons.edit, color: Colors.blueAccent),
                    ),
                    IconButton(
                      onPressed: () async {
                        userApiServices.deleteUser(usersList[index].id!);
                        getUsers();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
