IMAGE_NAME := blang/latex:ubuntu

.PHONY: default
default:
	@docker run \
		--rm -i \
		--user="`id -u`:`id -g`" \
		--net=none \
		-v `pwd`:/data \
		"$(IMAGE_NAME)" \
		latexmk -cd -f -interaction=batchmode -pdf ./src/resume.tex

.PHONY: upload
upload:
	aws s3 cp ./dist/resume.pdf s3://rahuldhir.com/files/resume.pdf
