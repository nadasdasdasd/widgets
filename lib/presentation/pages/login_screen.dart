import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('login form'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/widget', ModalRoute.withName('/'));
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final List<String> _kOption = ['nada', 'nisrina', 'septiana'];
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextFormField(
        //   decoration: const InputDecoration(icon: Icon(Icons.person), hintText: 'enter your name', labelText: 'name'),
        // ),
        Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Autocomplete(
              optionsBuilder: (
                TextEditingValue textEditingValue,
              ) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return _kOption.where((String option) {
                  return option.contains(textEditingValue.text.toLowerCase());
                });
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(16.0),
                    prefixIcon: Icon(Icons.search),
                  ),
                );
              },
            ),
          ]),
        ),
        TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.calendar_today), hintText: 'enter your date of birth', labelText: 'Dob'),
        ),
        Center(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green,
            child: Baseline(
              baseline: 150,
              baselineType: TextBaseline.alphabetic,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            ),
          ),
        ),
        const ElevatedButton(onPressed: null, child: Text('submit'))
      ],
    ));
  }
}
