import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {

   static int CATEGORIES=1;
   static int SETTINGS=2;

  Function onMenuItemClicked;
  HomeDrawer(this.onMenuItemClicked);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width*.75,
        child: Column(
          children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text('News App!',textAlign: TextAlign.center,style: TextStyle(
                color: Colors.white,
                fontSize: 25,fontWeight: FontWeight.bold),),
          ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                onMenuItemClicked(CATEGORIES);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.list,size: 30,),
                    SizedBox(width: 10,),
                    Text('Categories'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
            InkWell(
              onTap: (){
                onMenuItemClicked(SETTINGS);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.settings,size: 30,),
                    SizedBox(width: 10,),
                    Text('Settings'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
