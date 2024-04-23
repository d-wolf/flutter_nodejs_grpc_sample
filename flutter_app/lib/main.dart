import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_grpc/generated/news.pbgrpc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:grpc/grpc.dart';
import 'package:uuid/uuid.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GRPC Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'News Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NewsServiceClient _client;
  final List<News> _newsList = [];

  @override
  void initState() {
    super.initState();

    final channel = ClientChannel(
      'localhost',
      port: 50051,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );

    _client = NewsServiceClient(channel);
    _fetchAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_newsList[index].title),
            subtitle: Text(_newsList[index].id),
            trailing: IconButton(
                onPressed: () async {
                  await _client.deleteNews(NewsId(id: _newsList[index].id));
                  _fetchAll();
                },
                icon: const Icon(Icons.delete)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text(_newsList[index].body),
                  );
                },
              );
            },
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String text = lorem(paragraphs: 2, words: 60);
          final parts = text.split(' ');
          final _ = await _client.createNews(
            News(
                id: const Uuid().v4().toString(),
                title: parts[Random().nextInt(parts.length)],
                body: text),
          );
          _fetchAll();
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _fetchAll() {
    _client.getAllNews(Empty()).then((p0) {
      _newsList.clear();
      setState(() {
        _newsList.addAll(p0.news);
      });
    });
  }
}
