LC := latexmk -xelatex
OUTDIR := output

.PHONY: all outlines reports presentation1 outline1 report1 clean mrproper

all: presentation1

outlines: outline1
reports: report1

presentation1: outline1 report1
outline1: $(OUTDIR)/outline1.pdf
report1: $(OUTDIR)/report1.pdf

$(OUTDIR)/%.pdf: %.tex
	mkdir -p $(OUTDIR)
	$(LC) -output-directory=$(OUTDIR) -shell-escape $<

clean:
	$(RM) $(OUTDIR)/*.{aux,log,out,toc,xdv,fls,fdb_latexmk}

mrproper:
	$(RM) -r $(OUTDIR)
