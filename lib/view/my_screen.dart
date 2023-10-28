import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meduim_challenge/domain/my_domain.dart';
import 'package:meduim_challenge/models/mymodel.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBooks App'),
      ),
      body: FutureBuilder(
        future: MyDomain.getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                List myList = snapshot.data!;
                return ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    MyModel item = myList[index];
                    return ListTile(
                      onTap: () => Navigator.of(context).pushNamed(
                        DetailsScreen.routeName,
                        arguments: {
                          'id': item.id,
                          'etag': item.etag,
                          'volumeInfo': item.volumeInfo.toJson(),
                          'kind': item.kind,
                        },
                      ),
                      title: Text(item.volumeInfo.title),
                      subtitle: Text(item.kind),
                    );
                  },
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
          }
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    // print()
    final routeArguments = ModalRoute.of(context)!.settings.arguments;
    print(routeArguments);
    // if (routeArguments is Map<String, Object>) {
    final MyModel myModel =
        MyModel.fromJson(routeArguments as Map<String, dynamic>);
    // Continue with your code using myModel
    // } else {
    // Handle the case where route arguments are not as expected
    // }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image.asset(
              //   myModel.volumeInfo.imageLinks!.thumbnail ?? '',
              //   height: 400,
              //   width: 500,
              //   fit: BoxFit.contain,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Text(myModel.volumeInfo.title),
              // const SizedBox(
              //   height: 20,
              // ),
              // Text(myModel.kind),
              // const SizedBox(
              //   height: 20,
              // ),
              // Text(myModel.volumeInfo.description ?? 'No description'),
              // const SizedBox(
              //   height: 20,
              // ),
              // Center(
              //     child: ElevatedButton(
              //         onPressed: () {
              //           launchUrl(Uri.parse(myModel.volumeInfo.imageLinks!
              //               .accessInfo!.webReaderLink!));
              //         },
              //         child: const Text("Read"))),
            ],
          ),
        ));
  }
}
