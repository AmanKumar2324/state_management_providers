import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class SecondaryScreen extends StatefulWidget {
  SecondaryScreen({
    super.key,
  });

  @override
  State<SecondaryScreen> createState() => _SecondaryScreenState();
}

class _SecondaryScreenState extends State<SecondaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ListProvider>(
      builder: (context, numberProvider, child) => Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numberProvider.add();
          },
          child: Icon(Icons.add),
        ),
        body: SizedBox(
          child: Column(
            children: <Widget>[
              Text(
                numberProvider.numbers.last.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numberProvider.numbers.length,
                  itemBuilder: ((context, index) {
                    return Text(
                      numberProvider.numbers[index].toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
