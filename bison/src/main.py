import SimpleHTTPServer
import SocketServer

class HelloWorldHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write("Hello, World!")

PORT = 80

httpd = SocketServer.TCPServer(("0.0.0.0", PORT), HelloWorldHandler)

print("Serving on port", PORT)
try:
    httpd.serve_forever()
except KeyboardInterrupt:
    print("Shutting down server")
    httpd.shutdown()
