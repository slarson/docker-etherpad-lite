#!/bin/bash

cat <<END_OF_TEMPLATE
/*
This file must be valid JSON. But comments are allowed

Please edit settings.json, not settings.json.template
*/
{
    // Name your instance!
    "title": "${TEXT_TITLE}",

    // favicon default name
    // alternatively, set up a fully specified Url to your own favicon
    "favicon": "${PATH_FAVICON}",

    //IP and port which etherpad should bind at
    "ip": "0.0.0.0",
    "port" : ${PORT},

    // Session Key, used for reconnecting user sessions
    // Set this to a secure string at least 10 characters long.  Do not share this value.
    "sessionKey" : "${KEY_SESSION}",

    "dbType" : "sqlite",

    //the database specific settings

    "dbSettings" : {
        "filename" : "${PATH_DB}"
    },

    /* An Example of MySQL Configuration
    "dbType" : "mysql",
    "dbSettings" : {
        "user"    : "root",
        "host"    : "localhost",
        "password": "",
        "database": "store"
    },
    */

    //the default text of a pad
    "defaultPadText" : "${TEXT_DEFAULT}",

    /* Users must have a session to access pads. This effectively allows only group pads to be a
    ccessed. */
    "requireSession" : false,

    /* Users may edit pads but not create new ones. Pad creation is only via the API. This appli
    es both to group pads and regular pads. */
    "editOnly" : false,

    /* if true, all css & js will be minified before sending to the client. This will improve th
    e loading performance massivly,
    but makes it impossible to debug the javascript/css */
    "minify" : true,

    /* How long may clients use served javascript code (in seconds)? Without versioning this
    may cause problems during deployment. Set to 0 to disable caching */
    "maxAge" : 21600, // 60 * 60 * 6 = 6 hours

    /* This is the path to the Abiword executable. Setting it to null, disables abiword.
    Abiword is needed to advanced import/export features of pads*/
    "abiword" : null,

    /* This setting is used if you require authentication of all users.
    Note: /admin always requires authentication. */
    "requireAuthentication": false,

    /* Require authorization by a module, or a user with is_admin set, see below. */
    "requireAuthorization": false,

    /*when you use NginX or another proxy/ load-balancer set this to true*/
    "trustProxy": true,

    /* Privacy: disable IP logging */
    "disableIPlogging": false,

    /* Users for basic authentication. is_admin = true gives access to /admin.
    If you do not uncomment this, /admin will not be available! */

    "users": {
        "root": {
            "password": "${KEY_ROOT}",
            "is_admin": true
        }
    },

    // restrict socket.io transport methods
    "socketTransportProtocols" : ["xhr-polling", "jsonp-polling", "htmlfile"],

    /* The toolbar buttons configuration.
    "toolbar": {
        "left": [
        ["bold", "italic", "underline", "strikethrough"],
        ["orderedlist", "unorderedlist", "indent", "outdent"],
        ["undo", "redo"],
        ["clearauthorship"]
        ],
        "right": [
        ["importexport", "timeslider", "savedrevision"],
        ["settings", "embed"],
        ["showusers"]
        ],
        "timeslider": [
        ["timeslider_export", "timeslider_returnToPad"]
        ]
    },
    */

    /* The log level we are using, can be: DEBUG, INFO, WARN, ERROR */
    /* The log level we are using, can be: DEBUG, INFO, WARN, ERROR */
    "loglevel": "INFO",

    //Logging configuration. See log4js documentation for further information
    // https://github.com/nomiddlename/log4js-node
    // You can add as many appenders as you want here:
    "logconfig" :
    { "appenders": [
        { "type": "console"
        //, "category": "access"// only logs pad access
        }
    , { "type": "file"
    , "filename": "${PATH_LOGS}"
    , "maxLogSize": 1024
    , "backups": 3 // how many log files there're gonna be at max
    //, "category": "test" // only log a specific category
    }
    /*
        , { "type": "logLevelFilter"
        , "level": "warn" // filters out all log messages that have a lower level than "error"
        , "appender":
        {  Use whatever appender you want here  }
    }*/
    /*
    , { "type": "logLevelFilter"
        , "level": "error" // filters out all log messages that have a lower level than "error
        "
        , "appender":
        { "type": "smtp"
        , "subject": "An error occured in your EPL instance!"
        , "recipients": "bar@blurdybloop.com, baz@blurdybloop.com"
        , "sendInterval": 60*5 // in secs -- will buffer log messages; set to 0 to send a ma
        il for every message
        , "transport": "SMTP", "SMTP": { // see https://github.com/andris9/Nodemailer#possib
        le-transport-methods
        "host": "smtp.example.com", "port": 465,
        "secureConnection": true,
        "auth": {
        "user": "foo@example.com",
        "pass": "bar_foo"
        }
        }
        }
    }*/
    ]
    }
}
END_OF_TEMPLATE
