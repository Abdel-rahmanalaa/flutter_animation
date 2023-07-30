import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _list = [];

  void _addItem() {
    setState(() {
      _list.insert(0, 'New Item ${_list.length}');
      _listKey.currentState?.insertItem(0);
    });
  }

  void _removeItem(int index) {
    setState(() {
      String removedItem = _list[index];
      _list.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (BuildContext context, Animation<double> animation) => ListTile(
          title: Text(removedItem),
          textColor: Colors.red,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList Widget"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedList(
          key: _listKey,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
            return SizeTransition(
              sizeFactor: animation,
              //axisAlignment: 10,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    child: ListTile(
                      title: Text(_list[index]),
                      trailing: IconButton(
                        onPressed: () => _removeItem(index),
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 0,
                    color: Colors.transparent,
                    height: 5,
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
