clean:
	@echo '? Cleaning old build'
	rm -rf public

build: clean
	@echo '? Generating site'
	hugo --gc

serve: clean
	@echo '? Initiating local server'
	hugo --gc server
