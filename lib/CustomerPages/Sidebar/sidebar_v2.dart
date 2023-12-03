import 'package:cgi_app/CustomerPages/Sidebar/sidebar_list_tiles.dart';
import 'package:flutter/material.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({Key? key}) : super(key: key);

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  bool selected = false;
  String selectedMenuItem = 'Option 1';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedContainer(
        height: MediaQuery.of(context).size.height * 1.0,
        width: selected
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.05,
        color: selected ? Colors.indigoAccent : Colors.indigo,
        alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        child: ListView(children: [
          ListTile(
            hoverColor: Colors.indigo,
            leading: Icon(
              selected
                  ? Icons.arrow_back_ios_new_rounded
                  : Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ),
          SideBarListTile(
            selected: selected,
            listTileText: "My Default Dashboard",
            icon: Icons.data_thresholding_rounded,
            onTap: () {
              if (selected) {
                Navigator.pushNamed(context, '/Analytics');
              } else {
                setState(() {
                  selected = !selected;
                });
              }
            },
          ),
          SideBarListTile(
            selected: selected,
            listTileText: "Learning Kit",
            icon: Icons.school_rounded,
            onTap: () {
              if (selected) {
                Navigator.pushNamed(context, '/Analytics');
              } else {
                setState(() {
                  selected = !selected;
                });
              }
            },
          ),
          SideBarListTile(
            selected: selected,
            listTileText: "Build Visualizations",
            icon: Icons.build_rounded,
            onTap: () {
              if (selected) {
                Navigator.pushNamed(context, '/Analytics');
              } else {
                setState(() {
                  selected = !selected;
                });
              }
            },
          ),
          ListTile(
            hoverColor: Colors.indigo,
            leading: const Icon(
              Icons.dashboard_customize_rounded,
              color: Colors.white,
            ),
            title: selected
                ? const Text(
                    "Custom Dashboards",
                    style: TextStyle(color: Colors.white),
                    softWrap: false,
                  )
                : const Text(""),
            onTap: () {
              if (selected) {
              } else {
                setState(() {
                  selected = !selected;
                });
              }
            },
            trailing: selected
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                    child: PopupMenuButton(
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 'Option 1',
                            child: const Text('Option 1'),
                            onTap: () =>
                                {Navigator.pushNamed(context, '/Analytics')},
                          ),
                          PopupMenuItem(
                            value: 'Option 2',
                            child: const Text('Option 2'),
                            onTap: () =>
                                {Navigator.pushNamed(context, '/Analytics')},
                          ),
                          PopupMenuItem(
                            value: 'Option 3',
                            child: const Text(
                                'This is a longer dashboard name because I want to see how far it expands the box.'),
                            onTap: () =>
                                {Navigator.pushNamed(context, '/Analytics')},
                          ),
                        ];
                      },
                    ),
                  )
                : null,
          ),
          SideBarListTile(
            selected: selected,
            listTileText: "Query Data",
            icon: Icons.data_object_rounded,
            onTap: () {
              if (selected) {
                Navigator.pushNamed(context, '/QueryData');
              } else {
                setState(() {
                  selected = !selected;
                });
              }
            },
          ),
        ]),
      ),
    );
  }
}
