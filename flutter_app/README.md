# GRPC Sample App

## Run
- `flutter pub get`
- `flutter run`

## Generate proto files
- install the [proto compiler](https://grpc.io/docs/protoc-installation/) on your machine
- run `mkdir generated`
- run `protoc -I=../grpc-nodejs/ --dart_out=grpc:lib/generated news.proto`
