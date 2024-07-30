import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Progress Indicator'),
      ),
      body:const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text('Circular Progress Indicator'),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black12,   //sombra del progress indicator
          ),
          SizedBox(height: 20,),
          Text('Circular Indicator Controlado'),
          SizedBox(height: 10,),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}


class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value *2)/100;  //de 0.0 a 1.0
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0;
        return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value:progressValue,
            ),
            const SizedBox(width: 20,),
            Expanded(child: LinearProgressIndicator(
              value: progressValue,
            ))
          ]),
        );
      });
  }
}