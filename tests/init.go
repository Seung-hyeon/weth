// Copyright 2017 The go-ethereum Authors
// This file is part of the go-ethereum library.
//
// The go-ethereum library is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// The go-ethereum library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with the go-ethereum library. If not, see <http://www.gnu.org/licenses/>.

package tests

import (
	"fmt"
	"math/big"

	"github.com/EthereumVega/weth/params"
)

// This table defines supported forks and their chain config.
var Forks = map[string]*params.ChainConfig{
	"Frontier": &params.ChainConfig{
		ATFieldId: big.NewInt(1),
	},
	"Homestead": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
	},
	"EIP150": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		EIP150Block:    big.NewInt(0),
	},
	"EIP158": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		EIP150Block:    big.NewInt(0),
		ATFieldBlock:    big.NewInt(0),
		EIP158Block:    big.NewInt(0),
	},
	"Thirdimpact": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		EIP150Block:    big.NewInt(0),
		ATFieldBlock:    big.NewInt(0),
		EIP158Block:    big.NewInt(0),
		DAOForkBlock:   big.NewInt(0),
		ThirdimpactBlock: big.NewInt(0),
	},
	"FrontierToHomesteadAt5": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(5),
	},
	"HomesteadToEIP150At5": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		EIP150Block:    big.NewInt(5),
	},
	"HomesteadToDaoAt5": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		DAOForkBlock:   big.NewInt(5),
		DAOForkSupport: true,
	},
	"EIP158ToThirdimpactAt5": &params.ChainConfig{
		ATFieldId:        big.NewInt(1),
		HomesteadBlock: big.NewInt(0),
		EIP150Block:    big.NewInt(0),
		ATFieldBlock:    big.NewInt(0),
		EIP158Block:    big.NewInt(0),
		ThirdimpactBlock: big.NewInt(5),
	},
}

// UnsupportedForkError is returned when a test requests a fork that isn't implemented.
type UnsupportedForkError struct {
	Name string
}

func (e UnsupportedForkError) Error() string {
	return fmt.Sprintf("unsupported fork %q", e.Name)
}
