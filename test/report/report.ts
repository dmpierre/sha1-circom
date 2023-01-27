import { makeBadge } from "badge-maker";
import fs from "fs";
import path from "path";
import { exit } from "process";

const main = () => {
  const reportFilePath = path.join(__dirname, "json/testReport.json");
  const badgesFolderPath = path.join(__dirname, "badges");

  const report = JSON.parse(fs.readFileSync(reportFilePath).toString());
  const passes = report["stats"]["passes"];
  const failures = report["stats"]["failures"];
  const format = {
    label: "tests",
    message: `${passes}/${passes+failures}`,
    color: "blue",
  };
  const svg = makeBadge(format);
  fs.writeFileSync(`${badgesFolderPath}/testReport.svg`, svg);
  exit(0);
};

main();
