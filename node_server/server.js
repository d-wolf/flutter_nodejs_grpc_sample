var path = require('path');
const grpc = require("@grpc/grpc-js");
const PROTO_PATH = path.join(__dirname, '..', 'proto', 'news.proto');
var protoLoader = require("@grpc/proto-loader");

const options = {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
};

var packageDefinition = protoLoader.loadSync(PROTO_PATH, options);
const newsProto = grpc.loadPackageDefinition(packageDefinition);

const server = new grpc.Server();
let news = [
  {
    id: "0924569a-7b79-43e5-b294-22bcbf42e47e",
    title: "Lorem",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    postImage: "amet",
  },
  {
    id: "3dbef10e-50ae-4b28-ba53-979601509c15",
    title: "Ipsum",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    postImage: "sit",
  },
];

server.addService(newsProto.NewsService.service, {
  getAllNews: getAllNews,
  createNews: createNews,
  getNews: getNews,
  updateNews: updateNews,
  deleteNews: deleteNews,
});

function getAllNews(_, callback) {
  console.log("getAllNews");
  callback(null, { news });
}

function createNews(call, callback) {
  console.log("createNews");
  console.log(call.request);
  news.push(call.request);
  callback(null, call.request);
}

function getNews(call, callback) {
  console.log("getNews");
  console.log(call.request);
  const existingNews = news.find((n) => n.id == call.request.id);
  if (existingNews) {
    callback(null, existingNews);
  } else {
    callback({
      code: grpc.status.NOT_FOUND,
      details: "Not found",
    });
  }
}

function updateNews(call, callback) {
  console.log("updateNews");
  console.log(call.request);
  const existingNews = news.find((n) => n.id == call.request.id);

  if (existingNews) {
    existingNews.title = call.request.title;
    existingNews.body = call.request.body;
    existingNews.postImage = call.request.postImage;
    callback(null, existingNews);
  } else {
    callback({
      code: grpc.status.NOT_FOUND,
      details: "Not found",
    });
  }
}

function deleteNews(call, callback) {
  console.log("deleteNews");
  console.log(call.request);
  const existingNewsIndex = news.findIndex((n) => n.id == call.request.id);

  if (existingNewsIndex != -1) {
    news.splice(existingNewsIndex, 1);
    callback(null, {});
  } else {
    callback({
      code: grpc.status.NOT_FOUND,
      details: "Not found",
    });
  }
}

server.bindAsync(
  "127.0.0.1:50051",
  grpc.ServerCredentials.createInsecure(),
  (error, port) => {
    console.log("Server running at http://127.0.0.1:50051");
  }
);
