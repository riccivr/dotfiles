#!/bin/bash

#/ Author: Ricardo Veronese Ricci <ricci.vr@gmail.com>
#/ Usage: folder-color.sh <color>
#/ changes all the folders icons color to the one you set, current development for the numix icons only
#/
#/ the script requires super user priviledge
#/
#/ Copyright (C) 2015
#/ This program is free software: you can redistribute it and/or modify
#/ it under the terms of the GNU General Public License (version 3+) as
#/ published by the Free Software Foundation. You should have received
#/ a copy of the GNU General Public License along with this program.
#/ If not, see <http://www.gnu.org/licenses/>.

if [ -z "$1" ]; then
    :
else
    case "$1" in
        -c|--colours)
            echo -e \
                "This is a list of currently supported folder\n" \
                "\rcolours that can be used to replace the default.\n\n" \
                "\rdefault - reverts any previous colour change\n" \
                "\rblue    - 42a5f5\n" \
                "\rbrown   - 8d6e63\n" \
                "\rgreen   - 66bb6a\n" \
                "\rgrey    - bdbdbd\n" \
                "\rorange  - f57c00\n" \
                "\rpink    - f06292\n" \
                "\rpurple  - 7e57c2\n" \
                "\rred     - ef5350\n" \
                "\ryellow  - ffca28\n"
            sucess ;;
