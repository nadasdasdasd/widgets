import 'package:flutter/material.dart';
import 'package:widgets/presentation/widget/clip.dart';
import 'package:widgets/presentation/widget/decorated_box.dart';
import 'package:widgets/presentation/widget/inkwell.dart';

class PaintWidgetPage extends StatelessWidget {
  const PaintWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('paint'),
        ),
        body: const SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                InkWellWidget(),
                SizedBox(
                  height: 8,
                ),
                DecoratedBoxWidget(),
                SizedBox(
                  height: 8,
                ),
                ClipWidget()
              ],
            ),
          ),
        ));
  }
}
