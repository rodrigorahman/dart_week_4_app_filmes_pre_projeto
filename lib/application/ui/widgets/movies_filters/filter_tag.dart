import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final bool _selected;

  const FilterTag({Key? key, bool selected = false})
      : _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      constraints: const BoxConstraints(minWidth: 100, minHeight: 30),
      decoration: BoxDecoration(
        color: _selected ? context.themeRed : Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'Infantil',
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
