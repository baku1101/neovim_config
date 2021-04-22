#!/bin/sh
# templated by http://qiita.com/blackenedgold/items/c9e60e089974392878c8
usage() {
    cat <<HELP
NAME:
   $0 -- {one sentence description}

SYNOPSIS:
  $0 [-h|--help]
  $0 [--verbose]

DESCRIPTION:
第一引数にプラグイン名を取る
.vimとかはつけない

  -h  --help      Print this help.
      --verbose   Enables verbose mode.

EXAMPLE:
  ./vimplugin-setup.sh test

HELP
}

main() {
    SCRIPT_DIR="$(cd $(dirname "$0"); pwd)"

    while [ $# -gt 0 ]; do
        case "$1" in
            --help) usage; exit 0;;
            --verbose) set -x; shift;;
            --) shift; break;;
            -*)
                OPTIND=1
                while getopts h OPT "$1"; do
                    case "$OPT" in
                        h) usage; exit 0;;
                    esac
                done
                shift
                ;;
            *) break;;
        esac
    done

    # do something
	if [ -z $1 ]; then
		echo "input some value"
		exit 0
	fi
	pname=$1".vim"
	mkdir -p $pname/autoload
	mkdir -p $pname/plugin
	mkdir -p $pname/doc
	touch $pname/autoload/$pname
	touch $pname/plugin/$pname
	touch $pname/doc/$1".txt"
	echo "create $pname"
}

main "$@"

