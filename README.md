# Assignment1

Submitted by G V Ganesh Maurya - 2024201030

### Question-1
#### Algorithm

- To remove empty lines: Initially use ```grep``` to filter out the empty lines.
- Then pass the output of this into ```awk``` and then into ```empty_lines.txt``` file.
- To remove duplicates: Sort the lines from previous question's output and then take the ```uniq``` lines.
- For getting the person names: Use ```awk``` and separate the lines into 2 parts with '~' as delimiter.
- For getting the frequency: Use a map to get people data with the above persons file and then add the frequency.

#### Code to run the code for Q1

To run the code please use the below commands

To compile the bash program
```bash
  ./2024201030_Q1.sh
```
The respective output files will be created and we can verify the output.
### Question-2
#### Algorithm

- For generating the password: Keep a special characters, lowercase, uppercase alphabets string.
- Generate random number and pick 1 element from each string.
- Similarly pick the remaining letters and the shuffle the entire password in the last.

- For generating the account number: First create a hashmap with all the numbers in it and an initial frequency of 3.
- Every time we use a number and add it to account number and reduce the frequency.
- Run a second loop to check if there is a Fibonacci pattern. 
- Update the number if there is a Fibonacci pattern.
- Repetitions upto 3 consecutive numbers are allowed so our hashmap will take care of it.
- At max one number appears 3 times, either consecutively or randomly.

#### Code to run the code for Q2

To run the code please use the below commands

To compile the bash program
```bash
  ./2024201030_Q2a.sh
  ./2024201030_Q2b.sh
```

### Question-3
#### Algorithm

- Use ```ls -l``` and check with ```grep``` whether the line is a directory or file. If it is folder then print it.
- For the second part use ```du``` command to get the directories of depth 1 and return the size in human readable form.
- Sort based on size and then print all the directories.
- Use ```grep``` and then print only the folders containing './' (Since these are the ones visible to us. We must ignore hidden files).

### Code to run the code for Q3

To run the code please use the below commands. Make sure you have some folders 

To compile the bash program
```bash
  ./2024201030_Q3.sh
```

### Question-4
#### Algorithm

- Make a new directory to store our created files.
- Use ```touch temp{1..50}.sh``` to create the 50 files.
- Next rename the files using ```mv``` command.

### Code to run the code for Q4

To run the code please use the below commands

To compile the bash program
```bash
  ./2024201030_Q4.sh
```