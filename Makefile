.PHONY: install clean

install:
	composer install

clean:
	vendor/bin/php-cs-fixer fix .

phar: prepare
	php -d phar.readonly=off box.phar build

BOX_VERSION=2.7.5
box.phar:
	wget -q https://github.com/box-project/box2/releases/download/${BOX_VERSION}/box-${BOX_VERSION}.phar
	mv box-${BOX_VERSION}.phar box.phar

prepare: box.phar
	composer install --no-dev
