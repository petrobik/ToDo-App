import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  String title;
  AddItemDialog({this.title});
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = title;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            child: TextFormField(
              autofocus: true,
              controller: _controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black54,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.black54)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black54))),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.black54),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  height: 50.0,
                  child: OutlineButton(
                    borderSide: BorderSide(color: Colors.black54),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    onPressed: () {
                      Navigator.of(context).pop(_controller.text);
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }
}
