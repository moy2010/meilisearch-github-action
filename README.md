## Introduction
This GitHub Action starts a Meilisearch server. By default, the Meilisearch server is available on the default port `7700`. You can configure a custom port using the `meilisearch-port` input. The examples show how to use a custom port.

The Meilisearch version must be specified using the `meilisearch-version` input. The used version must exist in the published [`meilisearch` Docker hub tags](https://hub.docker.com/r/getmeili/meilisearch/tags). Default value is `latest`.

This is useful when running tests against a Meilisearch database.


## Usage
Here’s an exemplary GitHub Action using a Meilisearch server in version `25.2` to test a Node.js app:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14.x, 16.x]

    steps:
    - name: Git checkout
      uses: actions/checkout@v2

    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v2
      with:
        node-version: ${{ matrix.node-version }}

    - name: Start Meilisearch
      uses: moy2010/meilisearch-github-action@0.1
      with:
        meilisearch-version: v0.25.2

    - run: npm install

    - run: npm test
      env:
        CI: true
```


### Using a Custom Meilisearch Port
You can start the Meilisearch instance on a custom port. Use the `meilisearch-port: 12345` input to configure port `12345` for Meilisearch. Replace `12345` with the port you want to use in your test runs.

The following example starts a Meilisearch server on port `42069`:

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14.x, 16.x]

    steps:
    - name: Git checkout
      uses: actions/checkout@v2

    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v2
      with:
        node-version: ${{ matrix.node-version }}

    - name: Start Meilisearch
      uses: moy2010/meilisearch-github-action@0.1
      with:
        meilisearch-version: v0.25.2
        meilisearch-port: 42069

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: npm test
      env:
        CI: true
```

### Using a Custom Meilisearch API Key
You can also provide a custom API to the Meilisearch instance.

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        node-version: [14.x, 16.x]

    steps:
    - name: Git checkout
      uses: actions/checkout@v2

    - name: Use Node.js ${{ matrix.node-version }}
      uses: actions/setup-node@v2
      with:
        node-version: ${{ matrix.node-version }}

    - name: Start Meilisearch
      uses: moy2010/meilisearch-github-action@0.1
      with:
        meilisearch-version: v0.25.2
        meilisearch-port: 42069
        meilisearch-api-key: test-api-key

    - name: Install dependencies
      run: npm install

    - name: Run tests
      run: npm test
      env:
        CI: true
```

## License
MIT © [Moises Garcia](https://github.com/moy2010)