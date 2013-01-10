#$Id: dieIfNotRoot.sh 1161 2013-01-03 10:28:56Z gab $
function dieIfNotRoot { # Exit calling script if not running under root
	! gotRoot && echo "[__libname__] Actually, I should be run as root" && exit 1
	! underSudo && echo "[__libname__] Actually, I should be run under sudo" && exit 1
	return 0
}
function dieIfRoot { # Exit calling script if run under root
	gotRoot && echo "[__libname__] I should not be run as root" && exit 1
	underSudo && echo "[__libname__] I should not be run under sudo" && exit 1
	return 0
}
function underSudo { # Return wether the calling script is run under sudo
	[ -n "$SUDO_USER" ]
}
function gotRoot { # Return wether the calling script is run under root
	[ $(id -u) -eq 0 ]
}