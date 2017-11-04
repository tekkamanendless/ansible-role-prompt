dependencies:
	pip install -U -r requirements.txt

dev-dependencies: dependencies
	pip install -U -r requirements-dev.txt

lint: dev-dependencies lint-docstring
	echo "Code Linting Not Implemented"

lint-docstring: dev-dependencies
	echo "DocString Linting Not Implemented"

test: clean dev-dependencies lint
	python -m unittest discover

coverage: clean dev-dependencies lint
	coverage run --source action_plugins test
	coverage html

clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	find . -name '*.retry' -exec rm -f {} +

.PHONY : dependencies dev-dependencies lint lint-docstring test coverage clean
