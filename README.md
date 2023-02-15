# DCVC-inhibits-LPS-inflammation-transcriptomic-pathways-in-macrophage-cell-model

## Abstract

**Background**:Studies have shown that the trichloroethylene metabolite S-(1,2-dichlorovinyl)-l-cysteine (DCVC) inhibits cytokine secretion in pathogen stimulated fetal membrane tissue but little is known about the mechanism for these effects, including which cell types or transcriptomic pathways are impacted. Macrophages play a critical role in fetal membrane immune responses during infection. We tested the hypothesis that DCVC inhibits lipopolysaccharide (LPS) stimulated inflammation pathways in macrophage-like THP-1 cells. **Methods**: We treated THP-1 cells for 24 h then treated with 1, 5, or 10 μM DCVC for 24 h. After a 4 h incubation with lipopolysaccharide (LPS), we collected RNA and cell media. We performed transcriptomic analysis using RNA sequencing for 5 μM DCVC treatments and quantified cytokine release (IL-1β, IL-6, and TNF-α) for 1, 5 and 10 μM DCVC treatments. **Results**: RNA sequencing analysis revealed 1399 differentially expressed genes (FDR < 0.05 and log 2 fold change magnitude>2.5) in cells co-treated with DCVC and LPS compared to LPS alone. For example, TNF had a log2(fold-change) = -3.5 with the addition of DCVC. Pathways downregulated (adjusted p-value<0.05) in DCVC+LPS treatments versus LPS-only treatments included: "acute inflammatory response", "production of molecular mediator of immune response" and "phagocytosis". LPS increased IL-1β, IL-6, and TNF-α levels in culture media (p < 0.001), but this was inhibited by co-treatment with DCVC (p < 0.001 for LPS vs. LPS + DCVC treatments). **Conclusion**: Our results demonstrate that DCVC suppresses inflammatory responses in macrophages.

## Citation Information

Harris S, Bakulski KM, Dou J, Houskamp E, Sheeres EC, Schellenboom E, Harlow O, Loch-Caruso R, Boldenow E. 2022. The trichloroethylene metabolite S-(1,2-dichlorovinyl)-l-cysteine inhibits lipopolysaccharide-induced inflammation transcriptomic pathways and cytokine secretion in a macrophage cell model. Toxicology In Vitro. PMID: 35811015. DOI: 10.1016/j.tiv.2022.105429

## Script files

01_fastqc.sh: using fastqc and multiqc to QC the raw RNA-sequencing data

02_star.sh: Aligning RNA sequencing data to human genome

03_QoRTs.sh: Quality control for aligned data

04_QoRTs_plots.R: Saving complied QC plots

05_featureCounts.sh: Generating gene counts data

06_diff_exp_analysis.Rmd: differential expression analysis 




