import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_providers/src/features/secondary_screen.dart';
import 'package:state_management_providers/src/providers/list_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (context, ListProviderModel, child) => Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ListProviderModel.add();
          },
          child: Icon(Icons.add),
        ),
        body: (SizedBox(
          child: Column(
            children: <Widget>[
              Text(
                ListProviderModel.numbers.last.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ListProviderModel.numbers.length,
                  itemBuilder: ((context, index) {
                    return Text(
                      ListProviderModel.numbers[index].toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => SecondaryScreen())));
                  },
                  child: Text('Next'))
            ],
          ),
        )),
      ),
    );
  }
}
