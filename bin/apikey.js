#!/bin/node

var fs = require("fs");
var randomString = require("../etherpad/src/node/utils/randomstring");

var apikey = null;
try
{
    apikey = fs.readFileSync("../etherpad/APIKEY.txt","utf8");
}
catch(e)
{
    apikey = randomString(32);
    fs.writeFileSync('../etherpad/APIKEY.txt',apikey,'utf8');
}

console.log(apikey);
