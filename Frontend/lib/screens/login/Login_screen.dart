import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traductor/providers/providers.dart';
import 'package:traductor/services/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Loginfomprovider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Inicio de Sesión'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<Loginfomprovider>(
            builder: (context, loginFormProvider, child) {
              return Form(
                key: loginFormProvider.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200,
                      child: Image.asset('assets/utils/splash1.png'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Correo Electrónico',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onChanged: (value) {
                        loginFormProvider.email = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.password),
                      ),
                      onChanged: (value) {
                        loginFormProvider.password = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        // if (!loginFormProvider.isValidForm()) {
                        //   showDialog(
                        //     context: context,
                        //     builder: (_) =>
                        //         const _DialogAlerta(mensaje: 'error'),
                        //   );
                        //   return;
                        // }
                        //  final authService =
                        //      Provider.of<AuthService>(context, listen: false);
                        //  String respuesta = await authService.login(
                        //    loginFormProvider.email,
                        //    loginFormProvider.password,
                        //    'movile',
                        //  );
                        //  print(respuesta);
                        _handleLogin(context);
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
  final loginFormProvider = Provider.of<Loginfomprovider>(context, listen: false);

  if (!loginFormProvider.isValidForm()) {
    _showAlertDialog(context, 'campos requeridos');
    return;
  }

  _performLogin(context, loginFormProvider);
}

Future<void> _performLogin(BuildContext context, Loginfomprovider loginFormProvider) async {
  final authService = Provider.of<AuthService>(context, listen: false);
  String respuesta = await authService.login(
    loginFormProvider.email,
    loginFormProvider.password,
    'movile',
  );
  if (respuesta == "correcto") {
    Navigator.pop(context);
  }else if(respuesta == "error del servidor" ){
    _showAlertDialog(context, 'credenciales incorrectas');
  } else if (respuesta == "ci") {
    _showAlertDialog(context, 'password incorrecto');
  } else {
    _showAlertDialog(context, 'email incorrecto');
  }
}

void _showAlertDialog(BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Alerta'),
      content: Text(mensaje),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

}

