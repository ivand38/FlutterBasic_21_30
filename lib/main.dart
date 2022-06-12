import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Menu App'),
          centerTitle: true,
          actions: [SwitchButton()],
          bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.local_dining_rounded),
                text: "Food",
              ),
              Tab(
                icon: Icon(Icons.local_drink_rounded),
                text: "Drink",)
            ]),
        ),
        drawer: Drawer(
          child: Column(
           children: [
             Container(
               padding: EdgeInsets.only(top: 40.0,left: 20.0,bottom: 10.0),
               alignment: Alignment.bottomLeft,
               height: 150,
               color: Colors.lightBlue,
               child: Text('Main Menu',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 22
               ),),
             ),
             Container(
               padding: EdgeInsets.only(top: 15.0,left: 20.0),
               child: Row(
                 children: [
                   Icon(Icons.home,size: 35.0),
                   Container(
                     padding: EdgeInsets.only(left: 10.0),
                     child: Text('Home',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w500
                     ),),
                   )
                 ],
               ),
             ),
             Divider(color:Colors.black),
              Container(
               padding: EdgeInsets.only(top: 5.0,left: 20.0),
               child: Row(
                 children: [
                   Icon(Icons.settings,size: 35.0),
                   Container(
                     padding: EdgeInsets.only(left: 10.0),
                     child: Text('Setting',
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w500
                     ),),
                   )
                 ],
               ),
             ),
           ],
          ),
        ),
        body: Container(
          child: TabBarView(
            children: [
              Container(
                height: deviceHeight * 0.7,
                child:  FoodTile(),
              )
             ,
              DrinkTile()
            ],
          ),
        ),
        ),
        
      ),
     
    );
  }
}

class FoodTile extends StatelessWidget {
  FoodTile({
    Key? key,
  }) : super(key: key);

  final List<String> NameList =['Nasi Goreng','Mie Goreng','Seblak','Siomay','Capcay'];
  final List<String> ImageList = ['assets/nasgor.jpg','assets/mie goreng.jpg','assets/seblak.jpg','assets/siomay.jpg','assets/capcay.jpg'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NameList.length,
      itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(index.toString()),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 10.0,left: 15.0),
              title: Text(NameList[index]),
              leading: Image.asset(ImageList[index],
                cacheHeight: 80,
                cacheWidth: 120,
              ),
              trailing: Favorite(),
            ),
          );
      },
       
      
    );
  }
}

class DrinkTile extends StatelessWidget {
  DrinkTile({
    Key? key,
  }) : super(key: key);

  final List<String> NameList =['Es Teh', 'Es Jeruk', 'Es Kopi', 'Es Greentea', 'Es Soda Gembira'];
  final List<String> ImageList = ['assets/es teh.jpg','assets/es jeruk.jpg','assets/es kopi.jpg','assets/es greentea.jpg','assets/soda gembira.jpg'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: NameList.length,
      itemBuilder: (BuildContext context, int index){
          return Dismissible(
            key: Key(index.toString()),
            child: ListTile(
              contentPadding: EdgeInsets.only(top: 10.0,left: 15.0),
              title: Text(NameList[index]),
              leading: Image.asset(ImageList[index],
                cacheHeight: 80,
                cacheWidth: 120,
              ),
              trailing: Favorite(),
            ),
          );
      },
       
      
    );
  }
}

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,),
      onPressed: () {
        setState(() {
          if (isFavorite == false){
            isFavorite = true;
          }
          else {
            isFavorite=false;
          }
        });
      },
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({ Key? key }) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool switchStatus = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        value: switchStatus, 
        activeColor: Colors.indigo,
        thumbColor: MaterialStateColor.resolveWith((states) => Colors.white),
        onChanged: (value){
          setState(() {
            switchStatus = !switchStatus;
          });
        }),
    );
  }
}