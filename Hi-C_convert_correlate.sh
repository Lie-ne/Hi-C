hicConvertFormat -m opt/rep1/aligned/inter_30.hic opt/rep2/aligned/inter_30.hic --inputFormat hic --outputFormat cool -o rep1 rep2

hicCorrelate -m rep1.mcool rep2.mcool --method=spearman 
--outFileNameHeatmap rep_corr_spearman_heatmap --outFileNameScatter rep_corr_spearman_scatterplot --plotFileFormat png --chromosomes 2R 2L 3R 3L X

hicCorrelate -m rep1.mcool rep2.mcool --method=pearson 
--outFileNameHeatmap rep_corr_pearson_heatmap --outFileNameScatter rep_corr_pearson_scatterplot --plotFileFormat png --chromosomes 2R 2L 3R 3L X