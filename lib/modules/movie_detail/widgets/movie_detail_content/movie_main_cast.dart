import 'package:filmes_app/application/ui/theme_extension.dart';
import 'package:filmes_app/modules/movie_detail/widgets/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
    
class MovieMainCast extends StatefulWidget {
  const MovieMainCast({Key? key}) : super(key: key);

  @override
  _MovieMainCastState createState() => _MovieMainCastState();
}

class _MovieMainCastState extends State<MovieMainCast> {
  bool showPanel = false;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() {
              showPanel = !showPanel;
            });
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: false,
              backgroundColor: Colors.white,
              isExpanded: showPanel,
              headerBuilder: (context, isExpanded) => const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Elenco principal',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      MovieCast(),
                      MovieCast(),
                      MovieCast(),
                      MovieCast(),
                      MovieCast(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Divider(
          color: context.themeGrey,
        ),
      ],
    );
  }
}