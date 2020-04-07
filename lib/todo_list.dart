import 'package:flutter/material.dart';
import 'package:todo_app/add_item_dialog.dart';

class TodoList extends StatefulWidget {
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _items = [];
  bool _isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      floatingActionButton: _fab(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _items.isNotEmpty
            ? ListView.builder(
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _items[index];
                  return Dismissible(
                    key: Key(item),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _items.removeAt(index);
                        if (_isEnabled == false) _isEnabled = true;
                      });
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black26),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: ListTile(
                          title: Text(item),
                          onTap: () {
                            _showDialog(item, index);
                          },
                        )),
                  );
                })
            : Center(
                child: Icon(
                Icons.add_circle_outline,
                size: 100,
                color: Colors.blue,
              )),
      ),
    );
  }

  Widget _fab() {
    return FloatingActionButton(
        backgroundColor: _isEnabled ? Colors.blue : Colors.grey,
        onPressed: _isEnabled
            ? () {
                _showDialog('', null);
              }
            : null,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ));
  }

  void _showDialog(String itemName, int index) async {
    final String todo = await showDialog(
        context: context,
        builder: (context) => AddItemDialog(
              title: itemName,
            ));
    if (todo != null) {
      setState(() {
        index == null ? _items.add(todo) : _items[index] = todo;
        if (_items.length == 10) _isEnabled = false;
      });
    }
  }
}
