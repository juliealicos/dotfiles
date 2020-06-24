let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/WORK/OAM_ENV/trunk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +5057 C_Application/SC_OAM/SWM_SoftwareManagement/src/FCMD_Linux_PPC/FCM_Master.cpp
badd +17 C_Application/SC_OAM/SWM_SoftwareManagement/src/static/FCM_ProgressManager.cpp
badd +1 C_Application/SC_OAM/SWM_SoftwareManagement/src/static/FCM_ConnectionManager_Modifiers.cpp
badd +84 C_Application/SC_OAM/SWM_SoftwareManagement/src/include/SWM_SoftwareManagement/DownloadProgressCalculator.h
badd +59 C_Application/SC_OAM/SWM_SoftwareManagement/src/static/FCMTimer.cpp
badd +24 C_Application/SC_OAM/SWM_SoftwareManagement/src/include/SWM_SoftwareManagement/FCM_ProgressManager.h
badd +30 C_Application/SC_OAM/SWM_SoftwareManagement/src/include/SWM_SoftwareManagement/FCMTimer.h
badd +1878 C_Test/SC_OAM/SWM_SoftwareManagement/MT/test_cases/FSMr2/FCM_Master_Tests.cpp
badd +37471 C_Application/SC_OAM/SWM_SoftwareManagement/SWM_SoftwareManagement_rpy/FSMr2/FCM_Master_1.cls
badd +46 C_Application/SC_OAM/SWM_SoftwareManagement/src/static/FSMr2/FCM/FileContainer.cpp
badd +83 C_Test/SC_OAM/SWM_SoftwareManagement/MT/test_files/FSMr2/TargetBD_WNXXXXX.xml
badd +119 C_Test/SC_OAM/SWM_SoftwareManagement/MT/test_files/FSMr2/TargetBD_WNXXXXX_WithSWUpdateMetaFile.xml
badd +1 C_Test/SC_OAM/SWM_SoftwareManagement/MT/test_files/FSMr2/SWUpdateMeta_69.xml
badd +93 C_Application/SC_OAM/SWM_SoftwareManagement/src/include/SWM_SoftwareManagement/FCM_ConnectionManager_Modifiers.h
argglobal
%argdel
edit C_Test/SC_OAM/SWM_SoftwareManagement/MT/test_cases/FSMr2/FCM_Master_Tests.cpp
set splitbelow splitright
set nosplitbelow
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 5504 - ((20 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5504
normal! 0
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
