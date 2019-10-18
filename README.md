# go-slip44

[![Tag](https://img.shields.io/github/tag/wealdtech/go-slip44.svg)](https://github.com/wealdtech/go-coincodec/releases/)
[![License](https://img.shields.io/github/license/wealdtech/go-slip44.svg)](LICENSE)
[![GoDoc](https://godoc.org/github.com/wealdtech/go-slip44?status.svg)](https://godoc.org/github.com/wealdtech/go-coincodec)
[![Travis CI](https://img.shields.io/travis/wealdtech/go-slip44.svg)](https://travis-ci.org/wealdtech/go-coincodec)
[![codecov.io](https://img.shields.io/codecov/c/github/wealdtech/go-slip44.svg)](https://codecov.io/github/wealdtech/go-coincodec)

Go utility library to provide [SLIP-0044](https://github.com/satoshilabs/slips/blob/master/slip-0044.md) values for coins.

All data is derived directly from the above-linked document so any changes required should be carried out there.

## Table of Contents

- [Install](#install)
- [Usage](#usage)
- [Maintainers](#maintainers)
- [Contribute](#contribute)
- [License](#license)

## Install

`go-slip44` is a standard Go module which can be installed with:

```sh
go get github.com/wealdtech/go-slip44
```

## Usage

### Example

```go
import (
    fmt

    slip44 "github.com/wealdtech/go-slip44"
)

func main() {
    fmt.Printf("SLIP44 coin type for Ethereum is %d\n", slip44.ETHER)
}
```

## Maintainers

Jim McDonald: [@mcdee](https://github.com/mcdee).

## Contribute

Contributions welcome. Please check out [the issues](https://github.com/wealdtech/go-slip44/issues).

## License

[Apache-2.0](LICENSE) © 2019 Weald Technology Trading Ltd
