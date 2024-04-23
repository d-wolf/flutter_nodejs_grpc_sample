# Flutter/Node GRPC Sample

Demonstrates how a Flutter app interacts with a node-js service using GRPC CRUD operations.

## Build & Run Sample

- [install node.js](https://nodejs.org/en/learn/getting-started/how-to-install-nodejs)
- [install flutter](https://docs.flutter.dev/get-started/install)
- run the following commands in terminal
  - `node ./node_server/server.js`
  - `cd flutter_app`
  - `flutter pub get`
  - `flutter run`

## Proto Serivce Definition

The proto definition file can be found [here](./proto/news.proto). To generate the required source code for the flutter app, go through the following steps:

- install the [proto compiler](https://grpc.io/docs/protoc-installation/) on your machine
- run `mkdir flutter_app/lib/generated`
- run `protoc -I=./proto/ --dart_out=grpc:flutter_app/lib/generated news.proto`


* grpc web https://github.com/grpc/grpc-web/tree/master/net/grpc/gateway/examples/helloworld