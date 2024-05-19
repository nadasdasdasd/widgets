import 'package:flutter/material.dart';
import 'package:widgets/domain/get_user.dart';
import 'package:widgets/domain/post_result_model.dart';
import 'package:widgets/presentation/widget/button.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  PostResult? postResult;
  List<User>? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("api"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(postResult != null ? getDataPost(postResult) : 'tidak ada data'),
              Text(postResult != null ? getDataList(user) : 'tidak ada data'),
              ButtonWidget(
                  textButton: 'coba post',
                  onTap: () {
                    PostResult.connectToApi("nada", "programmer").then((value) => {
                          setState(() {
                            postResult = value;
                          })
                        });
                  }),
              ButtonWidget(
                  textButton: 'coba get',
                  onTap: () {
                    User.getUsers('2').then((value) => {
                          setState(() {
                            user = value;
                          })
                        });
                  })
            ],
          ),
        ));
  }

  String getDataPost(PostResult? postResult) {
    return '${postResult!.id}  ${postResult.name} ${postResult.job} ${postResult.created}';
  }

  String getDataList(List<User>? user) {
    var output = '-';
    for (var i = 0; i < user!.length; i++) {
      output += '${user[i].id}  ${user[i].name}';
    }
    print('output $output');
    return output;
  }
}
