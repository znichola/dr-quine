const fs = require('node:fs');
const str = "const fs = require('node:fs');\nconst str = STR;\nconst s2 = String.fromCharCode(34)+str.replaceAll(String.fromCharCode(10), String.fromCharCode(92,110))+String.fromCharCode(34);\nfs.writeFileSync('./Grace_kid.js', str.replace('STR', s2));\n\n";
const s2 = String.fromCharCode(34)+str.replaceAll(String.fromCharCode(10), String.fromCharCode(92,110))+String.fromCharCode(34);
fs.writeFileSync('./Grace_kid.js', str.replace('STR', s2));

