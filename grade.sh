CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then 
    echo "found ListExamples.java"
    cp student-submission/ListExamples.java grading-area
    cp TestListExamples.java grading-area
    cp -r lib grading-area
    
else 
    echo "Not Found"
    exit 
fi

cd grading-area

javac -cp $CPATH  *.java 2> error.txt

if [[ $? -ne 0 ]] 
then 
    echo "Compilation error"
    exit
else 
    echo "Successful compile"
    exit 
fi 

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests