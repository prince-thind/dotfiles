import shell from "shelljs";

import links from "./links.js";

for (const [repoFile, original] of Object.entries(links)) {
  //delete original file
  shell.exec(`rm -f "${original}"`);

  //link repofile with original
  shell.exec(`ln "${repoFile}" "${original}"`);
}
