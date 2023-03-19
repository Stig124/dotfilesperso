if command -v bat >/dev/null; then
  alias cat=bat
fi

if command -v exa >/dev/null; then
  alias ls="exa --group-directories-first --all"
fi

# if command -v lvim >/dev/null; then
#   alias nvim=lvim
# fi

pdfcompress() {
  gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1
}

pdfcombine() {
  gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${1%.*}.pdf -dBATCH ${@:2}
}

pipenv-base() {
  pipenv -v install --dev yapf pre-commit ruff ipython pyright pylint coverage && pipenv -v install $@
}

startmlv() {
  sudo systemctl daemon-reload ; sudo systemctl start mullvad-daemon
}

tohex() {
  printf "%X\n" $@
}

todec() {
  printf "%d\n" $@
}


alias ttd='tt -csv >> ~/.local/share/wpm.csv'
