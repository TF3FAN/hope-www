html: $(PAGES)

.PHONY: clean html publish

clean:
	rm -f $(PAGES)

publish: html
	scp $(PAGES) $(EXTRA) $(WEBROOT)

.SUFFIXES: .html .ipynb .rst

.rst.html: style.css
	rst2html --stylesheet-path html4css1.css,style.css $< $@

.ipynb.html:
	jupyter nbconvert --to html $<
