import 'package:flutter/material.dart';
import 'package:vagaja/src/app/menu_app.dart';
import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/views/login_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Colors.blueGrey,
            height: 130,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 3),
              child: Center(
                child: Image.asset("assets/images/Logo.jpg",scale: 1.6,),
              ),
            ),
            ),
            ...appMenuitens.map(
            (item) => ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                Navigator.pushReplacementNamed(context, item.route);
              },
            ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text("sair"),
              onTap: (){
                AuthService.logout();
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (_) => const LoginView()), 
                  (route) => false
                  );
              },
            )
        ],
      ),
    );
  }
}