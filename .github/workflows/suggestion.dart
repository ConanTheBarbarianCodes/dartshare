import 'package:flutter/material.dart';

class suggestion extends StatefulWidget {
  String foodName;
  suggestion({
    //suggestion variables
    Key key,
    this.foodName

  }) : super(key: key);

  @override
  _suggestionState createState() => _suggestionState();
}

class _suggestionState extends State<suggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Text(
                  widget.foodName,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: (){ Navigator.pushNamed(context, '/addfood'); },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  style: TextButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: Colors.orange[800],
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
