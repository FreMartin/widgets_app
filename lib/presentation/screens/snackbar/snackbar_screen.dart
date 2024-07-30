import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

  ScaffoldMessenger.of(context).clearSnackBars();  //borra el snackbar anterior antes de mostrar el nuevo

    final snackbar = SnackBar(content: const Text('Hola Mundo'),
    action: SnackBarAction(label: 'OK!', onPressed: (){},),
    duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(context: context, barrierDismissible: false, builder: (context) => AlertDialog(
      title: const Text('Esra seguro'),
      content: const Text('Estas seguro de eliminar este elemento?'),
      actions: [
        TextButton(
          onPressed: () => context.pop(), 
          child: Text('Cancelar')
        ),
        FilledButton.tonal(
          onPressed: () {
            Navigator.of(context).pop();
            //metodo para eliminar
          }, 
          child: Text('Aceptar'))
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Snackbars y Dialogo'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(context: context, 
              children: [
                const Text('Aliqua qui irure consectetur sunt consequat. Dolore velit labore dolor cupidatat sunt do in excepteur labore magna. Et labore in nisi laborum ea anim qui. Tempor enim irure reprehenderit duis reprehenderit ad eiusmod non ex. Est nostrud deserunt eiusmod consequat Lorem. Aute adipisicing duis culpa cillum in nisi cillum amet aliquip anim duis excepteur duis consequat.')
              ]);
            }, child: const Text('Licencias Usadas')
            ),

            FilledButton.tonal(onPressed: () => openDialog(context), child: const Text('Mostrar Dialogo')
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded) ,
        onPressed: (){
          showCustomSnackbar(context);
        }, 
      ),
    );
  }
}