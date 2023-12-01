import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';

class SidebarPage extends StatefulWidget {
  final Widget pageWidgets;
  SidebarPage({
    Key? key,
    required this.pageWidgets,
  }) : super(key: key);

  @override
  _SidebarPageState createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  late List<CollapsibleItem> _items;
  late String headline;

  @override
  void initState() {
    super.initState();
    _items = _generateItems;
    headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: 'Default Dashboard',
        icon: Icons.data_thresholding_rounded,
        onPressed: () => setState(() => headline = 'Geeks For Geeks'),
        isSelected: true,
      ),
      CollapsibleItem(
          text: 'Custom Dashboards',
          icon: Icons.dashboard_customize_rounded,
          onPressed: () => setState(() => headline = 'Flutter'),
          subItems: [
            CollapsibleItem(
              text: 'Custom Dash 1',
              icon: Icons.dashboard_customize_rounded,
              onPressed: () => setState(() => headline = 'Flutter'),
            ),
            CollapsibleItem(
              text: 'Custom Dash 2',
              icon: Icons.dashboard_customize_rounded,
              onPressed: () => setState(() => headline = 'Flutter'),
            ),
            CollapsibleItem(
              text: 'Custom Dash 3',
              icon: Icons.dashboard_customize_rounded,
              onPressed: () => setState(() => headline = 'Flutter'),
            ),
          ]),
      CollapsibleItem(
        text: 'Learning Kit',
        icon: Icons.school_outlined,
        onPressed: () => setState(() => headline = 'HTML'),
      ),
      CollapsibleItem(
        text: 'AI Chat',
        icon: Icons.chat_rounded,
        onPressed: () => setState(() => headline = 'HTML'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CollapsibleSidebar(
      maxWidth: MediaQuery.of(context).size.width * 0.25,
      isCollapsed: MediaQuery.of(context).size.width <= 1000,
      items: _items,
      body: _body(size, context),
      collapseOnBodyTap: true,
      selectedIconBox: Colors.indigoAccent,
      unselectedTextColor: Colors.white70,
      unselectedIconColor: Colors.white70,
      backgroundColor: Colors.indigo,
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 13, decoration: TextDecoration.none),
      selectedIconColor: Colors.white,
      showToggleButton: true,
      titleBack: false,
      iconSize: 35,
      toggleTitle: '',
      customContentPaddingLeft: 15,
      itemPadding: 10,
      borderRadius: 10,
      showTitle: false,
      sidebarBoxShadow: const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 20,
          spreadRadius: 0.01,
          offset: Offset(3, 3),
        ),
        BoxShadow(
          color: Colors.white,
          blurRadius: 30,
          spreadRadius: 0.01,
          offset: Offset(3, 3),
        ),
      ],
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SingleChildScrollView(
        child: widget.pageWidgets,
      ),
    );
  }
}
