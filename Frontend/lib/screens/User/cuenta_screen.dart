import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traductor/components/components.dart';
import 'package:traductor/models/models.dart';
import 'package:traductor/services/services.dart';

class CuentaScreen extends StatefulWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  State<CuentaScreen> createState() => _CuentaScreenState();
}

class _CuentaScreenState extends State<CuentaScreen> {
  late List<Cuenta> lista = [];

  @override
  void initState() {
    _realizar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Tus cuentas'),
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          final cuenta = lista[index];
          return ListTile(
            title: Text(cuenta.nroCuenta),
            subtitle: Text(cuenta.entidad),
            trailing: Text(cuenta.moneda),
            onTap: () {
              // Acción al seleccionar una cuenta
            },
          );
        },
      ),
    );
  }

  void _realizar() async {
    final cuentaService = Provider.of<CuentaService>(context, listen: false);
    final cuentas = await cuentaService.getCuentas('1');
    setState(() {
      lista = cuentas;
    });
  }
}
