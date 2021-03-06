all: dist

fragments/fragments.txt: fragments.sh
	mkdir -p fragments
	./fragments.sh
	touch fragments/fragments.txt

guide.html: guide.md fragments/fragments.txt
	./pandoc.sh guide.md > guide.html.tmp
	mv guide.html.tmp guide.html

dist: guide.html
	mkdir -p dist
	mv guide.html dist
	cp document.css dist
	cp normal_nat.png dist
	find dist -type d -exec chmod -v 755 {} \;
	find dist -type f -exec chmod -v 644 {} \;

clean:
	rm -f guide.html guide.html.tmp
	rm -rf fragments

