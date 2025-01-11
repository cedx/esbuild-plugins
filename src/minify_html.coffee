import {minifyHTMLLiterals} from "minify-html-literals"
import {readFile} from "node:fs/promises"
import {EOL} from "node:os"
import {extname} from "node:path"

# Creates a plug-in that minifies HTML markup inside template literal strings.
export minifyHtml = ->
	name: "minifyHtml"
	setup: (build) ->
		build.onLoad namespace: "file", filter: /\.[jt]s$/i, (args) ->
			contents = await readFile args.path, "utf8"
			{code, map} = minifyHTMLLiterals(contents) ? code: contents, map: null
			loader: if extname(args.path).toLowerCase() is ".ts" then "ts" else "js"
			contents: if map then "#{code}#{EOL}//# sourceMappingURL=#{map.toUrl()}" else code
		return
