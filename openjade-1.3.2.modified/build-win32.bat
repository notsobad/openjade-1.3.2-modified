nmake -f sp-generate.mak
nmake -f jade-generate.mak
msdev jade.dsw /make "all - win32 release"
