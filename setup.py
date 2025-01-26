import numpy
from Cython.Build import cythonize
from setuptools import Extension, setup

extensions = [
    Extension(
        "cnpy.clip",
        ["cnpy/clip.pyx"],
        include_dirs=[numpy.get_include()],
        define_macros=[("NPY_NO_DEPRECATED_API", "NPY_1_7_API_VERSION")],
    ),
]
setup(
    name="cnpy",
    ext_modules=cythonize(extensions, build_dir="src"),
)
