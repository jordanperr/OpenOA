
Contributing 
============

## Issue Tracking

New feature requests, changes, enhancements, non-methodology features, and bug reports can be filed as new issues in the
[Github.com issue tracker](https://github.com/NREL/OpenOA/issues) at any time. Please be sure to fully describe the
issue.

For other issues, please email the OpenOA distribution list at `openoa@nrel.gov`.

## Repository Layout

The OpenOA repository is hosted on Github, and located here: http://github.com/NREL/OpenOA

This repository is organized using a modified git-flow system. Branches are organized as follows:

- master: Current stable release
- develop: Current development branch

- release/xxx: Development branches targeting a specific release. Tests should pass, but code may be unstable.
- feature/issue-xxx: Branch of develop or release branch. Must reference a github issue number.
Features branches are not automatically tested and may contain broken code. Feel free to commit broken code to your own branch.

To work on a feature, please make a new feature branch based on the target release branch. If you're working externally
to NREL, please fork OpenOA first and then create a feature branch in your own copy of the repository.
Work out of the feature branch before submitting a pull request. Be sure to periodically merge the target release
branch into your feature branch to avoid conflicts in the pull request.


## Pull Request

Pull requests must be made for any changes to be merged into develop or release branches.
All pull requests should reference an issue from the Github issue tracker.
If an issue does not exist for your pull request, create the issue yourself before initiating a pull request.
Pull requests must include updated documentation and pass all unit tests and integration tests.
In addition, code coverage should not be negatively affected by the pull request. See the Testing section below for
more information about tests.

When you are ready to submit a pull request, please do so through the Github.com UI.

**Scope:** Encapsulate the changes of ideally one, or potentially a couple, issues. It is greatly preferable
to submit three small pull requests than it is to submit one large pull request. Write a complete description of these
changes in the pull request body.

**Tests:** Must pass all tests. Pull requests will be rejected if tests do not pass.

**Documentation:** Include any relevant changes to inline documentation, as well as any changes to the RST files
located in /sphinx.

**Coverage:** The testing framework (described below) will generate a coverage report. Please ensure that any new code
 is fully covered by tests. If a new test must be added, please do so in accordance with the testing section (below).


## Coding Style

This code follows the PEP 8 style guide and uses the ``pycodestyle`` linter to check for compliance.
We have increased the line length limit to 120 characters.

```
pylint --max-line-length=120 operational_analysis
```

## Documentation Style

Documentation is written using RST, and is located both inline and within the /sphinx directory.
Any changes to Python functions, classes, or modules within this codebase must be reflected in the relevant docstring.
The entry-point for Sphinx documentation is sphinx/index.rst.

## Testing

OpenOA uses pytest and the built in unittest framework. To run tests, navigate to the OpenOA directory and run:

```
python setup.py test
```

Tests are located in `test/`. Each python file corresponds to a module in the OpenOA codebase. The modules are prefixed
with one of `[int_|test_]`.

#### Modules:

- `int_` Integration tests. These are tests which generally require input data from an example wind plant and may take
a longer time to run. They also tend to execute code from disparate parts of the codebase.
- `test_` Unit tests. These are tests which operate on one small chunk of the codebase. For example, testing the output
of functions in a toolkit. These tests will require only a small amount of input data, generally embedded in the
 test itself, and are quick to run.
 
#### Test Cases: 
 
Each test module should contain at least one python unittest TestCase. We do not enforce structure within TestCases
beyond common practices. Please read the official documentation for more information on
[Python's unittest framework](https://docs.python.org/3/library/unittest.html).