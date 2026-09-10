
const { writeFileSync } = require('node:fs');
const { exec } = require('node:child_process');

var n = 5;
n -= 1;

function main() {
    const str = `
const { writeFileSync } = require('node:fs');
const { exec } = require('node:child_process');

var n = ${n};
n -= 1;

${main.toString()}

main();
`;
    const file = `Sully_${n}.js`;
    writeFileSync(file, str);
    if (n < 0)
        return ;
    exec('node '+file);
}

main();
