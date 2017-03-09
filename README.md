# Mypy test

This shows a situation in which mypy fails attempting to load a relative 
import from inside a package (see https://github.com/python/mypy/issues/2974)

Run `./test.sh` to see the failure.

Here is the output from my run:

```
Versions
Python 3.6.0
mypy 0.501

python -m project.cli
hello

Mypy from root (both should pass)
mypy -m project.cli
project/cli.py:5: error: Missing return statement
mypy project/cli.py
project/cli.py:5: error: Missing return statement
set +v

Mypy from inside project (both fail)
mypy -m cli
Traceback (most recent call last):
  File "/usr/bin/mypy", line 6, in <module>
    main(__file__)
  File "/usr/lib/python3.6/site-packages/mypy/main.py", line 42, in main
    res = type_check_only(sources, bin_dir, options)
  File "/usr/lib/python3.6/site-packages/mypy/main.py", line 86, in type_check_only
    options=options)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 183, in build
    dispatch(sources, manager)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1523, in dispatch
    graph = load_graph(sources, manager)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1629, in load_graph
    ancestor_for=st)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1119, in __init__
    assert id or path or source is not None, "Neither id, path nor source given"
AssertionError: Neither id, path nor source given
mypy cli.py
Traceback (most recent call last):
  File "/usr/bin/mypy", line 6, in <module>
    main(__file__)
  File "/usr/lib/python3.6/site-packages/mypy/main.py", line 42, in main
    res = type_check_only(sources, bin_dir, options)
  File "/usr/lib/python3.6/site-packages/mypy/main.py", line 86, in type_check_only
    options=options)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 183, in build
    dispatch(sources, manager)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1523, in dispatch
    graph = load_graph(sources, manager)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1629, in load_graph
    ancestor_for=st)
  File "/usr/lib/python3.6/site-packages/mypy/build.py", line 1119, in __init__
    assert id or path or source is not None, "Neither id, path nor source given"
AssertionError: Neither id, path nor source given
set +v
```

