import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatefulWidget {
  const MyProvider({super.key});

  @override
  State<MyProvider> createState() => _ProviderState();
}

class _ProviderState extends State<MyProvider> {
  String name = "raed";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (create) => Model(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Provider"),
              centerTitle: true,
            ),
            body: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Consumer<Model>(builder: (context, model, child) {
                    print("text1");
                    return Text("${model.name}");
                  }),
                  Consumer<Model>(builder: (context, model, child) {
                    print("text2");
                    return Text("${model.name2}");
                  }),
                  Consumer<Model>(builder: (context, model, child) {
                     print("change");
                    return MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        model.ChangeNotifier();
                      },
                      child: Text("Change"),
                    );
                  }),
                ],
              ),
            )));
  }
}

class Model extends ChangeNotifier {
  String name = "raed";
  String name2 = "Mohameed";
  ChangeNotifier() {
    name = "Salah";
    notifyListeners();
  }
}
