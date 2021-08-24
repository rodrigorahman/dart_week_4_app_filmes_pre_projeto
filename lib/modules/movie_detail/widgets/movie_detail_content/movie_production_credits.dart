import 'package:flutter/material.dart';
    
class MovieProductionCredits extends StatelessWidget {

  const MovieProductionCredits({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(3, (index) => index)
            .map(
              (e) => Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: RichText(
                  text: const TextSpan(
                    text: 'Companhia(s) produtora(s): ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF222222),
                    ),
                    children: [
                      TextSpan(
                        text: 'Pixar Animation, Studios e Walt Disney Pictures',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF222222)),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}