
#---filenames
elaenia_spectabilis_L42601.0.fasta
elaenia_spectabilis_L42601.1.fasta

#---sequence headers
uce-1938_elaenia_pelzelni_35_LSU7249

#- goal is to replace `_old_name` with file basename
#---for a single fasta file
fname=elaenia_spectabilis_L42601.1.fasta
# creates a variable NAME which stores only the basename (no path) before the defined extention (.fasta)
NAME=$(basename "$fname" '.fasta')
# edits in place (-i) and changes the file
sed -i -E "s/^>(uce-[0-9]+).*$/>\1_$NAME/" $fname
# edits in place (-i) and creates a backup called .fasta.OLD
sed -i.OLD -E "s/^>(uce-[0-9]+).*$/>\1_$NAME/" $fname
# keeps the old file intact, but writes changes to new file
sed -E "s/^>(uce-[0-9]+).*$/>\1_$NAME/" $fname > ${NAME}.renamed.fasta
#---do a loop
for fname in *.fasta; do
    NAME=$(basename "$fname" '.fasta')
    sed -i.OLD -E "s/^>(uce-[0-9]+).*$/>\1_$NAME/" $fname
done

DESCRIPTION

- syntax: ``sed` `"``s/PATTERN/REPLACE``"`
- `sed -r` `"``s/`: sed’s search and replace function, with extended regex (`-r`)
- `^>(uce-[0-9]+).*` — the first search pattern: it’s looking for beginning of line (`^`) starting with `>`, the parenthesis creates a “capture group” that we can reference later. Inside the “capture group” is `uce-`, and a digit any number of times(`[0-9]+`). Then it continues to search for any character (`.*`), until the end of the line (`$`)
  - note that the `>` and anything after uce-NNN (`.*`)is in the search group and will be replaced by the replacement string
- `>\1_$NAME/` — the replacement string. It’s just the arrow (`>`), the capture group (`\1`) which should contain uce-NNNN, underscore (`_`), FILENAME
