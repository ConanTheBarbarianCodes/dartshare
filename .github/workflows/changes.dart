import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:calories_tracker/pages/add_food.dart';
import 'package:calories_tracker/widgets/search_suggestions.dart';
import 'package:flutter/services.dart';
class searchfood extends StatefulWidget {
  const searchfood({Key key}) : super(key: key);

  @override
  _searchfoodState createState() => _searchfoodState();
}

class _searchfoodState extends State<searchfood> {
  var food="",res,fname="";

  List<String> returnedFoods = [];

  @override
  Widget build(BuildContext context) {

    void dbconnection() async {
      var settings=new ConnectionSettings(
          host: "caloriestracker.cule8a3xeym9.ap-south-1.rds.amazonaws.com",
          port: 3306,
          user: 'admin',
          password: 'calories_o2',
          db: 'CALORIES_TRACKER'
      );
      var conn= await MySqlConnection.connect(settings);
      res = await conn.query('select FOOD from MACROS where food=?',[food]);
      returnedFoods.clear();
      for(var r in res)
      {
        returnedFoods.add(r[0]);
        print(r[0]);
      }
      
      /*fname=res.toString();
      fname=fname.substring(16,16+food.length);
      fname=fname.toLowerCase();
      print(returnedFoods.length);
      if(fname==food){
        setState(() {});
      }*/
      setState(() {});
    }

    Future <List<String>> getFoodList() async
    {
      Future.delayed(Duration(seconds: 1),(){
        dbconnection();
        return returnedFoods;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: Text(
          'SEARCH FOODS',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
        ),
      ),
      body: Column(
        children: <Widget> [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child:  TextField(
                onChanged: (val)
                {
                  dbconnection();
                  setState(() {
                    food=val;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter food name',
                  hintStyle: TextStyle(
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 0.0),
              child: Material(
                color: Colors.white,
                child: Column(
                  children: List.generate(returnedFoods.length, (index) => suggestion(
                    foodName: returnedFoods[index],
                  )),
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
