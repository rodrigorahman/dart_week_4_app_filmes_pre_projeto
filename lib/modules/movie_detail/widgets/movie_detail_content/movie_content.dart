import 'package:flutter/material.dart';
    
class MovieContent extends StatelessWidget {

  const MovieContent({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('2021 (USA) | '),
              Icon(Icons.timer_rounded),
              Text(' 1h41'),
            ],
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50),
            child: const Text(
              'Luca vive aventuras com seu novo melhor amigo, mas a diversão é ameaçada por um segredo: seu amigo é um monstro marinho de outro mundo que fica abaixo da superfície da água.',
              style: TextStyle(
                fontSize: 14,
                // heigth é a separação da linha
                height: 1.3,
              ),
            ),
          )
        ],
      ),
    );
  }
}