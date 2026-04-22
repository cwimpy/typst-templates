# =============================================================================
# NSF Proposal – Build System (PAPPG NSF 24-1)
#
# USAGE:
#   make all            Render every NSF document to _output/
#   make proposal       Render the core narrative documents
#   make supporting     Render the supporting documents
#   make checklist      Render the status checklist only
#   make open           Open all PDFs in _output/ (macOS)
#   make clean          Remove _output/ and all generated files
#   make help           Print this message
#
# REQUIREMENTS:
#   - Quarto (https://quarto.org) installed and on PATH
#   - R with tidyverse, stringr, knitr packages (for checklist)
#   - Typst installed (Quarto installs this automatically)
# =============================================================================

QUARTO   := quarto
OUTDIR   := _output

# All renderable documents (in NSF upload order)
DOCS := project-summary \
        project-description \
        references \
        budget-justification \
        facilities \
        data-management \
        synergistic-activities

.PHONY: all proposal supporting checklist open clean help \
        $(DOCS) mentoring-plan pi-summary current-pending

# ── Primary targets ───────────────────────────────────────────────────────────

## Render all NSF documents + checklist
all: $(DOCS) mentoring-plan pi-summary current-pending checklist
	@echo ""
	@echo "All documents rendered to $(OUTDIR)/"
	@echo ""
	@echo "NSF upload order:"
	@echo "  1. $(OUTDIR)/01-project-summary.pdf"
	@echo "  2. $(OUTDIR)/02-project-description.pdf"
	@echo "  3. $(OUTDIR)/03-references.pdf"
	@echo "  4. Budget (enter directly in Research.gov)"
	@echo "  5. $(OUTDIR)/04-budget-justification.pdf"
	@echo "  6. $(OUTDIR)/05-facilities.pdf"
	@echo "  7. $(OUTDIR)/06-data-management.pdf"
	@echo "  8. $(OUTDIR)/07-synergistic-activities.pdf"
	@echo "  9. $(OUTDIR)/08-mentoring-plan.pdf (if applicable)"
	@echo " 10. Current and Pending (submit via SciENcv)"
	@echo " 11. Letters (upload PDFs obtained separately)"

## Render core narrative documents only (summary + description + references)
proposal: project-summary project-description references
	@echo "Core narrative documents rendered."

## Render supporting documents only
supporting: budget-justification facilities data-management synergistic-activities mentoring-plan
	@echo "Supporting documents rendered."

# ── Individual document targets ───────────────────────────────────────────────

project-summary:
	@echo "Rendering Project Summary..."
	$(QUARTO) render 01-project-summary.qmd
	@echo "  $(OUTDIR)/01-project-summary.pdf"

description: project-description
project-description:
	@echo "Rendering Project Description..."
	$(QUARTO) render 02-project-description.qmd
	@echo "  $(OUTDIR)/02-project-description.pdf"

references:
	@echo "Rendering References Cited..."
	$(QUARTO) render 03-references.qmd
	@echo "  $(OUTDIR)/03-references.pdf"

budget: budget-justification
budget-justification:
	@echo "Rendering Budget Justification..."
	$(QUARTO) render 04-budget-justification.qmd
	@echo "  $(OUTDIR)/04-budget-justification.pdf"

facilities:
	@echo "Rendering Facilities, Equipment & Other Resources..."
	$(QUARTO) render 05-facilities.qmd
	@echo "  $(OUTDIR)/05-facilities.pdf"

data-mgmt: data-management
data-management:
	@echo "Rendering Data Management and Sharing Plan..."
	$(QUARTO) render 06-data-management.qmd
	@echo "  $(OUTDIR)/06-data-management.pdf"

synergistic-activities:
	@echo "Rendering Synergistic Activities..."
	$(QUARTO) render 07-synergistic-activities.qmd
	@echo "  $(OUTDIR)/07-synergistic-activities.pdf"

mentoring-plan:
	@echo "Rendering Mentoring Plan..."
	$(QUARTO) render 08-mentoring-plan.qmd
	@echo "  $(OUTDIR)/08-mentoring-plan.pdf"

pi-summary:
	@echo "Rendering PI Summary..."
	$(QUARTO) render 10-pi-summary.qmd
	@echo "  $(OUTDIR)/10-pi-summary.pdf"

current-pending:
	@echo "Rendering Current and Pending Support..."
	$(QUARTO) render 09-current-pending.qmd
	@echo "  $(OUTDIR)/09-current-pending.pdf"

checklist:
	@echo "Rendering Proposal Checklist..."
	$(QUARTO) render checklist.qmd
	@echo "  $(OUTDIR)/checklist.pdf"
	@echo ""
	@echo "  Review the checklist before submission."

# ── Utility targets ───────────────────────────────────────────────────────────

## Open all rendered PDFs (macOS only)
open:
	@open $(OUTDIR)/*.pdf 2>/dev/null || echo "No PDFs found in $(OUTDIR)/"

## Remove all generated output
clean:
	@echo "Cleaning generated files..."
	@rm -rf $(OUTDIR)
	@rm -rf *_files
	@rm -f *.typ
	@echo "Clean complete."

## Print usage
help:
	@echo ""
	@echo "NSF Proposal – Build System (PAPPG NSF 24-1)"
	@echo "----------------------------------------------------"
	@echo "  make all             Render all documents"
	@echo "  make proposal        Summary + description + references"
	@echo "  make supporting      Budget + facilities + DMP + synergistic"
	@echo "  make checklist       Status checklist only"
	@echo "  make <doc-name>      Single document (see list below)"
	@echo "  make open            Open all PDFs (macOS)"
	@echo "  make clean           Remove _output/ and generated files"
	@echo ""
	@echo "  Individual targets: project-summary, project-description,"
	@echo "  references, budget-justification, facilities,"
	@echo "  data-management, synergistic-activities, mentoring-plan,"
	@echo "  pi-summary, current-pending, checklist"
	@echo ""
