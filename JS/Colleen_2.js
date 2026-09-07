/*
   outside
*/
function foobar() {
   return foobar.toString();
}

function main() {
   /*
      inside
   */
   console.log("/*\n   outside\n*/\n"+foobar()+"\n\n"+main.toString()+"\n\nmain();\n");
}

main();

