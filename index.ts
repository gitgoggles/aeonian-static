const public_html = "./public_html";
const server = Bun.serve({
  port: 3000,
  fetch(request) {
    const path = new URL(request.url).pathname;
    switch (path) {
      case "/": {
        return new Response(Bun.file("./public_html/index.html"));
      }
      default: {
        const file_path = public_html + new URL(request.url).pathname;
        return new Response(Bun.file(file_path));
      }
    }
  },
});

console.log(`Listening on localhost:${server.port}`);
