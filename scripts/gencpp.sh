#! /bin/sh

if [ $# -lt 2 ]; then
    echo "Usage: $0 <file-name> <link-to-the-problem>"
    exit 1
fi

if [ -e $1 ]; then
    echo "$1 already exists"
    exit 1
fi

filename="$(echo $1 | sed 's/\(.cpp\)*$/.cpp/g')"
cat << EOF >> $filename
// Link to the problem
// $2

#include <iostream>

using namespace std;

int main() {
    return 0;
}
EOF
