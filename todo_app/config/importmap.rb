# Pin npm packages by running ./bin/importmap

pin "application"

pin "bootstrap", to: "bootstrap.min.js", preload: true #バージョンによっては、"bootstap.min.js"ではなく、"bootsrap.js"と書く
pin "@popperjs/core", to: "popper.js", preload: true
