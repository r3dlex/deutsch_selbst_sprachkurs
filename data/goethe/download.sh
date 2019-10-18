#!/usr/bin/env sh

pushd `dirname $0`

DOWNLOAD_COMMAND='curl -k -O -J'

function download_from_links() {
  local links=$@
  echo "links=${links[*]}"

  for link in ${links[@]}; do
    ${DOWNLOAD_COMMAND} ${link}
  done
}

#A1
A1_LIST=(\
  https://www.goethe.de/pro/relaunch/prf/en/Pruefungsziele_Testbeschreibung_A1_Fit1.pdf \
  https://www.goethe.de/pro/relaunch/prf/de/A1_SD1_Wortliste_02.pdf \
  https://www.goethe.de/pro/relaunch/prf/en/Pruefungsordnung.pdf \
  https://www.goethe.de/pro/relaunch/prf/en/Durchfuehrungsbestimmungen_A1-A2_Fit_in_Deutsch_1.pdf \
  https://www.goethe.de/pro/relaunch/prf/en/Pruefungsziele_Testbeschreibung_A1_SD1.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A1_sd1/sd_1_modellsatz.pdf \
  http://www2.goethe.de/relaunch/prf/hoerdateien/sd1_modellsatz.mp4 \
  http://www.goethe.de/pro/relaunch/prf/materialien/A1_sd1/sd_1_uebungssatz01.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A1_sd1/sd_1_uebungssatz02.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A1_fit/fit1_uebungssatz_01.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A1_fit/fit1_uebungssatz_02.pdf \
  http://www2.goethe.de/relaunch/prf/hoerdateien/fit1_02_uebungssatz.mp4
  )
# Übungen 
#   http://bfu.goethe.de/a2_mod_2MX5/lesen.php

#A2
A2_LIST=(\
  https://www.goethe.de/pro/relaunch/prf/en/Goethe-Zertifikat_A2_Wortliste.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A2/A2_Modellsatz_Erwachsene.pdf \
  https://www.goethe.de/resources/files/mp434/a2_modellsatz3_x26411.mp4 \
  https://www.goethe.de/pro/relaunch/prf/en/Pruefungsordnung.pdf \
  htttp://www.goethe.de/pro/relaunch/prf/materialienj/A2/A2_Modellsatz_Erwachsene.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/A2_fit/A2_Modellsatz_Jugendliche.pdf \
  http://www2.goethe.de/relaunch/prf/hoerdateien/a2_fit_modellsatz.mp4
)

#B1
B1_LIST=(\
  http://www.goethe.de/pro/relaunch/prf/materialien/B1/b1_modellsatz_erwachsene.pdf \
  http://www.goethe.de/pro/relaunch/prf/materialien/B1/B1_Uebungssatz_Erwachsene.pdf \
  http://www2.goethe.de/relaunch/prf/hoerdateien/b1_modellsatz_erwachsene.mp4 \
  https://www.goethe.de/pro/relaunch/prf/en/Pruefungsordnung.pdf \
  https://www.goethe.de/pro/relaunch/prf/en/Goethe-Zertifikat_B1_Wortliste.pdf
  )
# Übungen 
#   http://bfu.goethe.de/b1_mod/index.php

download_from_links ${A1_LIST[@]}
mv -v Pruefungsordnung.pdf a1_pruefungsordnung.pdf
download_from_links ${A2_LIST[@]}
mv -v Pruefungsordnung.pdf a2_pruefungsordnung.pdf
download_from_links ${B1_LIST[@]}
mv -v Pruefungsordnung.pdf b1_pruefungsordnung.pdf

# Renames all files to lower case
for file in `find`; do 
  mv -vf "${file}" "`echo ${file} | tr '[A-Z]' '[a-z]'`"; 
done

popd
