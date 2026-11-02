# ==============================================================================
# LaTeX Project Makefile
# ==============================================================================

MAIN ?= main
LATEXMK ?= latexmk
FLAGS ?= -pdf -interaction=nonstopmode -synctex=1 -file-line-error

.PHONY: all pdf watch clean distclean purge count lint help

all: pdf ## Compile document to PDF (default)

pdf: ## Build PDF using latexmk
	$(LATEXMK) $(FLAGS) $(MAIN).tex

watch: ## Continuous compilation mode (auto-recompiles on file save)
	$(LATEXMK) $(FLAGS) -pvc $(MAIN).tex

count: ## Count words in document using texcount
	@echo "=== Word Count Statistics ==="
	@texcount -inc -total $(MAIN).tex 2>/dev/null || echo "texcount not found or failed"

lint: ## Lint LaTeX code with chktex for common syntax/formatting errors
	@echo "=== ChkTeX Linting ==="
	@chktex -q -v0 $(MAIN).tex || true

clean: ## Remove auxiliary compilation files (keeps compiled PDF)
	$(LATEXMK) -c
	@rm -f *.aux *.bbl *.blg *.idx *.ind *.lof *.lot *.out *.toc *.acn *.acr *.alg
	@rm -f *.glg *.glo *.gls *.fls *.log *.fdb_latexmk *.snm *.nav *.synctex.gz *.run.xml *.bcf
	@echo "Auxiliary files cleaned."

distclean purge: clean ## Remove all generated files including output PDF
	$(LATEXMK) -C
	@rm -f $(MAIN).pdf
	@echo "All generated files and PDF removed."

help: ## Show this help message
	@echo "Available commands in this LaTeX project:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'
