import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Style3 extends StatefulWidget {
  const Style3({Key? key}) : super(key: key);

  @override
  State<Style3> createState() => _Style3State();
}

class _Style3State extends State<Style3> {
  String abc =
      "asdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdas asdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdasasdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdasasdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdasasdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdasasdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdasasdasdasd asdas das dasd as dasd asd asd asd asd asd asd asd asdas";

  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Level'),
      ),
      body: ListView(
        children: [
          buildCard('Expandable 1',
              'https://e7.pngegg.com/pngimages/285/91/png-clipart-spider-man-illustration-spider-man-miles-morales-spiderman-heroes-superhero.png'),
        ],
      ),
    );
  }

  Widget buildCard(String title, String urlImage) => ExpandableNotifier(
    child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => controller.toggle(),
                  child: Image.network(urlImage),
                ),
                ScrollOnExpand(
                  child: ExpandablePanel(
                    controller: controller,
                    theme: const ExpandableThemeData(
                      expandIcon: Icons.arrow_downward,
                      collapseIcon: Icons.arrow_upward,
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                    ),
                    builder: (_, collapsed, expanded) => Padding(
                      padding: const EdgeInsets.all(10).copyWith(top: 0),
                      child: Expandable(collapsed: collapsed, expanded: expanded),
                    ),
                    header: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    collapsed: Text(
                      abc,
                      style: const TextStyle(fontSize: 18),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(
                      List.generate(5, (_) => abc).join('\n\n'),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}
