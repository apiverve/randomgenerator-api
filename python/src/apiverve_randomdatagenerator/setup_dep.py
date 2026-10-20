from setuptools import setup, find_packages

setup(
    name='apiverve_randomdatagenerator',
    version='1.2.2',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Random Data Generator produces mock values including names, emails, addresses, dates, and UUIDs for application testing. Specify a supported data type to receive a generated record; paid plans can generate batches up to 100 items.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/randomgenerator?utm_source=pypi&utm_medium=referral&utm_content=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
