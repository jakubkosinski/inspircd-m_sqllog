inspircd-m_sqllog
=================

InspIRCd module that allows storing channel logs in SQL database. You can find database schema in schema.sql file (PostgreSQL format).

Configuration
-------------

In order to use this module, you need to enable and configure SQL provider, like `m_pgsql` or `m_mysql`. Configuration for this module is very simple, you just need to provide the identifier of database:

```
<sqllog dbid="1">
```
