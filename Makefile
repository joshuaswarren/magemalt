all: clean build-vbox

validate:
	packer validate magemalt.json

build: validate
	packer build -only=virtualbox-iso magemalt.json

build-vbox: validate
	packer build -only=virtualbox-iso magemalt.json

clean:
	rm -rf output-*
	rm -rf *.box

clean-all: clean
	rm -rf packer_cache

install:
	vagrant box add magemalt-vbox ./magemalt.box --provider virtualbox --force || true
	vagrant box list | grep magemalt
	@echo Boxes have been installed. Run make clean-all to reclaim disk space.
