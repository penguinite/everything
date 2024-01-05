{.define: ssl.}

import std/[json, httpclient, os, strutils]

const pkgUrls = @[
  "https://raw.githubusercontent.com/nim-lang/packages/master/packages.json",
  "https://nim-lang.org/nimble/packages.json"
]

proc is20x*(response: Response): bool =
  return response[].status == "200"

proc getPkgs(): string =
  var client = newHttpClient()
  for url in pkgUrls:
    result = client.getContent(url)
    if not result.isEmptyOrWhitespace():
      break
  return result

if not fileExists("packages.json"):
  writeFile("packages.json", getPkgs())

let jason = parseJson(readFile("packages.json"))

var output = """
# Package

version       = "0.1.0"
author        = "penguinite"
description   = "Every package ever"
license       = "CC0"
srcDir        = "src"


# Dependencies
# I finally managed to type out every single one :D
# It took a lot of effort!
"""

for pkg in jason:
  if pkg.contains("name"):
    output.add("requires \"" & pkg["name"].getStr() & "\"\n")

writeFile("everything.nimble", output)