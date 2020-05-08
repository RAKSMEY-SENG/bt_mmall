import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SearchScreen> {

  List<ProductModel> users = List();
  List<ProductModel> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    Provider.of<ApiService>(context, listen: false).getProduct().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
//      darkTheme: ThemeData.dark(),
      home: FloatingSearchBar.builder(
        pinned: true,
        itemCount: filteredUsers.length,
        padding: EdgeInsets.only(top: 10.0),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.network(filteredUsers[index].image),
                title: Text(filteredUsers[index].name),
              ),
            ),
          );
        },
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        trailing: CircleAvatar(
          backgroundColor: Colors.deepOrange,
          child: IconButton(
            icon: Icon(Icons.tune,color: Colors.white,),
            onPressed: (){
            Navigator.of(context).pop();
            },
          )
        ),
        onChanged: (string) {
          setState(() {
            filteredUsers = users
                .where((u) => (u.name
                .toLowerCase()
                .contains(string.toLowerCase()) ||
                u.type.toLowerCase().contains(string.toLowerCase())))
                .toList();
          });
        },
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: "Search...",
        ),
      ),
    );
  }
}
