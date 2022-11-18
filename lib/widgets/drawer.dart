import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   const imageURL =
       "https://images.unsplash.com/photo-1645235142939-096560a17aab?ixlib=rb-1.2.1"
       "&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1064&q=80";


    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget> [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageURL),),
                accountName: Text("Sparsh Rajput"),
                accountEmail: Text("Sparsh.R@gmail.com")),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,),
              title: Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,),
              title: Text("Contact Me",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
