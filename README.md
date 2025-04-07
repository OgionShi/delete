# Delete

The rm command does not give room for error and does not support any revert
mechanism. Project named DELETE fixes this problem

## DESCRIPTION

In first, script DELETE compresses your file. A compression algorithm can be
selected:
- .LZMA;
- .GZIP.

Then compressed file moves to /home/USERNAME/TRASH folder.

### Features
- the DELETE script allows to delete folders, symbolic or hard link;
 - if the file is a symbolic link, it is necessary to delete it without archiving
   and return a message to user:
   - that only link is deleted;
   - the name of original file referenced by the symbolic link.
 - if the file is a hard link,  delete it as usual file and return a message
   to user with a list of links to this file.
- each time it is lunched, the DELETE script scans the /home/USERNAME/TRASH
  folder and deletes files from it which are older than 48 hours.

## INSTALL

### Dependencies

This project uses compressing algorithm: lzma, gzip. If you do not have them
installed (for example, on ubuntu):

```sh
$ sudo apt-get install lzma
$ sudo apt-get install gzip
```

## USAGE

## CONFIGURATION

## CONTRIBUTION

### Description of commits
| Tag      | Description                                              |
|:---------|:---------------------------------------------------------|
| build    | building a project or changing external dependencies     |
| sec      | security, vulnerabilities                                |
| ci       | setting up CI and working with scripts                   | 
| docs     | updating documentation                                   |
| feat     | adding new functionality                                 |
| fix      | bug fixes                                                |
| perf     | changes aimed at improving performance                   |
| refactor | code edits without fixing errors or adding new functions |
| revert   | rollback to previous commits                             |
| style    | code style edits                                         |
| test     | adding tests                                             |

## LICENSE

## CONTACTS

e-mail: vanya.zarubin@yandex.ru

## GRATITUDE
