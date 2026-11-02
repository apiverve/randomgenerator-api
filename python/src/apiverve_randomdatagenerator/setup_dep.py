from setuptools import setup, find_packages

setup(
    name='apiverve_randomdatagenerator',
    version='1.2.4',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Random Data Generator produces random numbers in any range (whole or decimal, with or without repeats), dice of any size, coin flips, booleans, random strings, UUIDs, and mock names, emails, addresses and dates for application testing. Numbers, dice, coins, booleans and strings come from a cryptographically secure generator. Paid plans can generate batches up to 100 items.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/randomgenerator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
