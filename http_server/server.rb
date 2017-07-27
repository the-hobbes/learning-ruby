require "socket"


server = TCPServer.new("localhost", 2345)

while true
  socket = server.accept
  request = socket.gets  
  puts request
  socket.print "HTTP/1.1 200\r\n"
  socket.print "Content-Type: text/html\r\n"
  socket.print "\r\n"
  socket.print "Hello there! The time is #{Time.now}"
  socket.close
end
