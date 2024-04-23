const grpc = require("@grpc/grpc-js");
var protoLoader = require("@grpc/proto-loader");
const PROTO_PATH = "./news.proto";

const options = {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
};

var packageDefinition = protoLoader.loadSync(PROTO_PATH, options);

const NewsService = grpc.loadPackageDefinition(packageDefinition).NewsService;

const client = new NewsService(
  "localhost:50051",
  grpc.credentials.createInsecure()
);

client.getAllNews({}, (error, news) => {
  console.log("getAllNews");
  if (error) throw error;
  console.log(news);
});

client.createNews(
  {
    id: "10",
    title: "Note 10",
    body: "Content 10",
    postImage: "Post image 10",
  },
  (error, news) => {
    console.log("createNews");
    if (error) {
      console.log(error);
      throw error;
    }
    console.log(news);
  }
);

client.getNews({ id: "10" }, (error, news) => {
  console.log("getNews");
  if (error) {
    console.log(error);
    throw error;
  }
  console.log(news);
});

client.updateNews(
  {
    id: "10",
    title: "Note 10x",
    body: "Content 10x",
    postImage: "Post image 10x",
  },
  (error, news) => {
    console.log("updateNews");
    if (error) {
      console.log(error);
      throw error;
    }
    console.log(news);
  }
);

client.getAllNews({}, (error, news) => {
    console.log("getAllNews");
    if (error) throw error;
    console.log(news);
  });
  

client.deleteNews({ id: "10" }, (error, _) => {
  console.log("deleteNews");
  if (error) {
    console.log(error);
    throw error;
  }
});

client.getAllNews({}, (error, news) => {
    console.log("getAllNews");
    if (error) throw error;
    console.log(news);
  });
