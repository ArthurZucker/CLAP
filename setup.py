from setuptools import find_packages, setup

setup(
    name='CLAP',
    version='0.1dev',
    package_dir={"": "src"},
    packages=find_packages("src"),
    license="Apache",
    description='CLAP as a module',
    long_description=open("README.md", "r", encoding="utf-8").read(),
)