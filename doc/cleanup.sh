#!/bin/bash

if [[ $# > 0 ]]; then
	cd $1
fi
rm -f *.aux *.bcf *.blg *.fdb* *.fls *.log *.out *.xml *.gz

echo Clean!