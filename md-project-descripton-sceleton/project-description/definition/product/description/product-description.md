# Goal

The goal of this project is to develop a command line tool that allows the user to:

1. Do an integrity check of a database after migration:
    - means it checks the old data if it fits the new schema constraints
    - checks which data is now obsolete

2. Do a data migration that automatically updates to old data to fit into the new schema.

For example:

<div id='codeline'>Old Table</div>

| ID  | address |
|---|---|
| 1 | Samplestreet 1, 99999, Samplecity |

Gets migrated to:

<div id='codeline'>New Table</div>

| ID | address_street | address_zip  | address_city |
|---|---|---|---|
| 1 | Samplestreet 1 | 99999 | Samplecity |
