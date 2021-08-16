# Vizualize graphical dependencies

## install graphviz

sudo apt install graphviz

## use it and export a pdf
terraform graph | dot -Tpdf > lesson13-dependencies.pdf