counter=0
for dir in exercise*/;
do
#counter=$((counter+1))
cd $dir
#rm -rf *
#mkdir test_case1 test_case2 test_case3
for file in test_case*/;
do cd $file
#touch input.txt
#touch output.txt
#touch expected_output.txt
#cat output.txt >> expected_output.txt
cd ..
done
#mv input$counter.txt output$counter.txt test_case*/
echo "gg"
cd ..
done
