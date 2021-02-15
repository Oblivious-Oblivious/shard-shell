require "skeleton"

Skeleton::Server.new
    .add(Skeleton::CORSHandler.new)
    .add(Skeleton::RouteHandler.new
        .get "/" {
            "Hello Server";
        }
    )
    .create()
    .bind_tcp("127.0.0.1", 42024)
    .listen();
