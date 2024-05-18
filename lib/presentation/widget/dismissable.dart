import 'package:flutter/material.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {
  bool _showDismissible = false;
  List<String> items = <String>['banana', 'strawberry', 'apple'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_showDismissible) {
          items = <String>['banana', 'strawberry', 'apple'];
          _showDismissible = false;
        } else {
          setState(() {
            _showDismissible = true;
          });
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: const Text('dismissible'),
          ),
          const SizedBox(
            height: 8,
          ),
          if (_showDismissible)
            SizedBox(
              height: 200,
              child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(items[index]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          items.removeAt(index);
                        });
                        // Show a snackbar or perform other actions
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Item at index $index dismissed')),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: ListTile(
                        title: Text('Item ${items[index]}'),
                      ),
                    );
                  }),
            ),
        ],
      ),
    );
  }
}
