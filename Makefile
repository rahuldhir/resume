.PHONY: build
build:
	@docker build -t latex-resume:latest .
	@docker run \
		-i \
		-v `pwd`/src:/data/src \
		-v `pwd`/gen:/data/output \
		--rm \
		--user="`id -u`:`id -g`" \
		--net=none \
		latex-resume:latest \
		latexmk -cd -f -interaction=batchmode -pdf -outdir=/data/output /data/src/resume.tex
	@find ./gen -type f ! -name '*.pdf' -delete

.PHONY: deploy
deploy:
	aws s3 cp ./gen/resume.pdf s3://rahuldhir.com/files/resume.pdf
