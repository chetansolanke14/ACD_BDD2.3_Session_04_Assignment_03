ip_data = LOAD 'word-count.txt' AS(line:Chararray);
words = FOREACH ip_data GENERATE FLATTEN(TOKENIZE(line,' ')) AS word;
Grouped = GROUP words BY word;
wordcount = FOREACH Grouped GENERATE group, COUNT(words);
STORE wordcount INTO  '/home/acadgild/LocalFS/pigop1/wordcountop';
