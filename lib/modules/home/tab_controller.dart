import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/SourcesModel.dart';
import 'package:news_c6_offline/modules/home/tab_item.dart';

import 'news_widget.dart';

class TabsController extends StatefulWidget {

  List<Sources> sources;

  TabsController(this.sources);

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  int selectedItem=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length ,
          child: TabBar(
            isScrollable: true,
            labelColor: Colors.black,
            onTap: (index){
              selectedItem=index;
              setState(() {

              });
            },
            indicatorColor: Colors.transparent,
            tabs: widget.sources.map((oneSource) => TabItem(oneSource,
                selectedItem==widget.sources.indexOf(oneSource))).toList()
          ),
        ),
        Expanded(child: NewsData(widget.sources[selectedItem])),
      ],
    );
  }
}
