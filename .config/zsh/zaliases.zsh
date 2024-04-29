#!/usr/bin/zsh

if command -v bat >/dev/null; then
  alias cat="bat -p"
fi

if command -v eza >/dev/null; then
  alias ls="eza --group-directories-first --all"
fi

pdfcompress() {
  gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1
}

pdfcombine() {
  gs -q -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=${1%.*}.pdf -dBATCH ${@:2}
}

tohex() {
  printf "%X\n" $@
}

todec() {
  printf "%d\n" $@
}

gh_dl() {
  if command -v wget >/dev/null; then
    wget --content-disposition $@
  else
    curl -LJO $@
  fi
}

alias ttd='tt -csv >> ~/.local/share/wpm.csv'
