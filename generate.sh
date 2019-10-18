#!/bin/bash

OUTPUT=cointypes.go

cat >${OUTPUT} <<EOSTART
// Copyright © 2019 Weald Technology Trading
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package slip44

const (
EOSTART

while read line
do
  # Ensure this is a real line
  echo $line | egrep -q '^[0-9].*\|..*\|..*\|..*$'
  if [[ $? -ne 0 ]]; then
    continue
  fi

  # Fetch the required items
  ID=$(echo "${line}" |awk -F'|' '{print $1}' | sed -e 's/^ *//' -e 's/ *$//')
  COIN=$(echo "${line}" |awk -F'|' '{print $4}' | sed -e 's/^ *//' -e 's/ *$//')

  # Tidy up the ID
  ID=`echo $ID | sed -e 's/[^0-9]//g'`
  # Tidy up the coin
  COIN=`echo $COIN | sed -e 's/\].*//' -e 's/^\[//' -e 's/ /_/g' -e 's/-/_/g' | tr '[:lower:]' '[:upper:]'`
  # Should only have digits, upper-case numbers and _ at this point
  if [[ ! "${COIN}" =~ ^[0-9A-Z_]+$ ]]; then
    continue
  fi

  # Valid variables must start with A-Z...
  if [[ "${COIN}" =~ ^[A-Z] ]]; then
    echo "${COIN} = uint32(${ID})" >>${OUTPUT}
  fi
done < <(wget -q -O - https://raw.githubusercontent.com/satoshilabs/slips/master/slip-0044.md)

cat >>${OUTPUT} <<EOEND
)
EOEND

gofmt -w ${OUTPUT}
