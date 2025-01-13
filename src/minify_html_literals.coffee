import {minifyHTMLLiterals} from "minify-html-literals"
import {readFile} from "node:fs/promises"
import {EOL} from "node:os"
import {extname} from "node:path"

# Creates a plug-in that minifies HTML markup inside template literal strings.
export minifyHtmlLiterals = (options = {}) ->
	name: "minifyHtmlLiterals"
	setup: (build) ->
		{filter = /\.[jt]s$/i, minifyOptions...} = options
		build.onLoad namespace: "file", filter: filter, (args) ->
			contents = await readFile args.path, "utf8"
			{code, map} = minifyHTMLLiterals(contents, minifyOptions) ? code: contents, map: null
			loader: if extname(args.path).toLowerCase() is ".ts" then "ts" else "js"
			contents: if map then "#{code}#{EOL}//# sourceMappingURL=#{map.toUrl()}" else code
		return
