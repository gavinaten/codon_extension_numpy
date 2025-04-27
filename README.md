## Description

This repo contains a python code example method we would like to compile into a python extension using [Codon](https://github.com/exaloop/codon).

Codon has numpy support in their [docs](https://docs.exaloop.io/codon/interoperability/numpy) around the use of numpy arrays, but it 
seems the numpy support is not present for Codon [python extensions](https://docs.exaloop.io/codon/interoperability/pyext).


Locally, change the `setup.py`line 101 to target either `example.py` or `example.codon`.


To build and run the docker container which aims to create the codon python extension on linux amd64:
`docker compose up --build`


Codon is not able to compile into a shared object because of the ndarray:
```
Attaching to codon_example
codon_example  | Found Codon: /root/.codon
codon_example  | running build_ext
codon_example  | /root/.codon/bin/codon build -release --relocation-model=pic -pyext -o build/lib.linux-x86_64-cpython-310/codon_numpy_example.cpython-310-x86_64-linux-gnu.so.o -module codon_numpy_example example.py
codon_example  | internal.codon:650:36-49: error: 'Ptr[float]' object has no attribute '__to_py__'
codon_example  | ├─ ndarray.codon:310:1-37685: error: during the realization of to_py(slf: ndarray[float,1])
codon_example  | ├─ python.codon:1951:24-42: error: during the realization of __to_py__(self: ndarray[float,1])
codon_example  | ╰─ error: during the realization of wrap_multiple(obj: Ptr[byte], args: Ptr[Ptr[byte]], nargs: int, _kwds: Ptr[byte], T: .toplevel, F: 'example_method_ndarray', M: 0)
codon_example  | error: command '/root/.codon/bin/codon' failed with exit code 1
codon_example exited with code 1
```