# DNotes – File-Based Note Manager  

A simple note manager built with **D language**.  

## Features  
- Add, list, and delete notes  
- Stores notes persistently in `notes.json`  
- Command-line interface  

## Run  
```sh
dmd dnotes.d -of=dnotes
./dnotes add "Buy milk"
./dnotes list
./dnotes delete 1
