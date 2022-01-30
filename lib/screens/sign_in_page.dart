import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_clone_provider/core/locator.dart';
import 'package:wp_clone_provider/viewmodels/sign_in_model.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _editingController = TextEditingController();
    return ChangeNotifierProvider(
        create: (BuildContext context) => getIt<SignInModel>(),
        child: Consumer<SignInModel>(
            builder: (context, SignInModel model, Widget? child) => Scaffold(
                  appBar: AppBar(
                    title: Text("Sign in for Wp Clone"),
                  ),
                  body: Container(
                    padding: EdgeInsets.all(8),
                    child: model.busy
                        ? CircularProgressIndicator()
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Username"),
                              TextField(
                                controller: _editingController,
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    await model.signIn(_editingController.text);
                                  },
                                  child: Text("Sign In")),
                            ],
                          ),
                  ),
                )));
  }
}
