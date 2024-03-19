import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:traductor/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:traductor/services/services.dart';

class CuentaService extends ChangeNotifier {
  late List<Cuenta> _cuentas = []; // Cambio aquí: Cambiar el tipo de _cuentas a List<CuentaElement>
  bool isLoading=true;
  Servidor server = Servidor();

  Future< List<Cuenta> > getCuentas(String $userId) async {
    isLoading=true;
    _cuentas=[];
    try {
      final respuesta = await http.get(Uri.parse('${server.baseUrl}/cuentas/${$userId}'));
      List<dynamic>listaCuentas=jsonDecode(respuesta.body);
      listaCuentas.forEach((element) {
        final cuenta = Cuenta.fromMap(element);
        _cuentas.add(cuenta);
      });
      isLoading=false;
      notifyListeners();
      return _cuentas;
    } catch (e) {
      return _cuentas ;
    }
  }

  Future<String> crearCuenta(
      String nroCuenta, String entidad, String moneda) async {
    return "";
  }

  Future<String> actualizarCuenta(
      String nroCuenta, String entidad, String moneda) async {
    return "";
  }

  Future<String> eliminarCuenta() async {
    return "";
  }
}
