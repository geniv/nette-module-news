News module
===========

Installation
------------
```bash
git clone https://github.com/geniv/nette-module-news.git app/modules/NewsModule
```

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
