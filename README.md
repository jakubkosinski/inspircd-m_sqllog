inspircd-m_sqllog
=================

InspIRCd module that allows storing channel logs in SQL database. You can find database schema in schema.sql file (PostgreSQL format). The following events would be logged:

* join
* part
* message sent to channel
* topic change
* notice sent to channel

Tested with inspIRCd 2.0.5.

Configuration
-------------

In order to use this module, you need to enable and configure SQL provider, like `m_pgsql` or `m_mysql`. Configuration for this module is very simple, you just need to provide the identifier of database and a SQL query that would be used to store messages' details:

```
<sqllog dbid="1"
        query="INSERT INTO events (nick, host, ip, user_name, ident, server, channel, event, message) VALUES ('$nick', '$host', '$ip', '$gecos', '$ident', '$server', '$channel', '$event', '$message')">
```

You can use the following variables in your query:

Variable | Effect
-------- | ------
`$nick`  | Nickname of user
`$host`  | Resolved hostname of user
`$ip`    | IP address of user
`$gecos` | User's GECOS (Real name)
`$ident` | Ident string of user
`$server`| Name of the server the user is connected to
`$channel` | Name of channel the event is sent to
`$event` | Event type, one of: `join`, `part`, `message`, `notice` or `topic`
`$message` | Message, notice, topic or part message, empty string for `join` event
