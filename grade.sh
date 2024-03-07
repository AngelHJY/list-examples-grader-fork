CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
# Assuming we're starting from the end of your provided script

echo "Navigating to student-submission directory"
cd student-submission

echo "Compiling Java files..."
javac -cp "$CPATH" $(find . -name "*.java")

compile_status=$?
if [ $compile_status -ne 0 ]; then
    echo "Feedback: Compilation error. Please check your code for syntax errors."
    exit $compile_status
else
    echo "Compilation successful. Running tests..."
    
    java -cp "$CPATH:." TestListExamples.java

    test_status=$?
    if [ $test_status -ne 0 ]; then
        echo "Some tests failed. Please review your code and test cases."
        exit $test_status
    else
        echo "All tests passed. Great job!"
    fi
fi

