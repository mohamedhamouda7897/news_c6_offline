import 'package:flutter/material.dart';
import 'package:news_c6_offline/models/SourcesModel.dart';

class TabItem extends StatelessWidget {

  Sources sources;
  bool isSelected;
  TabItem(this.sources,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: isSelected?Colors.green:Colors.transparent,
          border: Border.all(color: Colors.green),
      ),
      child: Text(sources.name ?? "",style: TextStyle(
        color: isSelected?Colors.white:Colors.green
      ),),
    );
  }
}
