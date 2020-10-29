# Teamspeak PHPbb integration for wwiiol
 Teamspeak PHPbb integration for wwiionline

This software was designed to work with ColdFusion, PHP4, and Teamspeak 2 on a LAMP VM for players of WWIIOnline.com for both Allied and Axis forces.

A custom hierarchical database was built for management of thousands of accounts on Teamspeak. 

It required ETL of Teamspeak2's sqlite to mySQL.
Frontend PHP/ColdFusion website for user management database.
Delegated hierarchical management by rank. Used PHP to create hierarchical database from relational SQL.

Managed security: auto-lostpass, Hack warning systems. (like SQL injection honeypots)
Audit trail. Who did what, when. Who tried to cheat?
Bad actors were minimized. Only had to ban a couple of accounts.
Developed keybind for navigating teamspeak software.