import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traductor/screens/screens.dart';
import 'package:traductor/services/services.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<AuthService>(builder: (context, auth, child) {
        //print(auth.autenticated);
        if (!auth.autenticated) {
          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.login),
                title: const Text('Iniciar sesion'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
            ],
          );
        } else {
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(auth.user.name),
                accountEmail: Text(auth.user.email),
                currentAccountPicture: CircleAvatar(
                  child: Image.network(
                    'assets/utils/programador.png',
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/utils/fondo.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text('Cuentas'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CuentaScreen()));
                },
              ),
              const Divider(
                //linea de division
                thickness: 3,
                indent: 15,
                endIndent: 15,
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('cerrar sesion'),
                onTap: () {
                  auth.logout();
                },
              ),
            ],
          );
        }
      }),
      // child: ListView(
      //   children: [
      //      UserAccountsDrawerHeader(
      //       accountName: const Text('Danielinho'),
      //       accountEmail: const Text('dani123@gmail.com'),
      //       currentAccountPicture: CircleAvatar(
      //         child: Image.network(
      //         'assets/utils/programador.png',
      //         fit: BoxFit.cover,
      //         ),
      //       ),
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/utils/fondo.jpg'),
      //           fit: BoxFit.cover
      //           ),
      //       ),
      //       ),

      //     ListTile(
      //       leading: const Icon(Icons.login),
      //       title: const Text('iniciar sesion'),
      //       onTap: (){
      //         Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen() ));
      //       },
      //     ),
      //       ListTile(
      //       leading: const Icon(Icons.shop),
      //       title: const Text('modulo Compras '),
      //       onTap: (){
      //         print('Click en iniciar sesion');
      //       },
      //     ),
      //     const Divider( //linea de division
      //       thickness: 3,
      //       indent: 15,
      //       endIndent: 15,
      //     ),
      //     ListTile(
      //       leading: const Icon(Icons.logout),
      //       title: const Text('cerrar sesion'),
      //       onTap: (){
      //         print('Click en cerrar sesion');
      //       },
      //     ),
      //   ]
      // )
    );
  }
}
