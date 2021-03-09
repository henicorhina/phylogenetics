
import re
import pandas as pd

#import contamination file
contamination = pd.read_csv('/Volumes/Brumfield_Lab_Drive/mike_data/UCE_coverage/all_samples_contaminated_loci.csv',
                                index_col='sample')

col_names_all =  ['sample', 'node_name', 'uce_name','formatted']
results_all = pd.DataFrame(columns=col_names_all)

with open('/Volumes/Brumfield_Lab_Drive/mike_data/mike_itero_taxon_list.txt', 'r') as f: 
    data = f.readlines()
    for line in data:
        sample_name = line.split()
        #print(sample_name[0])
        c = contamination.loc[sample_name[0]]
        #c.iloc[0, 4]
        #c.iloc[-4:-1]
        lastz_path = '/Volumes/Brumfield_Lab_Drive/mike_data/4_spades_matches/' + sample_name[0] + '.contigs.lastz'
    
        output_path = '/Volumes/Brumfield_Lab_Drive/mike_data/UCE_coverage/contaminated_uce_loci_csv/' + sample_name[0] + '_contaminated_loci.csv'
        output_numpy = '/Volumes/Brumfield_Lab_Drive/mike_data/UCE_coverage/contaminated_uce_loci_txt/' + sample_name[0] + '_contaminated_loci.txt'

        # import lastz matches file for individual
        lastz_file = pd.read_table(lastz_path,
                                   header=None)
        #print(lastz_file.iloc[0])
        # blank dataframe to save data
        col_names =  ['sample', 'node_name', 'uce_name','formatted']
        results = pd.DataFrame(columns=col_names)
    
        for row in c.itertuples():
            node = row[5]
            #print(node)
            uce = lastz_file.loc[lastz_file[1] == ">"+ node]
            u = uce.iloc[0,6]
            u2 = u[0:12]
            u2 = re.sub('_p1', '', u2)
            u2 = re.sub('_p2', '', u2)
            u2 = re.sub('_p3', '', u2)
            u2 = re.sub('_p4', '', u2)
            u2 = re.sub('_p5', '', u2)
            u2 = re.sub('_p6', '', u2)
            u2 = re.sub(' ', '', u2)
            #str(uce[6])[8:21]
            df = pd.DataFrame([[sample_name[0], node, u2, u2 + '_' + sample_name[0]]], columns=col_names)
            results = results.append(df)
        
        print(sample_name[0])
        print(len(results))
        #save individual sample data to csv
        results.to_csv(path_or_buf=output_path)
        results.iloc[:,3].to_csv(output_numpy, header=None, index=None, mode='a', sep=' ')
        #append data to master file
        results_all = results_all.append(results)
        
    #write all data to csv
    results_all.to_csv(path_or_buf='/Volumes/Brumfield_Lab_Drive/mike_data/UCE_coverage/contaminated_uce_loci_csv/all_samples_contaminated_loci.csv')
    
