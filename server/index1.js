var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

var workers = []
var tickets = []
var clientSocket;
app.get('/', function(req, res) {
    res.send('<h1>AppCoda - SocketChat Server</h1>');
});


http.listen(3000, function() {
    console.log('Listening ne on *:3000');
});

io.on('connection', function(client) {
    console.log("Hi")
    clientSocket = client
    clientSocket.on("pushTicketForCategoryA", function(category, title, urgent, userName, workerName) {
        var ticket = {}
        ticket["userName"] = userName
        ticket["category"] = category
        ticket["title"] = title
        ticket["urgent"] = urgent
        ticket["workerName"] = workerName
        tickets.push(ticket)
        io.emit("newTicketForCategoryA", ticket)
        console.log("Create new ticket: " + ticket["userName"])
        console.log("applyTicket-" + title)
        clientSocket.on("applyTicket-" + title, function(workerName) {
            console.log("ApplyTicket")
            io.emit("newWorker-" + title, workerName)
        });
    });

});
