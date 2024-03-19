
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:traductor/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:traductor/services/services.dart';

class AuthService extends ChangeNotifier {
  bool _estaLogueado = false;
  User? _user;
  String? _tokens;
  Servidor server = Servidor();
  final _storage = const FlutterSecureStorage();
  bool get autenticated => _estaLogueado;
  User get user => _user!;

  Future<String> login(String email, String password, String devicename) async {
    try {
      final response =
          await http.post(Uri.parse('${server.baseUrl}/sactum/token'),
              body: ({
                'email': email,
                'password': password,
                'device_name': devicename,
              }));
      if (response.statusCode == 200) {
        String token = response.body.toString();
        tryToken(token);
        return "correcto";
      }
      if(response.statusCode == 401){
        return "ci";
      }
        return "correo incorrecto";
    } catch (e) {
      return "error del servidor";
    }
  }
  void tryToken(String?token) async { 
    if(token == null){
      return ;
    }else{
    try {
      final response =await http.get(Uri.parse('${server.baseUrl}/user'),
      headers: {'authorization':'Bearer $token'}
      );
      _user=User.fromJson(jsonDecode(response.body));
      _estaLogueado=true;      
      _tokens=token;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  }
  void storeToken(String token) async {
    await _storage.write(key: 'token', value:token );
  }

  void clear() async {
    _user = null;
    _estaLogueado=false;
    _tokens=null;
    await _storage.delete(key: 'token');
    //cache del telefono
  }
  void logout() async {
    try {
      await http.get(Uri.parse('${server.baseUrl}/user/revoke'),
      headers: {'authorization':'Bearer $_tokens'}
      );
      clear();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

}
