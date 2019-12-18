#!/usr/bin/env sh

DATA_DIRECTORY=data/goethe
GEN_DIRECTORY=gen/goethe
ROOT_DIRECTORY=`dirname $0`/..

mkdir -pv ${GEN_DIRECTORY}

pushd ${ROOT_DIRECTORY}
#pushd ${DATA_DIRECTORY}

function run_string_cmd() {
  local cmd=$@
  echo "running cmd = ${cmd}"

  eval ${cmd}
}

function convert_pdf_to_txt() {
  local pdf=$1
  local txt=$2
  local cmd="abiword --to=${txt} ${pdf}"

  run_string_cmd ${cmd}
}

function extract_pdf_pages() {
  local pdf_in=$1
  local pdf_out=$2
  local start=$3
  local end=$4
  local cmd="pdftk ${pdf_in} cat ${start}-${end} output ${pdf_out}"

  run_string_cmd ${cmd}
}

#A2
extract_pdf_pages ${DATA_DIRECTORY}/goethe-zertifikat_a2_wortliste.pdf ${GEN_DIRECTORY}/goethe_a2_wortliste.pdf 8 31
convert_pdf_to_txt ${GEN_DIRECTORY}/goethe_a2_wortliste.pdf goethe_a2_wortliste.txt
mv -fv goethe_a2_wortliste.txt ${GEN_DIRECTORY}/goethe_a2_wortliste.txt

#B1
extract_pdf_pages ${DATA_DIRECTORY}/goethe-zertifikat_b1_wortliste.pdf ${GEN_DIRECTORY}/goethe_b1_wortliste.pdf 16 103
convert_pdf_to_txt ${GEN_DIRECTORY}/goethe_b1_wortliste.pdf goethe_b1_wortliste.txt
mv -fv goethe_b1_wortliste.txt ${GEN_DIRECTORY}/goethe_b1_wortliste.txt

#popd # ${DATA_DIRECTORY}
popd # ${ROOT_DIRECTORY}
