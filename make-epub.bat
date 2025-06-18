@echo off
set /P epub=Nom(sans espace) epub:
md %epub%
cd %epub%
md META-INF
md OEBPS
echo application/epub+zip > mimetype
cd META-INF
echo ^<?xml version="1.0" encoding="UTF-8"?^> > container.xml
echo ^<container version="1.0" xmlns="urn:oasis:names:tc:opendocument:xmlns:container"^>^<rootfiles^>^<rootfile full-path="OEBPS/content.opf" media-type="application/oebps-package+xml"/^>^</rootfiles^>^</container^> >> container.xml
cd ..\OEBPS
md sections
md styles
echo ^<?xml version="1.0" encoding="UTF-8"?^> > content.opf
echo ^<package unique-identifier="unique-identifier" version="3.0" xmlns="http://www.idpf.org/^^2007/opf" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:opf="http://www.idpf.org/2007/opf"^>^<metadata^>^<dc:identifier id="unique-identifier"^>0^</dc:identifier^>^<dc:title^>%epub%^</dc:title^>^<dc:creator^>Paul^</dc:creator^>^<dc:language^>fr^</dc:language^>^<meta property="dcterms:modified"^>0000-00-00T00:00:00Z^</meta^>^</metadata^>^<manifest^>^<item href="sections/section0001.xhtml" id="section0001" media-type="application/xhtml+xml"/^>^<item href="toc.ncx" id="toc.ncx" media-type="application/x-dtbncx+xml"/^>^<item href="toc.xhtml" id="toc.xhtml" media-type="application/xhtml+xml" properties="nav"/^>^<item href="styles/stylesheet.css" id="stylesheet.css" media-type="text/css"/^>^</manifest^>^<spine toc="toc.ncx"^>^<itemref idref="section0001"/^>^</spine^>^</package^> >> content.opf
echo ^<?xml version="1.0" encoding="UTF-8"?^> > toc.ncx
echo ^<ncx version="2005-1" xmlns="http://www.daisy.org/6/2005/ncx/"^>^<head^>^<meta content="" name="" scheme=""/^>^</head^>^<docTitle^>^<text/^>^</docTitle^>^<navMap^>^<navPoint class="document" id="section1" playOrder="1"^>^<navLabel^>^<text^>%epub%^</text^>^</navLabel^>^<content src="sections/section0001.xhtml"/^>^</navPoint^>^</navMap^>^</ncx^> >> toc.ncx
echo ^<?xml version="1.0" encoding="UTF-8"?^> > toc.xhtml
echo ^<html xmlns="http://www.w3.org/1999/xhtml" xmlns:epub="http://www.idpf.org/2007/ops"^>^<head/^>^<body^>^<nav epub:type="toc"^>^<ol^>^<li^>^<a href="sections/section0001.xhtml"^>%epub%^</a^>^</li^>^</ol^>^</nav^>^</body^>^</html^> >> toc.xhtml
cd sections
echo ^<?xml version="1.0" encoding="UTF-8"?^> > section0001.xhtml
echo ##ajouter ici la page html## >> section0001.xhtml
cd ..\..\..
echo .
echo La structure du livre %epub% est faite
echo Copier la page html dans OEBPS^>sections^>section0001.xhtml
echo Terminer en zipant le dossier et en le renommant .epub