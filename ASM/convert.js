const fs = require('node:fs');

const file = fs.readFileSync(process.argv[2],{encoding:"utf8"});

const program = file.replace(/code db.+/g, 'code db PROGRAM,0');

const res = program
                .replaceAll('%','%5$c')
                .replaceAll('\n', '%1$c')
                .replaceAll('"', '%2$c')
                .replaceAll(/n    dd.+ 5/g,'n    dd %4$d; i = %4$d' )
                .replace('PROGRAM', '%2$c%3$s%2$c');

process.stdout.write(program.replace('PROGRAM', '"'+res+'"'));

