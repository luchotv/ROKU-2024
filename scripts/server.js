"use strict";

const http = require("http");
const fs = require("fs");

const hostname = "192.168.50.242";
const port = 3000;

const server = http.createServer((req, res) => {
    if (req.method === "GET" && req.url === "/profiles") {
        let profiles = fs.readFileSync("../source/json/profiles.json")
        res.statusCode = 200;
        res.setHeader("Content-Type", "application/json");
        // res.setHeader("Content-Type", "text/plain");
        console.log("-- profiles --", profiles)
        res.end(profiles)
    }
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});