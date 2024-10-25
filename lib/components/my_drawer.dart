import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  void logout(){
    // Add code to logout the user
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){


    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.favorite,
                  size: 60,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25.0),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: const Text('H O M E'),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: const Text('P R O F I L E'),
                  onTap: (){
                    Navigator.pop(context);

                    Navigator.pushNamed(
                      context,
                      '/profile_page',
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.group),
                  title: const Text('U S E R S'),
                  onTap: (){
                    Navigator.pop(context);

                    Navigator.pushNamed(
                      context,
                      '/users_page',
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.nights_stay_outlined),
                  title: const Text('N I G H T'),
                  trailing: CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    },
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: const Text('L O G O U T'),
              onTap: (){
                Navigator.pop(context);

                logout();
              },
            ),
          )
        ],
      ),
    );
  }
}