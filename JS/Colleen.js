/*
   outside
*/

function literal(s) {
    return '`'+s.replace(/\n/g,"\\n")+'`';
}

function main() {
    /*
      inside
    */
    const s=`/*\n   outside\n*/\n\nFUNC\n\nfunction main() {\n    /*\n      inside\n    */\n    const s=JAJA;\n    console.log(s.replace("JAJA",literal(s)).replace("FUNC",literal.toString()));\n}\n\nmain();\n`;
    console.log(s.replace("JAJA",literal(s)).replace("FUNC",literal.toString()));
}

main();

