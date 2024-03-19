import 'package:flutter/material.dart';

class Loginfomprovider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateEmail(String value) {
    // Expresión regular para validar el formato del correo electrónico

    // Validar si el valor coincide con el formato del correo electrónico
    if (value =="") {
      return false;
    }
    return true;
  }

  bool validatePassword(String value) {
    // Validar si la contraseña tiene al menos 6 caracteres
    if (value == "") {
      return false;
    }
    return true;
  }

  bool isValidForm() {
    // Utilizar las funciones de validación para verificar si los campos son válidos
    return validateEmail(email) && validatePassword(password);
  }
}
