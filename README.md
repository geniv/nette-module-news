News module
===========

Installation
------------
manual install direct to modules directory
```bash
git clone https://github.com/geniv/nette-module-news.git app/modules/NewsModule
```
must by install db from sql files


Include in application
----------------------
neon configure:
```neon
# news module
newsModule:
    tablePrefix: %tablePrefix%
    news:
        itemsPerPage: 2
        pathToImage: "www/files/image/news/"
        pathToImageGallery: "www/files/image/news/gallery/"
```

neon configure extension:
```neon
extensions:
    newsModule: NewsModule\Bridges\Nette\Extension
```

header menu:
```latte
<li n:class="$presenter->isLinkCurrent(':News:*') ? active"><a n:href=":News:">{_'header-news'}</a></li>
```
