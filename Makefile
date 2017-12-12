CF=node_modules/.bin/commonform

all: license.docx license.pdf

%.pdf: %.docx
	unoconv $<

license.docx: license.cform | $(CF)
	$(CF) render -f docx --title "The Common Form License" --left-align-title --indent-margins $< > $@

$(CF):
	npm install
